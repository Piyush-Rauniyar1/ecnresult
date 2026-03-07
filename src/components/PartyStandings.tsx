'use client';

import { useEffect, useState } from 'react';
import {
    BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer, Cell
} from 'recharts';

interface ECNPartyData {
    PartyId: number;
    PoliticalPartyName: string;
    TotWin: number;
    TotLead: number;
    TotWinLead: number;
    SymbolID: number;
}

interface PartyTally {
    abbreviation: string;
    name_np: string;
    color_hex: string;
    seats_won: number;
    seats_lead: number;
    total: number;
}

// Mapping official Nepali names to our standard branding
const PARTY_BRANDING: Record<string, { abbr: string, color: string }> = {
    "राष्ट्रिय स्वतन्त्र पार्टी": { abbr: "RSP", color: "#FF6B00" },
    "नेपाली काँग्रेस": { abbr: "NC", color: "#0047AB" },
    "नेपाल कम्युनिष्ट पार्टी (एकीकृत मार्क्सवादी लेनिनवादी)": { abbr: "UML", color: "#E10600" },
    "नेपाल कम्युनिष्ट पार्टी (माओवादी केन्द्र)": { abbr: "Maoist", color: "#FF0000" },
    "राष्ट्रिय प्रजातन्त्र पार्टी": { abbr: "RPP", color: "#006400" },
    "नेपाली कम्युनिष्ट पार्टी": { abbr: "NCP", color: "#8B0000" },
    "जनमत पार्टी": { abbr: "Janamat", color: "#000080" },
    "श्रम संस्कृति पार्टी": { abbr: "SSP", color: "#FBBF24" },
    "जनता समाजवादी पार्टी, नेपाल": { abbr: "JSPN", color: "#FF1493" },
};

export default function PartyStandings() {
    const [standings, setStandings] = useState<PartyTally[]>([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState<string | null>(null);

    async function fetchStandings() {
        try {
            const res = await fetch('/api/standings');
            if (!res.ok) throw new Error('Failed to fetch official standings');
            const data: ECNPartyData[] = await res.json();

            // Transform official ECN format to our UI spec
            const transformed: PartyTally[] = data.map(pt => {
                const brand = PARTY_BRANDING[pt.PoliticalPartyName] || {
                    abbr: pt.PoliticalPartyName.substring(0, 4),
                    color: '#6366f1'
                };

                return {
                    abbreviation: brand.abbr,
                    name_np: pt.PoliticalPartyName,
                    color_hex: brand.color,
                    seats_won: pt.TotWin,
                    seats_lead: pt.TotLead,
                    total: pt.TotWinLead
                };
            }).sort((a, b) => b.total - a.total); // Sort by total (win+lead)

            setStandings(transformed);
            setLoading(false);
        } catch (err: any) {
            console.error('Error fetching standings:', err);
            setError('Could not load live ECN data');
            setLoading(false);
        }
    }

    useEffect(() => {
        fetchStandings();

        // Poll for updates every 1 minute since it is live official data
        const interval = setInterval(fetchStandings, 60000);
        return () => clearInterval(interval);
    }, []);

    const totalSeats = standings.reduce((s, p) => s + p.seats_won, 0);
    const majority = 83; // 165/2 + 1
    const displayRows = standings.slice(0, 10);

    if (loading) {
        return (
            <div className="col-span-2 bg-gradient-to-br from-gray-900 to-gray-800 rounded-2xl p-6 animate-pulse">
                <div className="h-4 bg-gray-700 rounded w-48 mb-6" />
                <div className="space-y-4">
                    {[1, 2, 3].map(i => <div key={i} className="h-8 bg-gray-700 rounded" />)}
                </div>
            </div>
        );
    }

    if (error) {
        return (
            <div className="col-span-2 bg-gradient-to-br from-gray-900 to-gray-800 rounded-2xl p-6 text-center text-red-400">
                ⚠️ {error}
            </div>
        );
    }

    // Fallback to placeholder when no counting data yet
    if (standings.length === 0 || standings.reduce((a, b) => a + b.total, 0) === 0) {
        const placeholder = [
            PARTY_BRANDING["नेपाली काँग्रेस"],
            PARTY_BRANDING["नेपाल कम्युनिष्ट पार्टी (एकीकृत मार्क्सवादी लेनिनवादी)"],
            PARTY_BRANDING["राष्ट्रिय स्वतन्त्र पार्टी"],
            PARTY_BRANDING["नेपाली कम्युनिष्ट पार्टी"],
        ];

        return (
            <div className="col-span-2 bg-gradient-to-br from-gray-900 via-gray-800 to-gray-900 rounded-2xl shadow-xl overflow-hidden border border-white/5">
                <div className="px-6 pt-5 pb-3 border-b border-white/10 flex items-center justify-between">
                    <div>
                        <h3 className="text-white font-black text-lg tracking-tight">Party Standings – HoR</h3>
                        <p className="text-gray-400 text-xs mt-0.5">Counting has not started · Official ECN API</p>
                    </div>
                    <span className="text-xs bg-amber-500/20 text-amber-300 border border-amber-500/30 px-3 py-1 rounded-full font-semibold">
                        ⏳ Pre-count
                    </span>
                </div>
                <div className="p-6">
                    <p className="text-center text-gray-600 text-xs mt-4">Waiting for ECN to release data...</p>
                </div>
            </div>
        );
    }

    return (
        <div className="col-span-2 bg-gradient-to-br from-gray-900 via-gray-800 to-gray-900 rounded-2xl shadow-xl overflow-hidden border border-white/5">
            {/* Header */}
            <div className="px-8 pt-6 pb-4 border-b border-white/10 flex items-center justify-between">
                <div>
                    <h3 className="text-white font-black text-2xl tracking-tight">Party Standings – HoR</h3>
                    <p className="text-gray-400 text-sm mt-1">
                        {totalSeats} / 165 seats declared · Majority: {majority}
                    </p>
                </div>
                <span className="text-sm bg-green-500/20 text-green-300 border border-green-500/30 px-4 py-1.5 rounded-full font-bold flex items-center gap-2" title="Connected to result.election.gov.np">
                    <span className="w-2 h-2 rounded-full bg-green-400 animate-pulse inline-block" />
                    Official Live ECN
                </span>
            </div>

            <div className="p-6 grid grid-cols-1 lg:grid-cols-5 gap-6">
                {/* Table */}
                <div className="lg:col-span-3">
                    <div className="overflow-x-auto">
                        <table className="w-full text-sm">
                            <thead>
                                <tr className="text-gray-500 text-[11px] uppercase tracking-wider text-right border-b border-white/5">
                                    <th className="text-left pb-3 font-semibold p-2">Party</th>
                                    <th className="pb-3 font-semibold p-2">Win 🏆</th>
                                    <th className="pb-3 font-semibold p-2 hidden sm:table-cell">Lead 🔥</th>
                                    <th className="pb-3 font-semibold p-2 text-white">Total</th>
                                </tr>
                            </thead>
                            <tbody className="divide-y divide-white/5">
                                {displayRows.map((p, i) => (
                                    <tr key={p.abbreviation} className="group hover:bg-white/5 transition-colors text-right">
                                        <td className="py-4 px-3 text-left">
                                            <div className="flex items-center gap-4">
                                                <div className="w-3 h-3 rounded-full flex-shrink-0 shadow-sm" style={{ backgroundColor: p.color_hex }} />
                                                <div className="min-w-0">
                                                    <span className="text-white font-bold block text-lg">{p.abbreviation}</span>
                                                    <span className="text-gray-500 text-xs hidden sm:block truncate mt-0.5" title={p.name_np}>{p.name_np}</span>
                                                </div>
                                            </div>
                                        </td>
                                        <td className="py-4 px-3">
                                            <span className="font-black tabular-nums text-white text-2xl">
                                                {p.seats_won > 0 ? p.seats_won : <span className="text-gray-600">—</span>}
                                            </span>
                                        </td>
                                        <td className="py-4 px-3 hidden sm:table-cell">
                                            <span className="font-bold tabular-nums text-gray-300 text-xl">
                                                {p.seats_lead > 0 ? p.seats_lead : <span className="text-gray-600">—</span>}
                                            </span>
                                        </td>
                                        <td className="py-4 px-3">
                                            <span className="font-black tabular-nums text-3xl" style={{ color: p.total > 0 ? p.color_hex : '#6b7280' }}>
                                                {p.total > 0 ? p.total : <span className="text-gray-600">—</span>}
                                            </span>
                                        </td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    </div>
                </div>

                {/* Bar Chart */}
                <div className="lg:col-span-2 hidden lg:block">
                    <p className="text-gray-400 text-sm uppercase tracking-wider font-bold mb-4">Total Seats (Win + Lead)</p>
                    <ResponsiveContainer width="100%" height={320}>
                        <BarChart
                            data={displayRows.slice(0, 7).map(p => ({ name: p.abbreviation, Total: p.total, color: p.color_hex }))}
                            margin={{ top: 0, right: 0, left: -25, bottom: 0 }}
                        >
                            <CartesianGrid strokeDasharray="3 3" stroke="rgba(255,255,255,0.05)" vertical={false} />
                            <XAxis dataKey="name" tick={{ fill: '#9ca3af', fontSize: 10 }} axisLine={false} tickLine={false} />
                            <YAxis tick={{ fill: '#6b7280', fontSize: 10 }} axisLine={false} tickLine={false} />
                            <Tooltip
                                contentStyle={{ background: '#1f2937', border: '1px solid rgba(255,255,255,0.1)', borderRadius: 8, color: '#fff', fontSize: 12 }}
                                cursor={{ fill: 'rgba(255,255,255,0.04)' }}
                            />
                            <Bar dataKey="Total" radius={[4, 4, 0, 0]}>
                                {displayRows.slice(0, 7).map((p, i) => (
                                    <Cell key={i} fill={p.color_hex} />
                                ))}
                            </Bar>
                        </BarChart>
                    </ResponsiveContainer>

                    {/* Majority line note */}
                    <p className="text-gray-600 text-xs text-center mt-2">Majority line: {majority} seats</p>
                </div>
            </div>

            <div className="px-6 pb-4 border-t border-white/5 pt-3">
                <p className="text-gray-500 text-xs flex items-center gap-2">
                    <span className="text-green-400">●</span> Direct, trusted feed from Election Commission of Nepal
                </p>
            </div>
        </div>
    );
}
