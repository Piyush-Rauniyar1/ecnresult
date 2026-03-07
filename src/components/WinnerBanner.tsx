import Image from 'next/image';

interface WinnerBannerProps {
    winner: {
        name_en: string;
        party_name?: string;
        photo_url?: string;
        symbol_url?: string;
        is_independent: boolean;
        votes: number;
        color?: string;
    };
}

export default function WinnerBanner({ winner }: WinnerBannerProps) {
    return (
        <div
            className="relative overflow-hidden group bg-gradient-to-r p-6 rounded-2xl shadow-xl flex items-center mb-8 border-2"
            style={{
                borderColor: winner.color || '#e5e7eb',
                background: `linear-gradient(to right, #ffffff, ${winner.color ? `${winner.color}15` : '#f3f4f6'})`
            }}
        >
            <div className="absolute -top-12 -right-12 text-9xl opacity-10">🏆</div>
            <div className="flex-shrink-0 relative w-24 h-24 sm:w-32 sm:h-32 rounded-full border-4 border-white shadow-lg mr-6">
                {winner.photo_url ? (
                    <Image
                        src={winner.photo_url}
                        alt={winner.name_en}
                        fill
                        className="object-cover rounded-full"
                    />
                ) : (
                    <div className="w-full h-full bg-gray-200 rounded-full flex items-center justify-center text-4xl">
                        👤
                    </div>
                )}
            </div>

            <div className="flex-1 z-10">
                <div className="text-sm font-bold tracking-widest uppercase mb-1 text-green-600 bg-green-100 inline-block px-3 py-1 rounded-full shadow-sm border border-green-200">
                    ✅ Official Winner
                </div>
                <h2 className="text-3xl sm:text-4xl font-extrabold text-gray-900 mb-2 font-serif">{winner.name_en}</h2>
                <div className="flex items-center space-x-3 text-lg font-medium text-gray-700">
                    {winner.is_independent ? (
                        <span className="bg-gray-100 text-gray-600 px-3 py-1 rounded-md border text-sm">Independent (स्वतन्त्र)</span>
                    ) : (
                        <div className="flex items-center space-x-2">
                            {winner.symbol_url && (
                                <div className="w-8 h-8 relative rounded-sm bg-white p-1 shadow-sm">
                                    <Image src={winner.symbol_url} alt="Party Symbol" fill className="object-contain" />
                                </div>
                            )}
                            <span>{winner.party_name}</span>
                        </div>
                    )}
                </div>
                <div className="mt-4">
                    <span className="text-4xl font-black text-gray-900 drop-shadow-sm">{winner.votes.toLocaleString()}</span>
                    <span className="text-gray-500 font-medium ml-2 text-lg">total votes</span>
                </div>
            </div>
        </div>
    );
}
