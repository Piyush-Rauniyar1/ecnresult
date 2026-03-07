import ConstituencySelector from '@/components/ConstituencySelector';
import PartyStandings from '@/components/PartyStandings';
import NationalProgressChart from '@/components/NationalProgressChart';
import WinnerMap from '@/components/WinnerMap';
import EpicCenter from '@/components/EpicCenter';
import { supabase } from '@/lib/supabase';

export const revalidate = 30;

export default async function Home() {
  const { count: declaredCount } = await supabase
    .from('constituencies')
    .select('*', { count: 'exact', head: true })
    .eq('status', 'declared');

  const totalConstituencies = 165;
  const declared = declaredCount || 0;
  const progress = (declared / totalConstituencies) * 100;

  const { data: lastScrape } = await supabase
    .from('scrape_log')
    .select('run_at')
    .order('run_at', { ascending: false })
    .limit(1)
    .single();

  let lastUpdatedStr = 'Not yet updated';
  if (lastScrape?.run_at) {
    const d = new Date(lastScrape.run_at);
    lastUpdatedStr = d.toLocaleString('en-US', {
      timeZone: 'Asia/Kathmandu',
      month: 'short',
      day: 'numeric',
      hour: 'numeric',
      minute: '2-digit',
      hour12: true
    }) + ' NPT';
  }

  return (
    <div className="min-h-screen" style={{ background: 'linear-gradient(180deg, #f0f4ff 0%, #fafafa 100%)' }}>

      {/* ── Hero Banner ── */}
      <div style={{ background: 'linear-gradient(135deg, #1e3a8a 0%, #312e81 55%, #1e1b4b 100%)' }} className="relative overflow-hidden">
        {/* Decorative blobs */}
        <div className="absolute top-0 right-0 w-[500px] h-[500px] rounded-full opacity-[0.08]"
          style={{ background: 'radial-gradient(circle, #60a5fa, transparent)', transform: 'translate(30%, -30%)' }} />
        <div className="absolute bottom-0 left-0 w-64 h-64 rounded-full opacity-[0.08]"
          style={{ background: 'radial-gradient(circle, #a78bfa, transparent)', transform: 'translate(-30%, 30%)' }} />

        <div className="relative max-w-5xl mx-auto px-4 sm:px-6 lg:px-8 py-16 text-center">
          <div className="flex flex-col items-center justify-center gap-3 mb-6">
            <div className="inline-flex items-center gap-2 bg-white/10 border border-white/20 text-blue-200 text-sm font-semibold px-4 py-1.5 rounded-full backdrop-blur-sm">
              <span className="w-2 h-2 rounded-full bg-green-400 animate-pulse" />
              Nepal Election 2082 · Live Results
            </div>
            <div className="text-white/70 text-sm font-medium">
              Last Updated: {lastUpdatedStr}
            </div>
          </div>
          <h1 className="text-5xl md:text-6xl font-black text-white tracking-tight leading-tight">
            Election Results<br />
            <span style={{ background: 'linear-gradient(135deg, #93c5fd, #c4b5fd)', WebkitBackgroundClip: 'text', WebkitTextFillColor: 'transparent' }}>
              Live &amp; Nationwide
            </span>
          </h1>
          <p className="text-blue-200 text-lg mt-4 max-w-xl mx-auto font-medium">
            Real-time vote counting for all 165 constituencies of the House of Representatives.
          </p>
        </div>
      </div>

      <div className="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8 py-10">

        {/* ── Constituency Selector ── */}
        <div className="mb-10">
          <ConstituencySelector />
        </div>

        {/* ── Stats row ── */}
        <div className="grid grid-cols-1 md:grid-cols-4 gap-4 mb-8">
          <div className="md:col-span-3">
            <NationalProgressChart />
          </div>
          <div className="space-y-4">
            {/* Seats declared */}
            <div className="bg-white rounded-2xl border border-gray-100 shadow-sm p-5">
              <p className="text-xs font-bold uppercase tracking-widest text-gray-400 mb-1">Seats Declared</p>
              <p className="text-4xl font-black text-blue-600">
                {declared} <span className="text-lg text-gray-300 font-medium">/ {totalConstituencies}</span>
              </p>
              <div className="mt-3 h-2 bg-blue-50 rounded-full overflow-hidden">
                <div className="h-full rounded-full bg-blue-500 transition-all duration-1000" style={{ width: `${progress}%` }} />
              </div>
              <p className="text-xs text-gray-400 mt-1">{progress.toFixed(1)}% complete</p>
            </div>

            {/* Majority target */}
            <div className="bg-white rounded-2xl border border-gray-100 shadow-sm p-5">
              <p className="text-xs font-bold uppercase tracking-widest text-gray-400 mb-1">Majority Target</p>
              <p className="text-4xl font-black text-indigo-600">83</p>
              <p className="text-sm text-gray-400 mt-1">needed for majority</p>
            </div>
          </div>
        </div>

        {/* ── Main Interactive Section ── */}
        <div className="grid grid-cols-1 lg:grid-cols-4 gap-6 mb-8">
          {/* Winner Map (Major focus) */}
          <div className="lg:col-span-3">
            <WinnerMap />
          </div>

          {/* Epic Center (Live Hub) */}
          <div className="h-full">
            <EpicCenter />
          </div>
        </div>

        {/* ── Party Standings (live from Supabase) ── */}
        <div className="grid grid-cols-1 gap-6">
          <PartyStandings />
        </div>

      </div>

      <div className="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8 pb-12 pt-4">
        <div className="border-t border-gray-200 pt-8 flex flex-col md:flex-row items-center justify-between gap-4 text-xs text-slate-500 font-medium">
          <div className="flex items-center gap-2">
            <span>🔴 Live Election Data sourced from</span>
            <a href="https://election.ekantipur.com" target="_blank" rel="noreferrer" className="text-blue-600 hover:text-blue-800 hover:underline font-bold transition-colors">
              eKantipur
            </a>
          </div>

          <div className="flex items-center gap-2">
            <span>🗺️ Map GeoJSON from</span>
            <a href="https://github.com/mesaugat/geoJSON-Nepal" target="_blank" rel="noreferrer" className="text-indigo-600 hover:text-indigo-800 hover:underline font-bold transition-colors">
              mesaugat/geoJSON-Nepal
            </a>
            <span>&amp;</span>
            <a href="https://github.com/opentechcommunity/map-of-nepal" target="_blank" rel="noreferrer" className="text-indigo-600 hover:text-indigo-800 hover:underline font-bold transition-colors">
              opentechcommunity
            </a>
          </div>

          <div className="text-slate-400">
            For demonstration and educational purposes only
          </div>
        </div>
      </div>
    </div>
  );
}
