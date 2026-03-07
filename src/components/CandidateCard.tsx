'use client';

import Image from 'next/image';
import { motion } from 'framer-motion';

export interface CandidateCardProps {
    id: number;
    name_en: string;
    name_np?: string;
    party_name?: string;
    party_abbrev?: string;
    is_independent: boolean;
    photo_url?: string;
    symbol_url?: string;
    color?: string;
    votes: number;
    maxVotes: number;
    isWinner: boolean;
    isLeading: boolean;
}

export default function CandidateCard({
    name_en,
    party_name,
    party_abbrev,
    is_independent,
    photo_url,
    symbol_url,
    color,
    votes,
    maxVotes,
    isWinner,
    isLeading
}: CandidateCardProps) {
    const percentage = maxVotes > 0 ? Math.round((votes / maxVotes) * 100) : 0;
    const themeColor = is_independent ? '#6B7280' : color || '#e5e7eb';

    return (
        <motion.div
            initial={{ opacity: 0, y: 10 }}
            animate={{ opacity: 1, y: 0 }}
            className={`relative flex items-center bg-white border border-gray-100 rounded-xl p-4 shadow-sm hover:shadow-md transition-shadow overflow-hidden
      ${isWinner ? 'ring-2 ring-green-500 bg-green-50/20' : ''}
      ${isLeading && !isWinner ? 'ring-2 ring-blue-400 bg-blue-50/20' : ''}`}
        >
            {/* Background Progress Bar */}
            <motion.div
                initial={{ width: 0 }}
                animate={{ width: `${percentage}%` }}
                transition={{ duration: 1, ease: 'easeOut' }}
                className="absolute top-0 left-0 bottom-0 opacity-10"
                style={{ backgroundColor: themeColor }}
            />

            {/* Photo Column */}
            <div className="flex-shrink-0 z-10 mr-5 relative">
                <div className="w-16 h-16 sm:w-20 sm:h-20 bg-gray-100 rounded-full overflow-hidden border-2 border-white shadow-sm flex items-center justify-center">
                    {photo_url ? (
                        <Image src={photo_url} alt={name_en} fill className="object-cover" />
                    ) : (
                        <span className="text-3xl text-gray-400">👤</span>
                    )}
                </div>
                {/* Status Badge */}
                {(isWinner || isLeading) && (
                    <div className={`absolute -bottom-2 lg:-bottom-3 left-1/2 -translate-x-1/2 px-2 py-0.5 rounded-full text-[10px] font-bold shadow-sm whitespace-nowrap
            ${isWinner ? 'bg-green-500 text-white' : 'bg-blue-500 text-white'}`}>
                        {isWinner ? '🏆 WINNER' : '🔥 LEADING'}
                    </div>
                )}
            </div>

            {/* Details Column */}
            <div className="flex-1 z-10 min-w-0 pr-4">
                <h3 className="text-lg sm:text-xl font-bold text-gray-900 truncate">{name_en}</h3>
                <div className="mt-1 flex items-center text-sm font-medium">
                    {is_independent ? (
                        <div className="inline-flex items-center px-2 py-0.5 rounded bg-gray-100 text-gray-600 border border-gray-200 shadow-sm">
                            <span className="mr-1 text-xs">🗳</span> IND (स्वतन्त्र)
                        </div>
                    ) : (
                        <div className="flex items-center space-x-2">
                            {symbol_url && (
                                <div className="relative w-6 h-6 bg-white rounded shadow-sm p-0.5">
                                    <Image src={symbol_url} alt="Symbol" fill className="object-contain" />
                                </div>
                            )}
                            <span className="text-gray-600 truncate">{party_name} {party_abbrev && `(${party_abbrev})`}</span>
                        </div>
                    )}
                </div>
            </div>

            {/* Vote Count Column */}
            <div className="flex-shrink-0 z-10 text-right">
                <motion.div
                    key={votes}
                    initial={{ scale: 1.2, color: themeColor }}
                    animate={{ scale: 1, color: '#111827' }}
                    className="text-2xl sm:text-3xl font-black tabular-nums tracking-tight"
                >
                    {votes.toLocaleString()}
                </motion.div>
                <div className="text-xs font-semibold text-gray-500 mt-1 uppercase tracking-wider">
                    Votes
                </div>
            </div>
        </motion.div>
    );
}
