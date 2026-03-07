'use client';

import { useEffect, useState, useMemo, useRef } from 'react';
import { supabaseBrowser } from '@/lib/supabase';
import 'leaflet/dist/leaflet.css';
import { MapContainer, TileLayer, GeoJSON, useMap } from 'react-leaflet';

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

    useEffect(() => {
        async function loadData() {
            try {
                const geoRes = await fetch('/nepal-165-constituencies.geojson');
                const geo = await geoRes.json();
                setGeoData(geo);

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
                        'chitwan': 'chitawan'
                    };

                    winners.forEach((w: any) => {
                        let distName = w.constituencies?.districts?.name_en?.toLowerCase();
                        const candidate = w.candidates;
                        const party = candidate?.parties;
                        const constId = w.constituencies?.id;
                        const constNum = w.constituencies?.number;

                        if (!distName || !constId || !constNum) return;

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

                    Object.entries(NAME_ALIASES).forEach(([dbName, geoName]) => {
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

    const getFeatureStyle = (feature: any) => {
        let districtName = feature.properties.DIST_EN || feature.properties.DISTRICT || feature.properties.name || '';
        districtName = districtName.toLowerCase();
        const conNum = feature.properties.CON;

        if (districtName.includes('national') || districtName.includes('park')) {
            return { weight: 0, fillOpacity: 0 };
        }

        const key = `${districtName}_${conNum}`;
        const data = constituencyData[key];
        const fillColor = data ? data.winner.party_color : '#f1f5f9';

        return {
            fillColor: fillColor,
            weight: 1,
            opacity: 1,
            color: 'white',
            fillOpacity: 0.7
        };
    };

    const onEachFeature = (feature: any, layer: any) => {
        let districtName = feature.properties.DIST_EN || feature.properties.DISTRICT || feature.properties.name || '';
        districtName = districtName.toLowerCase();
        const conNum = feature.properties.CON;

        if (districtName.includes('national') || districtName.includes('park')) return;

        layer.on({
            mouseover: (e: any) => {
                const layer = e.target;
                layer.setStyle({
                    fillOpacity: 0.9,
                    weight: 2
                });

                let displayDistrict = districtName.toUpperCase();
                if (displayDistrict === 'CHITAWAN') displayDistrict = 'CHITWAN';
                if (displayDistrict === 'RUKUM_E') displayDistrict = 'EASTERN RUKUM';
                if (displayDistrict === 'RUKUM_W') displayDistrict = 'WESTERN RUKUM';
                if (displayDistrict === 'NAWALPARASI_E') displayDistrict = 'EASTERN NAWALPARASI';
                if (displayDistrict === 'NAWALPARASI_W') displayDistrict = 'WESTERN NAWALPARASI';

                const key = `${districtName}_${conNum}`;
                const data = constituencyData[key];

                setHoveredPolygon({
                    displayTitle: `${displayDistrict} - ${conNum}`,
                    data: data,
                    x: e.originalEvent.clientX,
                    y: e.originalEvent.clientY
                });
            },
            mouseout: (e: any) => {
                const layer = e.target;
                layer.setStyle({
                    fillOpacity: 0.7,
                    weight: 1
                });
                setHoveredPolygon(null);
            }
        });
    };

    if (loading) {
        return (
            <div className="bg-white rounded-2xl border border-gray-100 p-8 h-[500px] flex items-center justify-center animate-pulse">
                <div className="text-center">
                    <div className="w-12 h-12 border-4 border-indigo-600/30 border-t-indigo-600 rounded-full animate-spin mx-auto mb-4" />
                    <p className="text-gray-400 font-medium">Loading OSM Map Data...</p>
                </div>
            </div>
        );
    }

    // Default center to Nepal
    const nepalCenter: [number, number] = [28.3949, 84.1240];

    return (
        <div className="relative bg-white rounded-2xl border border-gray-100 shadow-sm overflow-hidden p-4">
            <div className="flex items-center justify-between mb-4 px-4">
                <div>
                    <h3 className="text-gray-900 font-black text-xl">165 Constituency Extent Map</h3>
                    <p className="text-gray-500 text-xs">Hover a seat for winner context</p>
                </div>
            </div>

            <div className="relative overflow-hidden bg-slate-50/50 rounded-xl" style={{ height: '450px' }}>
                <MapContainer center={nepalCenter} zoom={6} style={{ height: '100%', width: '100%', borderRadius: '0.75rem' }} scrollWheelZoom={false}>
                    <TileLayer
                        attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
                        url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
                    />
                    {geoData && (
                        <GeoJSON
                            data={geoData}
                            style={getFeatureStyle}
                            onEachFeature={onEachFeature}
                        />
                    )}
                </MapContainer>

                {/* Tooltip */}
                {hoveredPolygon && (
                    <div
                        className="fixed pointer-events-none bg-white/95 backdrop-blur-md border border-gray-200 p-3 rounded-xl shadow-2xl min-w-[200px]"
                        style={{
                            left: Math.min(hoveredPolygon.x + 20, typeof window !== 'undefined' ? window.innerWidth - 240 : 1000),
                            top: Math.max(hoveredPolygon.y - 40, 10),
                            zIndex: 9999
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
                                    <h4 className="font-bold text-gray-900 text-sm truncate">{hoveredPolygon.data.winner.candidate_name}</h4>
                                    <div className="flex items-center gap-1.5 mt-0.5">
                                        <div className="w-2 h-2 rounded-full flex-shrink-0" style={{ backgroundColor: hoveredPolygon.data.winner.party_color }} />
                                        <span className="text-[10px] text-gray-500 font-semibold truncate uppercase tracking-tight">{hoveredPolygon.data.winner.party_name}</span>
                                    </div>
                                </div>
                                <div className="text-right pl-3 border-l border-gray-100">
                                    <p className="text-[10px] text-gray-400 font-medium uppercase mb-0.5">Votes</p>
                                    <p className="font-black text-gray-900 text-sm">{hoveredPolygon.data.winner.votes.toLocaleString()}</p>
                                </div>
                            </div>
                        ) : (
                            <div className="flex flex-col items-center justify-center py-4 text-center">
                                <span className="text-2xl mb-1 opacity-50">🗳️</span>
                                <p className="text-xs font-bold text-gray-400 uppercase tracking-widest">Awaiting Results</p>
                            </div>
                        )}
                    </div>
                )}
            </div>

            <div className="mt-6 flex flex-wrap gap-4 px-4 justify-center items-center">
                <div className="flex items-center gap-2">
                    <div className="w-4 h-4 rounded-full border border-gray-200 bg-slate-100" />
                    <span className="text-[10px] font-bold text-gray-500">UNDECIDED</span>
                </div>
            </div>
        </div>
    );
}
