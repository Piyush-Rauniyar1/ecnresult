'use client';

import * as Tabs from '@radix-ui/react-tabs';
import { LayoutGrid, BarChart3, LineChart } from 'lucide-react';

interface ViewSwitcherProps {
    cardsView: React.ReactNode;
    barChartView: React.ReactNode;
    linePlotView: React.ReactNode;
}

export default function ViewSwitcher({ cardsView, barChartView, linePlotView }: ViewSwitcherProps) {
    return (
        <Tabs.Root defaultValue="cards" className="flex flex-col w-full">
            <Tabs.List className="flex shrink-0 border-b border-gray-200 mb-6 space-x-8">
                <Tabs.Trigger
                    value="cards"
                    className="flex items-center pb-3 px-1 border-b-2 border-transparent text-gray-500 hover:text-gray-700 data-[state=active]:border-blue-600 data-[state=active]:text-blue-600 font-medium transition-colors"
                >
                    <LayoutGrid className="w-5 h-5 mr-2" />
                    Cards View
                </Tabs.Trigger>
                <Tabs.Trigger
                    value="bars"
                    className="flex items-center pb-3 px-1 border-b-2 border-transparent text-gray-500 hover:text-gray-700 data-[state=active]:border-blue-600 data-[state=active]:text-blue-600 font-medium transition-colors"
                >
                    <BarChart3 className="w-5 h-5 mr-2" />
                    Bar Chart
                </Tabs.Trigger>
                <Tabs.Trigger
                    value="lines"
                    className="flex items-center pb-3 px-1 border-b-2 border-transparent text-gray-500 hover:text-gray-700 data-[state=active]:border-blue-600 data-[state=active]:text-blue-600 font-medium transition-colors"
                >
                    <LineChart className="w-5 h-5 mr-2" />
                    Timeline
                </Tabs.Trigger>
            </Tabs.List>

            <Tabs.Content value="cards" className="outline-none focus:ring-0">
                {cardsView}
            </Tabs.Content>
            <Tabs.Content value="bars" className="outline-none focus:ring-0">
                <div className="bg-white p-6 rounded-2xl shadow-sm border border-gray-100">
                    {barChartView}
                </div>
            </Tabs.Content>
            <Tabs.Content value="lines" className="outline-none focus:ring-0">
                <div className="bg-white p-6 rounded-2xl shadow-sm border border-gray-100">
                    {linePlotView}
                </div>
            </Tabs.Content>
        </Tabs.Root>
    );
}
