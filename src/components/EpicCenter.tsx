'use client';

import { useEffect, useState } from 'react';
import { supabaseBrowser } from '@/lib/supabase';
import { Zap, Clock, CheckCircle2 } from 'lucide-react';
import Link from 'next/link';

interface FeedItem {
    id: number;
    name_en: string;
    status: string;
    updated_at: string;
    winner?: {
        name: string;
        party: string;
        color: string;
    };
}

export default function EpicCenter() {
    const [feed, setFeed] = useState<FeedItem[]>([]);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        async function fetchFeed() {
            const selectQuery = `
                id, name_en, status,
                results(
                    is_winner, last_scraped_at,
                    candidates(
                        name_en,
                        parties(name_en, color_hex)
                    )
                )
            `;

            const epicNames = [
                'Jhapa-5', 'Sunsari-1', 'Gulmi-1', 'Bhaktapur-2',
                'Rautahat-1', 'Lalitpur-3', 'Siraha-1', 'Tanahun-1',
                'Gorkha-1', 'Sarlahi-4'
            ];

            const [epicRes, latestRes] = await Promise.all([
                supabaseBrowser
                    .from('constituencies')
                    .select(selectQuery)
                    .in('name_en', epicNames),
                supabaseBrowser
                    .from('constituencies')
                    .select(selectQuery)
                    .order('id', { ascending: false })
                    .limit(10) // fetch more latest to fill in gaps
            ]);

            const combined = [...(epicRes.data || [])];
            const epicIds = new Set(combined.map(c => c.id));
            (latestRes.data || []).forEach(c => {
                if (!epicIds.has(c.id)) combined.push(c);
            });

            if (combined.length > 0) {
                const items: FeedItem[] = combined.slice(0, 12).map((c: any) => {
                    const winnerRow = c.results?.find((r: any) => r.is_winner);
                    return {
                        id: c.id,
                        name_en: c.name_en,
                        status: c.status,
                        updated_at: c.results?.[0]?.last_scraped_at || new Date().toISOString(),
                        winner: winnerRow ? {
                            name: winnerRow.candidates.name_en,
                            party: winnerRow.candidates.parties?.name_en,
                            color: winnerRow.candidates.parties?.color_hex || '#4f46e5'
                        } : undefined
                    };
                });
                setFeed(items);
            }
            setLoading(false);
        }
        fetchFeed();
    }, []);

    if (loading) {
        return (
            <div className="bg-white rounded-2xl border border-gray-100 p-6 h-[400px] animate-pulse">
                <div className="h-4 bg-gray-100 rounded w-32 mb-6" />
                <div className="space-y-4">
                    {[1, 2, 3, 4].map(i => (
                        <div key={i} className="h-12 bg-gray-50 rounded-xl" />
                    ))}
                </div>
            </div>
        );
    }

    return (
        <div className="bg-white rounded-2xl border border-gray-100 shadow-sm overflow-hidden flex flex-col h-full">
            <div className="px-6 py-4 border-b border-gray-50 flex items-center justify-between">
                <div className="flex items-center gap-2">
                    <Zap className="w-5 h-5 text-amber-500 fill-amber-500" />
                    <h3 className="text-gray-900 font-black text-lg">Election Center</h3>
                </div>
                <span className="text-[10px] font-black uppercase tracking-widest text-blue-600 bg-blue-50 px-2.5 py-1 rounded-full">Live Updates</span>
            </div>

            <div className="flex-1 overflow-y-auto p-4 space-y-3 custom-scrollbar">
                {feed.map((item) => (
                    <Link
                        key={item.id}
                        href={`/constituency/${item.id}`}
                        className="group flex flex-col p-3 rounded-xl border border-gray-50 hover:border-indigo-100 hover:bg-indigo-50/30 transition-all duration-300"
                    >
                        <div className="flex items-center justify-between mb-1.5">
                            <span className="font-bold text-gray-900 text-sm group-hover:text-indigo-600 transition-colors">{item.name_en}</span>
                            <div className="flex items-center gap-1.5">
                                <Clock className="w-3 h-3 text-gray-400" />
                                <span className="text-[10px] text-gray-400 font-medium whitespace-nowrap">
                                    {new Date(item.updated_at).toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' })}
                                </span>
                            </div>
                        </div>

                        {item.status === 'declared' && item.winner ? (
                            <div className="flex items-center gap-2">
                                <CheckCircle2 className="w-3.5 h-3.5 text-emerald-500" />
                                <span className="text-xs font-semibold text-gray-600 truncate">
                                    Won by <span className="text-gray-900 font-black">{item.winner.name}</span>
                                </span>
                                <div className="w-2 h-2 rounded-full" style={{ backgroundColor: item.winner.color }} />
                            </div>
                        ) : (
                            <div className="flex items-center gap-2">
                                <div className="w-1.5 h-1.5 bg-blue-400 rounded-full animate-pulse" />
                                <span className="text-[10px] font-bold text-blue-500 uppercase tracking-tight">Counting in Progress</span>
                            </div>
                        )}
                    </Link>
                ))}
            </div>

            <div className="p-4 bg-gray-50/50 border-t border-gray-50">
                <p className="text-[10px] text-gray-400 text-center font-medium uppercase tracking-widest">Showing latest 8 activities</p>
            </div>
        </div>
    );
}
