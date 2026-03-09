'use client';

import { useState, useEffect } from 'react';
import { useRouter } from 'next/navigation';
import { supabaseBrowser } from '@/lib/supabase';

interface Province { id: number; name_en: string; }
interface District { id: number; name_en: string; province_id: number; }
interface Constituency { id: number; name_en: string; district_id: number; number: number; }

export default function ConstituencySelector() {
    const router = useRouter();

    // Active constituencies being scraped (18 total)
    const activeConstituencies = [3, 4, 19, 26, 33, 34, 35, 36, 68, 85, 84, 93, 37, 96, 127, 128, 121, 149];

    const [provinces, setProvinces] = useState<Province[]>([]);
    const [districts, setDistricts] = useState<District[]>([]);
    const [constituencies, setConstituencies] = useState<Constituency[]>([]);

    const [selProv, setSelProv] = useState<number | ''>('');
    const [selDist, setSelDist] = useState<number | ''>('');
    const [selConst, setSelConst] = useState<number | ''>('');

    useEffect(() => {
        supabaseBrowser.from('provinces').select('*').order('id')
            .then(({ data }) => { if (data) setProvinces(data); });
    }, []);

    useEffect(() => {
        if (selProv) {
            supabaseBrowser.from('districts').select('*').eq('province_id', selProv).order('name_en')
                .then(({ data }) => { if (data) setDistricts(data); });
            setSelDist('');
            setSelConst('');
        }
    }, [selProv]);

    useEffect(() => {
        if (selDist) {
            supabaseBrowser.from('constituencies')
                .select('*')
                .eq('district_id', selDist)
                .in('id', activeConstituencies)
                .order('number')
                .then(({ data }) => { if (data) setConstituencies(data); });
            setSelConst('');
        }
    }, [selDist]);

    const handleGo = () => {
        if (selConst) {
            router.push(`/constituency/${selConst}`);
        }
    };

    return (
        <div className="bg-white p-6 md:p-8 rounded-2xl shadow-xl border border-gray-100 max-w-4xl mx-auto w-full">
            <h2 className="text-2xl font-bold text-gray-800 mb-6 text-center">Live Result Search</h2>
            <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
                <select
                    className="p-3 border rounded-xl bg-gray-50 focus:ring-2 focus:ring-blue-500 focus:outline-none transition-shadow"
                    value={selProv}
                    onChange={(e) => setSelProv(Number(e.target.value))}
                >
                    <option value="">1. Select Province</option>
                    {provinces.map(p => <option key={p.id} value={p.id}>{p.name_en}</option>)}
                </select>

                <select
                    className="p-3 border rounded-xl bg-gray-50 focus:ring-2 focus:ring-blue-500 focus:outline-none transition-shadow disabled:opacity-50"
                    value={selDist}
                    onChange={(e) => setSelDist(Number(e.target.value))}
                    disabled={!selProv}
                >
                    <option value="">2. Select District</option>
                    {districts.map(d => <option key={d.id} value={d.id}>{d.name_en}</option>)}
                </select>

                <select
                    className="p-3 border rounded-xl bg-gray-50 focus:ring-2 focus:ring-blue-500 focus:outline-none transition-shadow disabled:opacity-50"
                    value={selConst}
                    onChange={(e) => setSelConst(Number(e.target.value))}
                    disabled={!selDist}
                >
                    <option value="">3. Select Constituency</option>
                    {constituencies.map(c => <option key={c.id} value={c.id}>{c.number}</option>)}
                </select>

                <button
                    onClick={handleGo}
                    disabled={!selConst}
                    className="bg-blue-600 hover:bg-blue-700 disabled:bg-gray-300 disabled:cursor-not-allowed text-white font-bold py-3 px-6 rounded-xl transition-colors shadow-sm flex items-center justify-center"
                >
                    View Results →
                </button>
            </div>
        </div>
    );
}
