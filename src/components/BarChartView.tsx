'use client';

import {
    BarChart,
    Bar,
    XAxis,
    YAxis,
    CartesianGrid,
    Tooltip,
    ResponsiveContainer,
    Cell
} from 'recharts';

export interface BarChartData {
    id: number;
    name: string;
    votes: number;
    color: string;
    party: string;
}

interface BarChartViewProps {
    data: BarChartData[];
}

export default function BarChartView({ data }: BarChartViewProps) {
    // Sort data descending for the chart if not already
    const sortedData = [...data].sort((a, b) => b.votes - a.votes);

    const CustomTooltip = ({ active, payload }: any) => {
        if (active && payload && payload.length) {
            const d = payload[0].payload;
            return (
                <div className="bg-white border border-gray-200 p-3 rounded-lg shadow-lg">
                    <p className="font-bold text-gray-800">{d.name}</p>
                    <p className="text-sm text-gray-500 mb-1">{d.party}</p>
                    <p className="text-lg font-black" style={{ color: d.color }}>
                        {d.votes.toLocaleString()} Votes
                    </p>
                </div>
            );
        }
        return null;
    };

    return (
        <div className="w-full h-[500px]">
            <ResponsiveContainer width="100%" height="100%">
                <BarChart
                    data={sortedData}
                    layout="vertical"
                    margin={{ top: 10, right: 30, left: 10, bottom: 5 }}
                >
                    <CartesianGrid strokeDasharray="3 3" horizontal={false} stroke="#E5E7EB" />
                    <XAxis type="number" hide />
                    <YAxis
                        type="category"
                        dataKey="name"
                        width={120}
                        axisLine={false}
                        tickLine={false}
                        tick={{ fill: '#374151', fontSize: 13, fontWeight: 600 }}
                    />
                    <Tooltip cursor={{ fill: '#f3f4f6' }} content={<CustomTooltip />} />
                    <Bar
                        dataKey="votes"
                        radius={[0, 4, 4, 0]}
                        animationDuration={1500}
                        animationEasing="ease-out"
                    >
                        {sortedData.map((entry, index) => (
                            <Cell key={`cell-${index}`} fill={entry.color} />
                        ))}
                    </Bar>
                </BarChart>
            </ResponsiveContainer>
        </div>
    );
}
