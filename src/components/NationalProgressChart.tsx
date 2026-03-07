'use client';

import { useEffect, useState } from 'react';
import {
    LineChart,
    Line,
    XAxis,
    YAxis,
    CartesianGrid,
    Tooltip,
    ResponsiveContainer,
    AreaChart,
    Area,
    ReferenceLine
} from 'recharts';
import { supabaseBrowser } from '@/lib/supabase';

interface ProgressData {
    time: string;
    seats: number;
}

export default function NationalProgressChart() {
    const [data, setData] = useState<ProgressData[]>([]);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        async function fetchProgress() {
            // Fetch all winners from declared constituencies
            const { data: results } = await supabaseBrowser
                .from('results')
                .select('last_scraped_at, constituencies(status)')
                .eq('is_winner', true)
                .order('last_scraped_at', { ascending: true });

            if (results) {
                // Filter only declared ones (optional, but safer for "final" progress)
                const declaredResults = results.filter(r => (r.constituencies as any)?.status === 'declared');

                // Group by hour or day and calculate cumulative total
                const progress: ProgressData[] = [];
                let cumulative = 0;

                declaredResults.forEach(r => {
                    cumulative += 1;
                    const date = new Date(r.last_scraped_at);
                    const label = date.toLocaleString('en-US', {
                        month: 'short',
                        day: 'numeric',
                        hour: 'numeric',
                        hour12: true
                    });

                    progress.push({
                        time: label,
                        seats: cumulative
                    });
                });

                // Add a data point for "NOW" to extend the line to the present
                if (progress.length > 0) {
                    const latest = progress[progress.length - 1];
                    progress.push({
                        time: 'Now',
                        seats: latest.seats
                    });
                } else if (progress.length === 0) {
                    progress.push({ time: 'Start', seats: 0 });
                }

                setData(progress);
            }
            setLoading(false);
        }

        fetchProgress();
    }, []);

    if (loading) {
        return (
            <div className="bg-white rounded-2xl border border-gray-100 p-6 h-[300px] animate-pulse">
                <div className="h-4 bg-gray-100 rounded w-48 mb-6" />
                <div className="h-full bg-gray-50 rounded" />
            </div>
        );
    }

    return (
        <div className="bg-white rounded-2xl border border-gray-100 shadow-sm overflow-hidden">
            <div className="px-6 py-4 border-b border-gray-50">
                <h3 className="text-gray-900 font-bold text-lg">Declaration Progress</h3>
                <p className="text-gray-500 text-xs">Cumulative seats declared over time</p>
            </div>

            <div className="p-6 h-[280px]">
                <ResponsiveContainer width="100%" height="100%">
                    <AreaChart data={data}>
                        <defs>
                            <linearGradient id="colorSeats" x1="0" y1="0" x2="0" y2="1">
                                <stop offset="5%" stopColor="#4f46e5" stopOpacity={0.1} />
                                <stop offset="95%" stopColor="#4f46e5" stopOpacity={0} />
                            </linearGradient>
                        </defs>
                        <CartesianGrid strokeDasharray="3 3" vertical={false} stroke="#f1f5f9" />
                        <XAxis
                            dataKey="time"
                            hide={data.length > 50} // Hide labels if too many data points
                            tick={{ fill: '#94a3b8', fontSize: 10 }}
                            axisLine={false}
                            tickLine={false}
                        />
                        <YAxis
                            tick={{ fill: '#94a3b8', fontSize: 10 }}
                            axisLine={false}
                            tickLine={false}
                            domain={[0, 165]}
                            ticks={[0, 41, 83, 124, 165]} // Quarterly markers + majority
                        />
                        <ReferenceLine y={83} stroke="#ef4444" strokeDasharray="3 3" label={{ value: 'Majority (83)', position: 'left', fill: '#ef4444', fontSize: 10, fontWeight: 'bold' }} />
                        <Tooltip
                            contentStyle={{
                                borderRadius: '12px',
                                border: 'none',
                                boxShadow: '0 10px 15px -3px rgb(0 0 0 / 0.1)',
                                fontSize: '12px'
                            }}
                        />
                        <Area
                            type="monotone"
                            dataKey="seats"
                            stroke="#4f46e5"
                            strokeWidth={3}
                            fillOpacity={1}
                            fill="url(#colorSeats)"
                            animationDuration={1500}
                        />
                    </AreaChart>
                </ResponsiveContainer>
            </div>
        </div>
    );
}
