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

interface DistrictData {
    district: string;
    dominant_color: string;
    dominant_party: string;
    dominant_logo: string;
    total_seats: number;
    winners: ConstituencyWinner[];
}

export default function WinnerMap() {
    const [geoData, setGeoData] = useState<any>(null);
    const [districtData, setDistrictData] = useState<Record<string, DistrictData>>({});
    const [loading, setLoading] = useState(true);
    const [hoveredDistrict, setHoveredDistrict] = useState<any>(null);
    const [transform, setTransform] = useState({ k: 1, x: 0, y: 0 });
    const svgRef = useRef<SVGSVGElement>(null);
    const zoomRef = useRef<any>(null);

    useEffect(() => {
        async function loadData() {
            try {
                // 1. Fetch GeoJSON
                const geoRes = await fetch('https://raw.githubusercontent.com/mesaugat/geoJSON-Nepal/master/nepal-districts-new.geojson');
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
                    const grouped: Record<string, DistrictData> = {};

                    winners.forEach((w: any) => {
                        const distName = w.constituencies?.districts?.name_en;
                        const candidate = w.candidates;
                        const party = candidate?.parties;
                        const constId = w.constituencies?.id;
                        const constNum = w.constituencies?.number;

                        if (!distName || !constId) return;

                        const key = distName.toLowerCase();
                        if (!grouped[key]) {
                            grouped[key] = {
                                district: distName,
                                dominant_color: '#f1f5f9',
                                dominant_party: '',
                                dominant_logo: '',
                                total_seats: 0,
                                winners: []
                            };
                        }

                        grouped[key].winners.push({
                            constituency_id: constId,
                            constituency_number: constNum,
                            candidate_name: candidate?.name_en || 'Unknown',
                            candidate_photo: candidate?.photo_cloudinary_url || '',
                            party_name: party?.name_en || 'Independent',
                            party_color: party?.color_hex || '#6B7280',
                            party_logo: party?.symbol_cloudinary_url || '',
                            votes: w.votes || 0
                        });
                        grouped[key].total_seats = grouped[key].winners.length;
                    });

                    // Determine dominant party per district
                    Object.values(grouped).forEach(dist => {
                        const partyCounts: Record<string, { count: number; color: string; logo: string; name: string }> = {};
                        dist.winners.forEach(w => {
                            if (!partyCounts[w.party_name]) {
                                partyCounts[w.party_name] = { count: 0, color: w.party_color, logo: w.party_logo, name: w.party_name };
                            }
                            partyCounts[w.party_name].count++;
                        });
                        const top = Object.values(partyCounts).sort((a, b) => b.count - a.count)[0];
                        if (top) {
                            dist.dominant_color = top.color;
                            dist.dominant_party = top.name;
                            dist.dominant_logo = top.logo;
                        }
                        // Sort winners by constituency number
                        dist.winners.sort((a, b) => a.constituency_number - b.constituency_number);
                    });

                    // District name normalization
                    const NAME_ALIASES: Record<string, string> = {
                        'eastern rukum': 'rukum east',
                        'western rukum': 'rukum west',
                        'eastern nawalparasi': 'nawalparasi east',
                        'western nawalparasi': 'nawalparasi west',
                    };
                    Object.entries(NAME_ALIASES).forEach(([dbName, geoName]) => {
                        if (grouped[dbName] && !grouped[geoName]) {
                            grouped[geoName] = grouped[dbName];
                        }
                    });

                    setDistrictData(grouped);
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
            const districtName = feature.properties.DIST_EN || feature.properties.DISTRICT || feature.properties.name || '';
            const data = districtData[districtName.toLowerCase()];
            const fillColor = data ? data.dominant_color : '#f1f5f9';
            const centroid = pathGenerator.centroid(feature);

            // Symbol
            let symbolUrl = data?.dominant_logo || '';
            if (!symbolUrl && data) {
                const name = data.dominant_party.toLowerCase();
                if (name.includes('congress')) symbolUrl = '🌳';
                else if (name.includes('swatantra') || name.includes('rsp')) symbolUrl = '🔔';
                else if (name.includes('uml') || name.includes('communist party of nepal')) symbolUrl = '☀️';
                else if (name.includes('maoist') || name.includes('नेपाली कम्युनिष्ट')) symbolUrl = '⭐️';
            }

            return (
                <g key={`${districtName}_${i}`}>
                    <path
                        d={pathGenerator(feature) || ''}
                        fill={fillColor}
                        stroke="#ffffff"
                        strokeWidth={0.5 / transform.k}
                        className="cursor-pointer"
                        onMouseEnter={(e) => {
                            setHoveredDistrict({
                                name: districtName,
                                data: data,
                                x: e.clientX,
                                y: e.clientY
                            });
                        }}
                        onMouseLeave={() => setHoveredDistrict(null)}
                    />
                    {symbolUrl && centroid[0] && centroid[1] && (
                        <g transform={`translate(${centroid[0]},${centroid[1]})`}>
                            {symbolUrl.startsWith('http') ? (
                                <image
                                    href={symbolUrl}
                                    x={-7 / Math.sqrt(transform.k)}
                                    y={-7 / Math.sqrt(transform.k)}
                                    width={14 / Math.sqrt(transform.k)}
                                    height={14 / Math.sqrt(transform.k)}
                                    className="pointer-events-none opacity-90"
                                    preserveAspectRatio="xMidYMid meet"
                                />
                            ) : (
                                <text
                                    textAnchor="middle"
                                    dominantBaseline="central"
                                    fontSize={10 / Math.sqrt(transform.k)}
                                    className="pointer-events-none drop-shadow-sm"
                                >
                                    {symbolUrl}
                                </text>
                            )}
                        </g>
                    )}
                </g>
            );
        });
    }, [geoData, districtData, transform.k]);

    if (loading) {
        return (
            <div className="bg-white rounded-2xl border border-gray-100 p-8 h-[500px] flex items-center justify-center animate-pulse">
                <div className="text-center">
                    <div className="w-12 h-12 border-4 border-indigo-600/30 border-t-indigo-600 rounded-full animate-spin mx-auto mb-4" />
                    <p className="text-gray-400 font-medium">Loading election map...</p>
                </div>
            </div>
        );
    }

    return (
        <div className="relative bg-white rounded-2xl border border-gray-100 shadow-sm overflow-hidden p-4">
            <div className="flex items-center justify-between mb-6 px-4">
                <div>
                    <h3 className="text-gray-900 font-black text-xl">Election Constituency Map</h3>
                    <p className="text-gray-500 text-xs">Use +/− to zoom • Drag to pan • Hover for constituency winners</p>
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
                {hoveredDistrict && (
                    <div
                        className="fixed pointer-events-none bg-white/95 backdrop-blur-md border border-gray-200 p-3 rounded-xl shadow-2xl z-50 min-w-[220px] max-w-[300px]"
                        style={{
                            left: Math.min(hoveredDistrict.x + 20, window.innerWidth - 320),
                            top: Math.max(hoveredDistrict.y - 40, 10)
                        }}
                    >
                        <p className="font-black text-gray-900 text-sm border-b pb-1.5 mb-2">{hoveredDistrict.name}</p>
                        {hoveredDistrict.data ? (
                            <div>
                                {/* Constituency winners list */}
                                <div className="space-y-1.5 max-h-[200px] overflow-y-auto">
                                    {hoveredDistrict.data.winners.map((w: ConstituencyWinner) => (
                                        <div key={w.constituency_id} className="flex items-center gap-2 py-0.5">
                                            {w.candidate_photo ? (
                                                <img src={w.candidate_photo} alt={w.candidate_name} className="w-7 h-7 rounded-full object-cover ring-1 ring-gray-200 flex-shrink-0" />
                                            ) : (
                                                <div className="w-7 h-7 rounded-full bg-gray-200 flex items-center justify-center text-gray-500 text-[10px] font-bold flex-shrink-0">
                                                    {w.candidate_name.charAt(0)}
                                                </div>
                                            )}
                                            <div className="min-w-0 flex-1">
                                                <p className="text-[11px] font-bold text-gray-900 truncate leading-tight">
                                                    <span className="text-gray-400 font-medium">#{w.constituency_number}</span> {w.candidate_name}
                                                </p>
                                                <div className="flex items-center gap-1">
                                                    <div className="w-1.5 h-1.5 rounded-full flex-shrink-0" style={{ backgroundColor: w.party_color }} />
                                                    <p className="text-[9px] font-medium truncate" style={{ color: w.party_color }}>{w.party_name}</p>
                                                </div>
                                            </div>
                                            {w.party_logo && w.party_logo.startsWith('http') && (
                                                <img src={w.party_logo} alt="" className="w-4 h-4 object-contain flex-shrink-0 opacity-70" />
                                            )}
                                        </div>
                                    ))}
                                </div>

                                {/* Summary */}
                                <div className="flex items-center gap-2 pt-1.5 mt-1.5 border-t border-gray-100">
                                    <div className="w-2.5 h-2.5 rounded-full" style={{ backgroundColor: hoveredDistrict.data.dominant_color }} />
                                    <span className="text-[10px] font-bold" style={{ color: hoveredDistrict.data.dominant_color }}>
                                        {hoveredDistrict.data.dominant_party}
                                    </span>
                                    <span className="text-[10px] text-gray-400 ml-auto">
                                        {hoveredDistrict.data.total_seats} seat{hoveredDistrict.data.total_seats > 1 ? 's' : ''}
                                    </span>
                                </div>
                            </div>
                        ) : (
                            <p className="text-[10px] text-gray-400 italic">Counting in progress...</p>
                        )}
                    </div>
                )}
            </div>

            <div className="mt-4 px-4 pb-2 flex flex-wrap gap-x-6 gap-y-2">
                {/* Legend */}
                {Array.from(new Set(Object.values(districtData).map(d => JSON.stringify({ name: d.dominant_party, color: d.dominant_color, logo: d.dominant_logo }))))
                    .slice(0, 8)
                    .map(json => {
                        const p = JSON.parse(json);
                        return (
                            <div key={p.name} className="flex items-center gap-2">
                                <div className="w-2.5 h-2.5 rounded-full shadow-sm" style={{ backgroundColor: p.color }} />
                                <div className="flex items-center gap-1">
                                    {p.logo && p.logo.startsWith('http') ? (
                                        <img src={p.logo} alt={p.name} className="w-4 h-4 object-contain" />
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
