'use client';

import { useEffect, useState, useMemo, useRef } from 'react';
import * as d3Geo from 'd3-geo';
import * as d3Zoom from 'd3-zoom';
import * as d3Selection from 'd3-selection';
import * as d3Transition from 'd3-transition';
import { supabaseBrowser } from '@/lib/supabase';

interface ConstituencyWinner {
    constituency_id: number;
    constituency_number: number;
    candidate_name: string;
    candidate_photo: string;
    party_name: string;
    party_color: string;
    party_logo: string;
    votes: number;
}

interface ConstituencyData {
    district: string;
    constituency_number: number;
    winner: ConstituencyWinner;
}

export default function WinnerMap() {
    const [geoData, setGeoData] = useState<any>(null);
    const [constituencyData, setConstituencyData] = useState<Record<string, ConstituencyData>>({});
    const [loading, setLoading] = useState(true);
    const [hoveredPolygon, setHoveredPolygon] = useState<any>(null);
    const [transform, setTransform] = useState({ k: 1, x: 0, y: 0 });
    const svgRef = useRef<SVGSVGElement>(null);
    const zoomRef = useRef<any>(null);

    useEffect(() => {
        async function loadData() {
            try {
                // 1. Fetch 165 Constituency GeoJSON from public folder
                const geoRes = await fetch('/nepal-165-constituencies.geojson');
                const geo = await geoRes.json();
                setGeoData(geo);

                // 2. Fetch all constituency-level winners
                const { data: winners } = await supabaseBrowser
                    .from('results')
                    .select(`
                        votes,
                        candidates(
                            name_en,
                            photo_cloudinary_url,
                            is_independent,
                            parties(id, name_en, color_hex, symbol_cloudinary_url)
                        ),
                        constituencies(
                            id, number,
                            districts(name_en)
                        )
                    `)
                    .eq('is_winner', true);

                if (winners) {
                    const mapped: Record<string, ConstituencyData> = {};

                    const NAME_ALIASES: Record<string, string> = {
                        'eastern rukum': 'rukum_e',
                        'western rukum': 'rukum_w',
                        'eastern nawalparasi': 'nawalparasi_e',
                        'western nawalparasi': 'nawalparasi_w',
                        'chitawan': 'chitwan'
                    };

                    winners.forEach((w: any) => {
                        let distName = w.constituencies?.districts?.name_en?.toLowerCase();
                        const candidate = w.candidates;
                        const party = candidate?.parties;
                        const constId = w.constituencies?.id;
                        const constNum = w.constituencies?.number;

                        if (!distName || !constId || !constNum) return;

                        // Normalize mismatching district names (e.g. database has 'eastern rukum', geojson has 'rukum east')
                        if (NAME_ALIASES[distName]) {
                            distName = NAME_ALIASES[distName];
                        }

                        const defaultColor = '#6B7280';
                        const key = `${distName}_${constNum}`;
                        mapped[key] = {
                            district: distName,
                            constituency_number: constNum,
                            winner: {
                                constituency_id: constId,
                                constituency_number: constNum,
                                candidate_name: candidate?.name_en || 'Unknown',
                                candidate_photo: candidate?.photo_cloudinary_url || '',
                                party_name: party?.name_en || 'Independent',
                                party_color: party?.color_hex || defaultColor,
                                party_logo: party?.symbol_cloudinary_url || '',
                                votes: w.votes || 0
                            }
                        };
                    });

                    // Add inverse alias support just in case GeoJSON uses DB names
                    Object.entries(NAME_ALIASES).forEach(([dbName, geoName]) => {
                        // For every constNum 1..5, mirror the key
                        for (let i = 1; i <= 6; i++) {
                            if (mapped[`${dbName}_${i}`] && !mapped[`${geoName}_${i}`]) {
                                mapped[`${geoName}_${i}`] = mapped[`${dbName}_${i}`];
                            }
                            if (mapped[`${geoName}_${i}`] && !mapped[`${dbName}_${i}`]) {
                                mapped[`${dbName}_${i}`] = mapped[`${geoName}_${i}`];
                            }
                        }
                    });

                    setConstituencyData(mapped);
                }
            } catch (err) {
                console.error('Failed to load map data:', err);
            } finally {
                setLoading(false);
            }
        }
        loadData();
    }, []);

    // Setup d3-zoom
    useEffect(() => {
        if (!svgRef.current || loading) return;

        const svg = d3Selection.select(svgRef.current);
        const zoom = d3Zoom.zoom<SVGSVGElement, unknown>()
            .scaleExtent([1, 8])
            .on('zoom', (event: any) => {
                setTransform(event.transform);
            });

        svg.call(zoom);
        zoomRef.current = zoom;
    }, [loading]);

    const handleZoomIn = () => {
        if (!svgRef.current || !zoomRef.current) return;
        d3Selection.select(svgRef.current).transition().duration(300).call(zoomRef.current.scaleBy, 1.5);
    };
    const handleZoomOut = () => {
        if (!svgRef.current || !zoomRef.current) return;
        d3Selection.select(svgRef.current).transition().duration(300).call(zoomRef.current.scaleBy, 0.67);
    };
    const handleZoomReset = () => {
        if (!svgRef.current || !zoomRef.current) return;
        d3Selection.select(svgRef.current).transition().duration(300).call(zoomRef.current.transform, d3Zoom.zoomIdentity);
    };

    const mapElements = useMemo(() => {
        if (!geoData) return null;

        const width = 800;
        const height = 450;
        const projection = d3Geo.geoMercator().fitSize([width, height], geoData);
        const pathGenerator = d3Geo.geoPath().projection(projection);

        return geoData.features.map((feature: any, i: number) => {
            let districtName = feature.properties.DIST_EN || feature.properties.DISTRICT || feature.properties.name || '';
            districtName = districtName.toLowerCase();
            const conNum = feature.properties.CON;

            // Map alias cleanup directly on geojson reading
            if (districtName === 'chitawan') districtName = 'chitwan';

            const key = `${districtName}_${conNum}`;
            const data = constituencyData[key];
            const fillColor = data ? data.winner.party_color : '#f1f5f9';
            const centroid = pathGenerator.centroid(feature);

            // Determine Symbol to show on the physical polygon
            let symbolUrl = data?.winner.party_logo || '';
            if (!symbolUrl && data) {
                const name = data.winner.party_name.toLowerCase();
                if (name.includes('congress')) symbolUrl = '🌳';
                else if (name.includes('swatantra') || name.includes('rsp')) symbolUrl = '🔔';
                else if (name.includes('uml') || name.includes('communist party of nepal')) symbolUrl = '☀️';
                else if (name.includes('maoist') || name.includes('नेपाली कम्युनिष्ट')) symbolUrl = '⭐️';
            }

            return (
                <g key={`${districtName}_${conNum}_${i}`}>
                    <path
                        d={pathGenerator(feature) || ''}
                        fill={fillColor}
                        stroke="#ffffff"
                        strokeWidth={0.5 / transform.k}
                        className="cursor-pointer hover:opacity-90 transition-opacity"
                        onMouseEnter={(e) => {
                            setHoveredPolygon({
                                displayTitle: `${districtName.toUpperCase()} - ${conNum}`,
                                data: data,
                                x: e.clientX,
                                y: e.clientY
                            });
                        }}
                        onMouseLeave={() => setHoveredPolygon(null)}
                    />
                    {symbolUrl && centroid[0] && centroid[1] && transform.k > 1.5 && ( // Only show symbols if zoomed in enough since polygons are tiny
                        <g transform={`translate(${centroid[0]},${centroid[1]})`}>
                            {symbolUrl.startsWith('http') ? (
                                <image
                                    href={symbolUrl}
                                    x={-4 / Math.sqrt(transform.k)}
                                    y={-4 / Math.sqrt(transform.k)}
                                    width={8 / Math.sqrt(transform.k)}
                                    height={8 / Math.sqrt(transform.k)}
                                    className="pointer-events-none opacity-80"
                                    preserveAspectRatio="xMidYMid meet"
                                />
                            ) : (
                                <text
                                    textAnchor="middle"
                                    dominantBaseline="central"
                                    fontSize={6 / Math.sqrt(transform.k)}
                                    className="pointer-events-none drop-shadow-sm opacity-80"
                                >
                                    {symbolUrl}
                                </text>
                            )}
                        </g>
                    )}
                </g>
            );
        });
    }, [geoData, constituencyData, transform.k]);

    if (loading) {
        return (
            <div className="bg-white rounded-2xl border border-gray-100 p-8 h-[500px] flex items-center justify-center animate-pulse">
                <div className="text-center">
                    <div className="w-12 h-12 border-4 border-indigo-600/30 border-t-indigo-600 rounded-full animate-spin mx-auto mb-4" />
                    <p className="text-gray-400 font-medium">Loading precise 165-constituency map...</p>
                </div>
            </div>
        );
    }

    return (
        <div className="relative bg-white rounded-2xl border border-gray-100 shadow-sm overflow-hidden p-4">
            <div className="flex items-center justify-between mb-6 px-4">
                <div>
                    <h3 className="text-gray-900 font-black text-xl">165 Constituency Extent Map</h3>
                    <p className="text-gray-500 text-xs">Use +/− to zoom • Drag to pan • Hover a seat for winner context</p>
                </div>
                <div className="flex gap-4">
                    <div className="flex items-center gap-2">
                        <div className="w-3 h-3 rounded-full bg-slate-100 border border-slate-200" />
                        <span className="text-[10px] font-bold text-gray-400">Undecided</span>
                    </div>
                </div>
            </div>

            <div className="relative overflow-hidden cursor-move touch-none bg-slate-50/50 rounded-xl">
                <svg ref={svgRef} viewBox="0 0 800 450" className="w-full h-auto drop-shadow-sm">
                    <g transform={`translate(${transform.x},${transform.y}) scale(${transform.k})`}>
                        {mapElements}
                    </g>
                </svg>

                {/* Zoom Controls */}
                <div className="absolute top-4 left-4 flex flex-col gap-1.5 pointer-events-none">
                    <button className="pointer-events-auto w-9 h-9 bg-white border border-gray-200 rounded-lg shadow-md flex items-center justify-center font-bold text-xl text-gray-700 hover:bg-gray-50 active:scale-95 transition-all" onClick={handleZoomIn} title="Zoom In">+</button>
                    <button className="pointer-events-auto w-9 h-9 bg-white border border-gray-200 rounded-lg shadow-md flex items-center justify-center font-bold text-xl text-gray-700 hover:bg-gray-50 active:scale-95 transition-all" onClick={handleZoomOut} title="Zoom Out">−</button>
                    <button className="pointer-events-auto w-9 h-9 bg-white border border-gray-200 rounded-lg shadow-md flex items-center justify-center font-bold text-sm text-gray-600 hover:bg-gray-50 active:scale-95 transition-all" onClick={handleZoomReset} title="Reset Zoom">↺</button>
                </div>

                {/* Tooltip */}
                {hoveredPolygon && (
                    <div
                        className="fixed pointer-events-none bg-white/95 backdrop-blur-md border border-gray-200 p-3 rounded-xl shadow-2xl z-50 min-w-[200px]"
                        style={{
                            left: Math.min(hoveredPolygon.x + 20, window.innerWidth - 240),
                            top: Math.max(hoveredPolygon.y - 40, 10)
                        }}
                    >
                        <p className="font-black text-gray-900 text-sm border-b pb-1.5 mb-2">{hoveredPolygon.displayTitle}</p>
                        {hoveredPolygon.data ? (
                            <div className="flex items-center gap-3 py-1">
                                {hoveredPolygon.data.winner.candidate_photo ? (
                                    <img src={hoveredPolygon.data.winner.candidate_photo} alt={hoveredPolygon.data.winner.candidate_name} className="w-10 h-10 rounded-full object-cover ring-2 ring-gray-100 flex-shrink-0" />
                                ) : (
                                    <div className="w-10 h-10 rounded-full bg-gray-100 flex items-center justify-center text-gray-400 font-bold flex-shrink-0">
                                        {hoveredPolygon.data.winner.candidate_name.charAt(0)}
                                    </div>
                                )}
                                <div className="min-w-0 flex-1">
                                    <div className="flex items-center gap-1.5 mb-0.5">
                                        <div className="w-2 h-2 rounded-full flex-shrink-0" style={{ backgroundColor: hoveredPolygon.data.winner.party_color }} />
                                        <p className="text-[10px] font-bold truncate uppercase tracking-wide" style={{ color: hoveredPolygon.data.winner.party_color }}>
                                            {hoveredPolygon.data.winner.party_name}
                                        </p>
                                    </div>
                                    <p className="text-xs font-bold text-gray-900 leading-tight">
                                        {hoveredPolygon.data.winner.candidate_name}
                                    </p>
                                </div>
                            </div>
                        ) : (
                            <p className="text-[10px] text-gray-400 italic">Counting in progress or Not declared...</p>
                        )}
                    </div>
                )}
            </div>

            <div className="mt-4 px-4 pb-2 flex flex-wrap gap-x-6 gap-y-2">
                {/* Generated Unique Parties Legend */}
                {Array.from(new Set(Object.values(constituencyData).map(d => JSON.stringify({ name: d.winner.party_name, color: d.winner.party_color, logo: d.winner.party_logo }))))
                    .slice(0, 8)
                    .map(json => {
                        const p = JSON.parse(json);
                        return (
                            <div key={p.name} className="flex items-center gap-2">
                                <div className="w-2.5 h-2.5 rounded-full shadow-sm" style={{ backgroundColor: p.color }} />
                                <div className="flex items-center gap-1">
                                    {p.logo && p.logo.startsWith('http') ? (
                                        <img src={p.logo} alt={p.name} className="w-4 h-4 object-contain opacity-80" />
                                    ) : null}
                                    <span className="text-[10px] font-black text-gray-600 uppercase tracking-wider">{p.name}</span>
                                </div>
                            </div>
                        );
                    })
                }
            </div>
        </div>
    );
}
