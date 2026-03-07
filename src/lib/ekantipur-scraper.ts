#!/usr/bin/env node
/**
 * ekantipur.com Election Scraper — Nepal Election 2082
 */

import { createClient, SupabaseClient } from '@supabase/supabase-js';

// Helper to get supabase client securely from runtime env
function getSupabaseService() {
    return createClient(
        process.env.NEXT_PUBLIC_SUPABASE_URL!,
        process.env.SUPABASE_SERVICE_ROLE_KEY!
    );
}

// --- Province slug mapping ---
const PROVINCE_SLUGS = {
    'Koshi': 'pradesh-1',
    'Madhesh': 'pradesh-2',
    'Bagmati': 'pradesh-3',
    'Gandaki': 'pradesh-4',
    'Lumbini': 'pradesh-5',
    'Karnali': 'pradesh-6',
    'Sudurpashchim': 'pradesh-7',
};

function makeDistrictSlug(name: string) {
    return 'district-' + name
        .toLowerCase()
        .replace(/\s+/g, '-')
        .replace(/[()]/g, '');
}

function sleep(ms: number) {
    return new Promise(r => setTimeout(r, ms));
}

const NEP_DIGITS = {
    '०': '0', '१': '1', '२': '2', '३': '3', '४': '4',
    '५': '5', '६': '6', '७': '7', '८': '8', '९': '9',
};

function parseNumber(str: string) {
    if (!str) return 0;
    // Remove commas and convert Nepali digits if any
    let cleaned = str.replace(/,/g, '');
    for (const [nep, eng] of Object.entries(NEP_DIGITS)) {
        cleaned = cleaned.split(nep).join(eng);
    }
    const match = cleaned.match(/\d+/);
    return match ? parseInt(match[0], 10) : 0;
}

// ─── Parser ──────────────────────────────────────────────────────────────────
function parseCandidates(html: string) {
    const candidates = [];
    const profileRegex = /<a[^>]*href="\/profile\/(\d+)\?lng=(?:eng|nep)"[^>]*>([\s\S]*?)<\/a>/g;
    let pMatch;

    while ((pMatch = profileRegex.exec(html)) !== null) {
        const ekCandidateId = pMatch[1];
        const linkContent = pMatch[2];
        const nameMatch = linkContent.match(/<span[^>]*>(.*?)<\/span>/) || [null, linkContent.replace(/<[^>]+>/g, '')];
        const name = nameMatch[1].trim().replace(/\s+/g, ' ');
        if (!name) continue;

        const startPos = pMatch.index;
        const nextMatch = html.slice(startPos + 1).match(/<a[^>]*href="\/profile\/\d+\?lng=(?:eng|nep)"/);
        const endPos = nextMatch && nextMatch.index ? startPos + 1 + nextMatch.index : startPos + 2000;
        const row = html.slice(startPos, endPos);

        const partyMatch = row.match(/href="\/party\/(\d+)\?lng=(?:eng|nep)"[^>]*>([\s\S]*?)<\/a>/);
        const ekPartyId = partyMatch ? partyMatch[1] : '19';
        let partyName = 'Independent';
        if (partyMatch) {
            const pNameMatch = partyMatch[2].match(/<span[^>]*>([\s\S]*?)<\/span>/) || [null, partyMatch[2].replace(/<[^>]+>/g, '')];
            partyName = pNameMatch[1].trim().replace(/\s+/g, ' ');
        }

        const photoMatch = row.match(/<img[^>]*src="([^"]+)"/);
        const photoUrl = photoMatch ? photoMatch[1].trim() : null;

        const votecountBlockMatch = row.match(/class="(?:votecount|vote-count)[^"]*"[^>]*>([\s\S]*?)<\/div>/i);
        const votecountBlock = votecountBlockMatch ? votecountBlockMatch[1] : '';
        const pTagMatch = votecountBlock.match(/<p[^>]*>([\s\S]*?)<\/p>/);
        const votes = pTagMatch ? parseNumber(pTagMatch[1]) : 0;

        const hasWinClass = /class="[^"]*(?:win|lead)[^"]*"/.test(row.slice(0, 200));
        const hasElectedText = /Elected|विजयी/i.test(votecountBlock);
        const isWinner = hasElectedText;
        const isLeading = hasWinClass && !hasElectedText;

        candidates.push({ name, partyName, photoUrl, ekCandidateId, ekPartyId, votes, isWinner, isLeading });
    }
    return candidates;
}

// ─── Supabase helpers ─────────────────────────────────────────────────────────

const partyCache = new Map<string, number>();

async function getOrCreateParty(supabase: SupabaseClient, partyName: string): Promise<number | null> {
    if (partyCache.has(partyName)) return partyCache.get(partyName)!;
    const { data: existing } = await supabase.from('parties').select('id').ilike('name_en', partyName).maybeSingle();
    if (existing) {
        partyCache.set(partyName, existing.id);
        return existing.id;
    }
    const isIndependent = /independent/i.test(partyName);
    const { data: inserted, error } = await supabase.from('parties').insert({
        name_en: partyName,
        abbreviation: isIndependent ? 'IND' : partyName.replace(/[^A-Z]/g, '').substring(0, 5) || partyName.substring(0, 4).toUpperCase(),
        color_hex: '#9ca3af',
    }).select('id').single();
    if (error) return null;
    partyCache.set(partyName, inserted.id);
    return inserted.id;
}

async function getOrCreateCandidate(supabase: SupabaseClient, constId: number, partyId: number | null, cand: any): Promise<number | null> {
    const ekKey = `ek_${constId}_${cand.ekCandidateId}`;
    const isIndependent = /independent/i.test(cand.partyName);
    const { data: existing } = await supabase.from('candidates').select('id').eq('ecn_candidate_id', ekKey).maybeSingle();
    if (existing) return existing.id;
    const { data: inserted, error } = await supabase.from('candidates').insert({
        constituency_id: constId,
        party_id: isIndependent ? null : partyId,
        is_independent: isIndependent,
        name_en: cand.name,
        photo_cloudinary_url: cand.photoUrl,
        ecn_candidate_id: ekKey,
    }).select('id').single();
    if (error) return null;
    return inserted.id;
}

async function upsertResult(supabase: SupabaseClient, candidateId: number, constId: number, votes: number, isWinner: boolean) {
    await supabase.from('results').upsert({
        candidate_id: candidateId,
        constituency_id: constId,
        votes,
        is_winner: isWinner,
        last_scraped_at: new Date().toISOString(),
    }, { onConflict: 'candidate_id' });

    await supabase.from('vote_snapshots').insert({
        candidate_id: candidateId,
        votes,
        snapshot_time: new Date().toISOString()
    });
}

// ─── Scraper Core ─────────────────────────────────────────────────────────────

export async function scrapeConstituency(supabase: SupabaseClient, c: any) {
    const d: any = Array.isArray(c.districts) ? c.districts[0] : c.districts;
    const p: any = d && Array.isArray(d.provinces) ? d.provinces[0] : d?.provinces;

    const provinceName = p?.name_en;
    const districtName = d?.name_en;

    if (!provinceName || !districtName) return { error: 'Missing metadata' };

    const provSlug = PROVINCE_SLUGS[provinceName as keyof typeof PROVINCE_SLUGS];
    if (!provSlug) return { error: 'Unknown province' };

    const distSlug = makeDistrictSlug(districtName);
    const shortPath = `${provSlug}/${distSlug}/constituency-${c.number}`;

    try {
        const url = `https://election.ekantipur.com/${shortPath}?lng=eng`;
        const res = await fetch(url, {
            headers: { 'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36', 'Accept': 'text/html' },
            signal: AbortSignal.timeout(15000),
        });
        if (!res.ok) throw new Error(`HTTP ${res.status}`);
        const html = await res.text();
        const parsed = parseCandidates(html);

        if (parsed.length === 0) return { error: 'No candidates' };

        let withVotes = 0;
        for (const cand of parsed) {
            const partyId = await getOrCreateParty(supabase, cand.partyName);
            const candidateId = await getOrCreateCandidate(supabase, c.id, partyId, cand);
            if (!candidateId) continue;
            await upsertResult(supabase, candidateId, c.id, cand.votes, cand.isWinner);
            if (cand.votes > 0) withVotes++;
        }

        const hasElected = parsed.some(p => p.isWinner);
        await supabase.from('constituencies').update({ status: hasElected ? 'declared' : 'counting' }).eq('id', c.id);

        return { success: true, count: parsed.length, withVotes };
    } catch (e: any) {
        return { error: e.message };
    }
}

// ─── Exports ──────────────────────────────────────────────────────────────────

export async function runScraper() {
    const supabase = getSupabaseService();
    const { data: constituencies } = await supabase.from('constituencies').select('id, number, name_en, districts(name_en, provinces(name_en))').order('id');
    if (!constituencies) return { error: 'Failed' };

    for (let i = constituencies.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [constituencies[i], constituencies[j]] = [constituencies[j], constituencies[i]];
    }

    let successCount = 0, failCount = 0;
    for (const c of constituencies) {
        const res = await scrapeConstituency(supabase, c);
        if (res.success) successCount++; else failCount++;
        await sleep(600);
    }

    await supabase.from('scrape_log').insert({ run_at: new Date().toISOString(), constituencies_updated: successCount, status: failCount === 0 ? 'success' : 'partial' });
    return { successCount, failCount };
}

export async function runSingleScrape(constId: number) {
    const supabase = getSupabaseService();
    const { data: c } = await supabase
        .from('constituencies')
        .select('id, number, name_en, districts(name_en, provinces(name_en))')
        .eq('id', constId)
        .single();
    if (!c) return { error: 'Not found' };
    return await scrapeConstituency(supabase, c);
}
