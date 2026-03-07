'use client';

import { useState, useEffect } from 'react';

export default function LiveBadge({ lastUpdated }: { lastUpdated: string | null }) {
    const [minutesAgo, setMinutesAgo] = useState<number>(0);
    const [nextUpdateIn, setNextUpdateIn] = useState<number>(10);

    useEffect(() => {
        if (!lastUpdated) return;

        const interval = setInterval(() => {
            const now = new Date();
            const updated = new Date(lastUpdated);
            const diffMs = now.getTime() - updated.getTime();
            const diffMins = Math.floor(diffMs / 60000);

            setMinutesAgo(diffMins);
            // Next update runs every 10 min.
            // If 2 mins ago, next update in 8 mins
            // Wait for at least 0.
            setNextUpdateIn(Math.max(0, 10 - diffMins));
        }, 60000); // update every minute

        // initial run
        const now = new Date();
        const updated = new Date(lastUpdated);
        const diffMs = now.getTime() - updated.getTime();
        const diffMins = Math.floor(diffMs / 60000);
        setMinutesAgo(diffMins);
        setNextUpdateIn(Math.max(0, 10 - diffMins));

        return () => clearInterval(interval);
    }, [lastUpdated]);

    return (
        <div className="flex items-center space-x-3 bg-gray-50 border border-gray-200 px-4 py-2 rounded-full shadow-sm w-max">
            <div className="flex items-center space-x-2">
                <span className="relative flex h-3 w-3">
                    <span className="animate-ping absolute inline-flex h-full w-full rounded-full bg-green-400 opacity-75"></span>
                    <span className="relative inline-flex rounded-full h-3 w-3 bg-green-500"></span>
                </span>
                <span className="text-sm font-bold text-gray-700 uppercase tracking-wide">Live</span>
            </div>
            <div className="h-4 w-px bg-gray-300"></div>
            <div className="text-xs text-gray-500 font-medium">
                {lastUpdated ? (
                    <>
                        <span>Updated {minutesAgo} min ago</span>
                        <span className="mx-2">•</span>
                        <span>Next in {nextUpdateIn} min</span>
                    </>
                ) : (
                    <span>Connecting...</span>
                )}
            </div>
        </div>
    );
}
