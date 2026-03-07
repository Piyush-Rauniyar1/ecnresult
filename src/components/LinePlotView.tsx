'use client';

import {
    LineChart,
    Line,
    XAxis,
    YAxis,
    CartesianGrid,
    Tooltip,
    Legend,
    ResponsiveContainer
} from 'recharts';

export interface LinePlotData {
    time: string; // e.g. "10:00 AM" or "Dec 12, 10:00"
    [candidateName: string]: string | number; // e.g., "Ram Bahadur": 1200
}

interface LinePlotViewProps {
    data: LinePlotData[];
    candidates: { name: string; color: string; logoUrl?: string }[];
}

export default function LinePlotView({ data, candidates }: LinePlotViewProps) {
    const CustomTooltip = ({ active, payload, label }: any) => {
        if (active && payload && payload.length) {
            return (
                <div className="bg-white border border-gray-200 p-4 rounded-xl shadow-xl min-w-[200px]">
                    <p className="font-bold text-gray-700 border-b pb-2 mb-2">{label}</p>
                    <div className="space-y-1">
                        {payload
                            .sort((a: any, b: any) => b.value - a.value)
                            .map((p: any) => (
                                <div key={p.dataKey} className="flex justify-between items-center text-sm">
                                    <span className="font-medium" style={{ color: p.color }}>{p.dataKey}</span>
                                    <span className="font-black tabular-nums">{p.value.toLocaleString()}</span>
                                </div>
                            ))}
                    </div>
                </div>
            );
        }
        return null;
    };

    return (
        <div className="w-full h-[500px]">
            <ResponsiveContainer width="100%" height="100%">
                <LineChart
                    data={data}
                    margin={{ top: 20, right: 30, left: 20, bottom: 5 }}
                >
                    <CartesianGrid strokeDasharray="3 3" vertical={false} stroke="#E5E7EB" />
                    <XAxis
                        dataKey="time"
                        tickLine={false}
                        axisLine={false}
                        tick={{ fill: '#6B7280', fontSize: 12 }}
                        dy={10}
                    />
                    <YAxis
                        tickLine={false}
                        axisLine={false}
                        tick={{ fill: '#6B7280', fontSize: 12 }}
                        dx={-10}
                    />
                    <Tooltip content={<CustomTooltip />} />
                    <Legend
                        verticalAlign="top"
                        height={36}
                        iconType="circle"
                        wrapperStyle={{ fontSize: '13px', fontWeight: 500 }}
                        formatter={(value, entry: any) => {
                            const cand = candidates.find(c => c.name === value);
                            return (
                                <span className="inline-flex items-center gap-2">
                                    {cand?.logoUrl && (
                                        <img src={cand.logoUrl} alt="" className="w-4 h-4 object-contain rounded" />
                                    )}
                                    {value}
                                </span>
                            );
                        }}
                    />

                    {candidates.map((c) => (
                        <Line
                            key={c.name}
                            type="monotone"
                            dataKey={c.name}
                            stroke={c.color}
                            strokeWidth={3}
                            dot={false}
                            activeDot={{ r: 6, strokeWidth: 0 }}
                            animationDuration={2000}
                        />
                    ))}
                </LineChart>
            </ResponsiveContainer>
        </div>
    );
}
