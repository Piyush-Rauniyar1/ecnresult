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
        photo: string;
        party: string;
        color: string;
    };
}

interface CountingSummary {
    total: number;
    declared: number;
    stillCounting: number;
    constituencies: Array<{
        id: number;
        name_en: string;
        status: string;
    }>;
}

export default function EpicCenter() {
    const [feed, setFeed] = useState<FeedItem[]>([]);
    const [countingSummary, setCountingSummary] = useState<CountingSummary | null>(null);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        async function fetchFeed() {
            // Active constituencies being scraped (16 total)
            const activeConstituencies = [3, 4, 19, 26, 33, 34, 35, 36, 68, 85, 84, 93, 37, 96, 127, 128, 121, 149, 9, 79, 111, 124, 125, 126];
            
            const selectQuery = `
                id, name_en, status,
                results(
                    is_winner, last_scraped_at,
                    candidates(
                        name_en, photo_cloudinary_url,
                        parties(name_en, color_hex)
                    )
                )
            `;

            // Fetch ONLY active constituencies
            const { data: countingData, error: countingError } = await supabaseBrowser
                .from('constituencies')
                .select(selectQuery)
                .in('id', activeConstituencies)
                .neq('status', 'declared')
                .order('id');

            if (!countingError && countingData) {
                // Get declared count from active constituencies only
                const { count: declaredCount } = await supabaseBrowser
                    .from('constituencies')
                    .select('*', { count: 'exact', head: true })
                    .in('id', activeConstituencies)
                    .eq('status', 'declared');

                setCountingSummary({
                    total: activeConstituencies.length,
                    declared: declaredCount || 0,
                    stillCounting: countingData.length,
                    constituencies: countingData.map(c => ({ id: c.id, name_en: c.name_en, status: c.status }))
                });

                // Transform counting data to feed items
                const items: FeedItem[] = countingData.map((c: any) => {
                    const winnerRow = c.results?.find((r: any) => r.is_winner);
                    return {
                        id: c.id,
                        name_en: c.name_en,
                        status: c.status,
                        updated_at: c.results?.[0]?.last_scraped_at || new Date().toISOString(),
                        winner: winnerRow ? {
                            name: winnerRow.candidates.name_en,
                            photo: winnerRow.candidates.photo_cloudinary_url,
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

            {/* Counting Summary */}
            {countingSummary && (
                <div className="px-6 py-3 bg-gradient-to-r from-blue-50 to-indigo-50 border-b border-gray-100">
                    <div className="flex items-center justify-between mb-2">
                        <span className="text-sm font-bold text-gray-700">Vote Counting Progress</span>
                        <span className="text-xs text-gray-500">{countingSummary.stillCounting} of {countingSummary.total} remaining</span>
                    </div>
                    <div className="flex items-center gap-4 text-xs">
                        <div className="flex items-center gap-1">
                            <div className="w-2 h-2 bg-green-500 rounded-full"></div>
                            <span className="text-gray-600">Declared: {countingSummary.declared}</span>
                        </div>
                        <div className="flex items-center gap-1">
                            <div className="w-2 h-2 bg-blue-500 rounded-full animate-pulse"></div>
                            <span className="text-gray-600">Counting: {countingSummary.stillCounting}</span>
                        </div>
                    </div>
                </div>
            )}

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

                        <div className="flex items-center gap-2">
                            <div className="w-1.5 h-1.5 bg-blue-400 rounded-full animate-pulse" />
                            <span className="text-[10px] font-bold text-blue-500 uppercase tracking-tight">Counting in Progress</span>
                        </div>
                    </Link>
                ))}
            </div>

            <div className="p-4 bg-gray-50/50 border-t border-gray-50">
                <div className="text-center">
                    <p className="text-[10px] text-gray-400 font-medium uppercase tracking-widest">All constituencies being counted</p>
                    {countingSummary && (
                        <p className="text-[9px] text-gray-500 mt-1">
                            Total: {countingSummary.stillCounting} active counts
                        </p>
                    )}
                </div>
            </div>
        </div>
    );
}
