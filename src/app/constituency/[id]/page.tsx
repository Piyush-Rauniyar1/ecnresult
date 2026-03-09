'use client';

import { useEffect, useState } from 'react';
import { supabaseBrowser } from '@/lib/supabase';
import LiveBadge from '@/components/LiveBadge';
import ViewSwitcher from '@/components/ViewSwitcher';
import CandidateCard from '@/components/CandidateCard';
import BarChartView from '@/components/BarChartView';
import LinePlotView from '@/components/LinePlotView';
import WinnerBanner from '@/components/WinnerBanner';
import Link from 'next/link';
import { ArrowLeft, RefreshCcw } from 'lucide-react';

export default function ConstituencyPage({ params }: { params: { id: string } }) {
    const [constituency, setConstituency] = useState<any>(null);
    const [results, setResults] = useState<any[]>([]);
    const [snapshots, setSnapshots] = useState<any[]>([]);
    const [lastUpdated, setLastUpdated] = useState<string | null>(null);
    const [candidatesOnly, setCandidatesOnly] = useState<any[]>([]);
    const [isScraping, setIsScraping] = useState(false);

    async function fetchData() {
        // Fetch constituency detail
        const { data: constData } = await supabaseBrowser
            .from('constituencies')
            .select('*, districts(name_en, provinces(name_en))')
            .eq('id', params.id)
            .single();

        if (constData) setConstituency(constData);

        // Fetch Candidates & Results
        const { data: resData } = await supabaseBrowser
            .from('results')
            .select(`
          votes, is_winner, last_scraped_at,
          candidates(
            id, name_en, is_independent, photo_cloudinary_url, 
            parties(name_en, abbreviation, symbol_cloudinary_url, color_hex)
          )
        `)
            .eq('constituency_id', params.id)
            .order('votes', { ascending: false });

        if (resData && resData.length > 0) {
            setResults(resData);
            setLastUpdated(resData[0].last_scraped_at);
        } else {
            // Fetch just candidates if no results yet
            const { data: candData } = await supabaseBrowser
                .from('candidates')
                .select('id, name_en, photo_cloudinary_url, is_independent, parties(name_en, abbreviation, symbol_cloudinary_url, color_hex)')
                .eq('constituency_id', params.id)
                .order('name_en');
            if (candData) setCandidatesOnly(candData);
        }

        // Fetch Snapshots for Line Chart
        const { data: snapData } = await supabaseBrowser
            .from('vote_snapshots')
            .select('votes, snapshot_time, candidates!inner(name_en, constituency_id)')
            .eq('candidates.constituency_id', params.id)
            .order('snapshot_time', { ascending: true });

        if (snapData && snapData.length > 0) {
            // Transform into Recharts format: { time: '...', 'Candidate A': 100, 'Candidate B': 50 }
            const groupedByTime: { [time: string]: any } = {};

            snapData.forEach((snap: any) => {
                const time = new Date(snap.snapshot_time).toLocaleString('en-US', {
                    hour: 'numeric',
                    minute: '2-digit',
                    hour12: true
                });

                if (!groupedByTime[time]) {
                    groupedByTime[time] = { time };
                }
                groupedByTime[time][snap.candidates.name_en] = snap.votes;
            });

            setSnapshots(Object.values(groupedByTime));
        }
    }

    const handleRefresh = async () => {
        setIsScraping(true);
        try {
            const res = await fetch('/api/scrape/constituency', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ id: params.id })
            });
            if (res.ok) {
                await fetchData();
            }
        } catch (error) {
            console.error('Scrape failed:', error);
        } finally {
            setIsScraping(false);
        }
    };

    useEffect(() => {
        fetchData();

        // Auto-refresh data every 10 seconds
        const dataRefreshInterval = setInterval(async () => {
            console.log('[AUTO-REFRESH] Fetching latest data...');
            await fetchData();
        }, 10000);

        // Trigger realtime scrape every 30 seconds for the active target constituencies
        const realtimeScrapeInterval = setInterval(async () => {
            const targetConstituencies = [3, 4, 19, 26, 33, 34, 35, 36, 68, 85, 84, 93, 37, 96, 127, 128, 121, 149, 9, 79, 111, 124, 125, 126]; // All 24 active constituencies
            
            // Only trigger if this page is one of the target constituencies
            if (targetConstituencies.includes(Number(params.id))) {
                try {
                    console.log('[REALTIME-SCRAPE] Triggering realtime scrape...');
                    const res = await fetch('/api/scrape/realtime');
                    if (res.ok) {
                        console.log('[REALTIME-SCRAPE] Scrape completed, refreshing UI...');
                    }
                } catch (error) {
                    console.error('[REALTIME-SCRAPE] Error:', error);
                }
            }
        }, 30000);

        // Subscribe to realtime updates
        const channel = supabaseBrowser
            .channel(`results-${params.id}`)
            .on('postgres_changes', {
                event: 'UPDATE',
                schema: 'public',
                table: 'results',
                filter: `constituency_id=eq.${params.id}`
            }, (payload) => {
                console.log('[REALTIME] Data changed, updating UI...');
                // Refresh data when changes are detected
                fetchData();
            }, payload => {
                // Optimistically update the UI inline
                setResults(prev => {
                    const newRes = [...prev];
                    const idx = newRes.findIndex(r => r.candidates.id === payload.new.candidate_id);
                    if (idx >= 0) {
                        newRes[idx].votes = payload.new.votes;
                        newRes[idx].is_winner = payload.new.is_winner;
                        newRes[idx].last_scraped_at = payload.new.last_scraped_at;
                    }
                    return newRes.sort((a, b) => b.votes - a.votes);
                });
                setLastUpdated(payload.new.last_scraped_at);
            })
            .subscribe();

        return () => { 
            clearInterval(dataRefreshInterval);
            clearInterval(realtimeScrapeInterval);
            supabaseBrowser.removeChannel(channel); 
        };
    }, [params.id]);

    if (!constituency) {
        return (
            <div className="min-h-screen flex items-center justify-center" style={{ background: 'linear-gradient(135deg, #0f0c29, #302b63, #24243e)' }}>
                <div className="text-center">
                    <div className="w-16 h-16 border-4 border-white/30 border-t-white rounded-full animate-spin mx-auto mb-4" />
                    <p className="text-white/60 font-medium">Loading constituency data...</p>
                </div>
            </div>
        );
    }

    const maxVotes = results.length > 0 ? results[0].votes : 0;
    const winner = results.find(r => r.is_winner);
    const totalVotes = results.reduce((sum, r) => sum + (r.votes || 0), 0);
    const countingStarted = totalVotes > 0;

    // Prepare Chart Data
    const barChartData = results.map(r => ({
        id: r.candidates.id,
        name: r.candidates.name_en,
        votes: r.votes,
        color: r.candidates.is_independent ? '#6B7280' : (r.candidates.parties?.color_hex || '#e5e7eb'),
        party: r.candidates.is_independent ? 'Independent' : r.candidates.parties?.name_en
    }));

    const linePlotCandidates = results.slice(0, 5).map(r => ({
        name: r.candidates.name_en,
        color: r.candidates.is_independent ? '#6B7280' : (r.candidates.parties?.color_hex || '#e5e7eb'),
        logoUrl: r.candidates.is_independent ? null : r.candidates.parties?.symbol_cloudinary_url
    }));

    // KEY FIX: when results exist (even all-zero votes), extract candidates from them.
    // Only fall back to candidatesOnly when no results row exists at all.
    const rosterList: any[] = results.length > 0
        ? results.map(r => r.candidates)
        : candidatesOnly;

    const getRankStyle = (rank: number) => {
        if (rank === 1) return { bg: 'linear-gradient(135deg, #FFD700, #FFA500)', text: '#fff' };
        if (rank === 2) return { bg: 'linear-gradient(135deg, #C0C0C0, #A0A0A0)', text: '#fff' };
        if (rank === 3) return { bg: 'linear-gradient(135deg, #CD7F32, #A0522D)', text: '#fff' };
        return { bg: '#f3f4f6', text: '#6b7280' };
    };

    const renderCandidatesOnly = () => {
        const list = rosterList;

        if (list.length === 0) {
            return (
                <div className="text-center py-20 text-gray-400">
                    <div className="text-5xl mb-4">🗳️</div>
                    <p className="text-lg font-medium">No candidates registered yet.</p>
                </div>
            );
        }

        return (
            <div className="space-y-3">
                {list.map((c, idx) => {
                    const rank = idx + 1;
                    const rankStyle = getRankStyle(rank);
                    const accentColor = c.is_independent ? '#6B7280' : (c.parties?.color_hex || '#6366f1');

                    return (
                        <div
                            key={c.id}
                            className="group relative flex items-center gap-4 bg-white rounded-2xl shadow-sm hover:shadow-lg border border-gray-100 overflow-hidden transition-all duration-300"
                            style={{ borderLeft: `5px solid ${accentColor}` }}
                        >
                            {/* Subtle party-color background glow on hover */}
                            <div
                                className="absolute inset-0 opacity-0 group-hover:opacity-5 transition-opacity duration-300"
                                style={{ backgroundColor: accentColor }}
                            />

                            {/* Rank Badge */}
                            <div
                                className="flex-shrink-0 w-11 h-11 rounded-xl flex items-center justify-center font-black text-sm ml-4 shadow-sm z-10"
                                style={{ background: rankStyle.bg, color: rankStyle.text, minWidth: '2.75rem' }}
                            >
                                {rank}
                            </div>

                            {/* Avatar */}
                            <div className="flex-shrink-0 z-10">
                                {c.photo_cloudinary_url ? (
                                    <img
                                        src={c.photo_cloudinary_url}
                                        alt={c.name_en}
                                        className="w-14 h-14 rounded-full object-cover border-2 shadow-sm"
                                        style={{ borderColor: accentColor }}
                                    />
                                ) : (
                                    <div
                                        className="w-14 h-14 rounded-full flex items-center justify-center font-bold text-xl text-white shadow-sm"
                                        style={{ background: `linear-gradient(135deg, ${accentColor}cc, ${accentColor})` }}
                                    >
                                        {c.name_en.charAt(0)}
                                    </div>
                                )}
                            </div>

                            {/* Info */}
                            <div className="flex-1 min-w-0 py-4 z-10">
                                <h3 className="font-bold text-gray-900 text-base leading-tight truncate">{c.name_en}</h3>
                                <div className="flex items-center gap-2 mt-1">
                                    {c.parties?.symbol_cloudinary_url && !c.is_independent && (
                                        <img
                                            src={c.parties.symbol_cloudinary_url}
                                            alt="Party symbol"
                                            className="w-5 h-5 object-contain rounded"
                                        />
                                    )}
                                    <span
                                        className="text-xs font-semibold px-2 py-0.5 rounded-full truncate"
                                        style={{ backgroundColor: `${accentColor}18`, color: accentColor }}
                                    >
                                        {c.is_independent ? '🗳 Independent' : `${c.parties?.abbreviation} · ${c.parties?.name_en}`}
                                    </span>
                                </div>
                            </div>

                            {/* Right: awaiting tag */}
                            <div className="flex-shrink-0 mr-5 z-10">
                                <span className="text-xs font-semibold text-gray-400 uppercase tracking-wide bg-gray-50 border border-gray-100 px-3 py-1 rounded-full">
                                    Awaiting
                                </span>
                            </div>
                        </div>
                    );
                })}
            </div>
        );
    };

    const provinceName = constituency.districts?.provinces?.name_en;
    const districtName = constituency.districts?.name_en;

    return (
        <div className="min-h-screen" style={{ background: 'linear-gradient(180deg, #eef2ff 0%, #f8fafc 100%)' }}>

            {/* Hero Header */}
            <div style={{ background: 'linear-gradient(135deg, #1e3a8a 0%, #312e81 50%, #1e1b4b 100%)' }} className="relative overflow-hidden">
                <div className="absolute top-0 right-0 w-96 h-96 rounded-full opacity-10" style={{ background: 'radial-gradient(circle, #60a5fa, transparent)', transform: 'translate(30%, -30%)' }} />
                <div className="absolute bottom-0 left-0 w-64 h-64 rounded-full opacity-10" style={{ background: 'radial-gradient(circle, #a78bfa, transparent)', transform: 'translate(-30%, 30%)' }} />

                <div className="relative max-w-5xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
                    <Link href="/" className="inline-flex items-center text-blue-300 hover:text-white transition-colors mb-6 text-sm font-medium">
                        <ArrowLeft className="w-4 h-4 mr-2" />
                        Back to National Overview
                    </Link>

                    <div className="flex flex-col md:flex-row md:items-end justify-between gap-4">
                        <div>
                            <div className="flex items-center gap-2 mb-2">
                                <span className="text-xs font-bold tracking-widest text-blue-300 uppercase">{provinceName}</span>
                                <span className="text-blue-500">•</span>
                                <span className="text-xs font-bold tracking-widest text-blue-300 uppercase">{districtName}</span>
                            </div>
                            <h1 className="text-4xl md:text-5xl font-black text-white tracking-tight">
                                {constituency.name_en}
                            </h1>
                            <div className="mt-3 flex items-center gap-3 flex-wrap">
                                <span className="bg-white/10 text-white text-sm font-semibold px-3 py-1 rounded-full backdrop-blur-sm border border-white/20">
                                    🗳 Nepal Election 2082
                                </span>
                                {countingStarted && (
                                    <span className="text-sm text-blue-200 font-medium">
                                        {totalVotes.toLocaleString()} votes counted
                                    </span>
                                )}
                            </div>
                        </div>
                        <div className="self-start md:self-end flex items-center gap-3">
                            <button
                                onClick={handleRefresh}
                                disabled={isScraping}
                                className="bg-white/10 hover:bg-white/20 disabled:opacity-50 text-white p-2.5 rounded-xl backdrop-blur-md border border-white/20 shadow-lg flex items-center gap-2 transition-all active:scale-95 group font-bold tracking-tight text-xs"
                                title="Scrape latest data from Ekantipur"
                            >
                                <RefreshCcw className={`w-4 h-4 ${isScraping ? 'animate-spin' : 'group-hover:rotate-180 transition-transform duration-500'}`} />
                                {isScraping ? 'Refreshing...' : 'Refresh Live Data'}
                            </button>
                            <LiveBadge lastUpdated={lastUpdated} />
                        </div>
                    </div>
                </div>
            </div>

            {/* Content */}
            <div className="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8 py-8">

                {/* Winner Banner */}
                {winner && constituency.status === 'declared' && (
                    <div className="mb-8">
                        <WinnerBanner
                            winner={{
                                name_en: winner.candidates.name_en,
                                party_name: winner.candidates.parties?.name_en,
                                photo_url: winner.candidates.photo_cloudinary_url,
                                symbol_url: winner.candidates.parties?.symbol_cloudinary_url,
                                is_independent: winner.candidates.is_independent,
                                votes: winner.votes,
                                color: winner.candidates.parties?.color_hex
                            }}
                        />
                    </div>
                )}

                {/* Section header for no-vote state */}
                {!countingStarted && (
                    <div className="mb-6 flex items-center justify-between flex-wrap gap-3">
                        <div>
                            <h2 className="text-2xl font-black text-gray-900">Contesting Candidates</h2>
                            <p className="text-sm text-gray-500 mt-0.5">
                                {rosterList.length} candidates registered · Vote counting has not started
                            </p>
                        </div>
                        <div className="flex items-center gap-2 bg-amber-50 border border-amber-200 text-amber-700 text-xs font-semibold px-3 py-1.5 rounded-full">
                            ⏳ Counting Pending
                        </div>
                    </div>
                )}

                {/* Main Content */}
                {countingStarted ? (
                    <ViewSwitcher
                        cardsView={
                            <div className="space-y-4">
                                {results.map((r, i) => (
                                    <CandidateCard
                                        key={r.candidates.id}
                                        id={r.candidates.id}
                                        name_en={r.candidates.name_en}
                                        party_name={r.candidates.parties?.name_en}
                                        party_abbrev={r.candidates.parties?.abbreviation}
                                        is_independent={r.candidates.is_independent}
                                        photo_url={r.candidates.photo_cloudinary_url}
                                        symbol_url={r.candidates.parties?.symbol_cloudinary_url}
                                        color={r.candidates.parties?.color_hex}
                                        votes={r.votes}
                                        maxVotes={maxVotes}
                                        isWinner={r.is_winner && constituency.status === 'declared'}
                                        isLeading={i === 0 && constituency.status !== 'declared'}
                                    />
                                ))}
                            </div>
                        }
                        barChartView={<BarChartView data={barChartData} />}
                        linePlotView={<LinePlotView data={snapshots} candidates={linePlotCandidates} />}
                    />
                ) : (
                    renderCandidatesOnly()
                )}
            </div>
        </div>
    );
}
