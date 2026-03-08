#!/usr/bin/env node
/**
 * Scraper for specific constituencies with correct URLs
 */

import 'dotenv/config';
import { createClient, SupabaseClient } from '@supabase/supabase-js';

const db = createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
);

// Nepali digit mapping
const NEP_DIGITS: { [key: string]: string } = {
    '०': '0', '१': '1', '२': '2', '३': '3', '४': '4',
    '५': '5', '६': '6', '७': '7', '८': '8', '९': '9',
};

function parseNumber(str: string): number {
    if (!str) return 0;
    let cleaned = str.replace(/,/g, '');
    for (const [nep, eng] of Object.entries(NEP_DIGITS)) {
        cleaned = cleaned.split(nep).join(eng);
    }
    const match = cleaned.match(/\d+/);
    return match ? parseInt(match[0], 10) : 0;
}

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

const partyCache = new Map<string, number>();

async function getOrCreateParty(partyName: string): Promise<number | null> {
    if (partyCache.has(partyName)) return partyCache.get(partyName)!;
    
    const { data: existing } = await db.from('parties').select('id').ilike('name_en', partyName).maybeSingle();
    if (existing) {
        partyCache.set(partyName, existing.id);
        return existing.id;
    }
    
    const isIndependent = /independent/i.test(partyName);
    const { data: inserted, error } = await db.from('parties').insert({
        name_en: partyName,
        abbreviation: isIndependent ? 'IND' : partyName.replace(/[^A-Z]/g, '').substring(0, 5) || partyName.substring(0, 4).toUpperCase(),
        color_hex: '#9ca3af',
    }).select('id').single();
    
    if (error) {
        console.error(`Error creating party ${partyName}:`, error);
        return null;
    }
    
    partyCache.set(partyName, inserted.id);
    return inserted.id;
}

async function getOrCreateCandidate(constId: number, partyId: number | null, cand: any): Promise<number | null> {
    const ekKey = `ek_${constId}_${cand.ekCandidateId}`;
    const isIndependent = /independent/i.test(cand.partyName);
    
    const { data: existing } = await db.from('candidates').select('id').eq('ecn_candidate_id', ekKey).maybeSingle();
    if (existing) return existing.id;
    
    const { data: inserted, error } = await db.from('candidates').insert({
        constituency_id: constId,
        party_id: isIndependent ? null : partyId,
        is_independent: isIndependent,
        name_en: cand.name,
        photo_cloudinary_url: cand.photoUrl,
        ecn_candidate_id: ekKey,
    }).select('id').single();
    
    if (error) {
        console.error(`Error creating candidate ${cand.name}:`, error);
        return null;
    }
    
    return inserted.id;
}

async function upsertResult(candidateId: number, constId: number, votes: number, isWinner: boolean) {
    await db.from('results').upsert({
        candidate_id: candidateId,
        constituency_id: constId,
        votes,
        is_winner: isWinner,
        last_scraped_at: new Date().toISOString(),
    }, { onConflict: 'candidate_id' });

    // Insert vote snapshots (optional, ignore errors)
    try {
        await db.from('vote_snapshots').insert({
            candidate_id: candidateId,
            votes,
            snapshot_time: new Date().toISOString()
        });
    } catch (e) {
        // Ignore vote_snapshots errors
    }
}

interface ConstituencyMap {
    name: string;
    url: string;
    constId?: number;
}

const URLS_TO_SCRAPE: ConstituencyMap[] = [
    { name: 'Ilam-1', url: 'https://election.ekantipur.com/pradesh-1/district-illam/constituency-1?lng=eng' },
    { name: 'Ilam-2', url: 'https://election.ekantipur.com/pradesh-1/district-illam/constituency-2?lng=eng' },
    { name: 'Tehrathum-1', url: 'https://election.ekantipur.com/pradesh-1/district-terhathum/constituency-1?lng=eng' },
    { name: 'Dhanusha-1', url: 'https://election.ekantipur.com/pradesh-2/district-dhanusa/constituency-1?lng=eng' },
    { name: 'Dhanusha-2', url: 'https://election.ekantipur.com/pradesh-2/district-dhanusa/constituency-2?lng=eng' },
    { name: 'Dhanusha-3', url: 'https://election.ekantipur.com/pradesh-2/district-dhanusa/constituency-3?lng=eng' },
    { name: 'Dhanusha-4', url: 'https://election.ekantipur.com/pradesh-2/district-dhanusa/constituency-4?lng=eng' },
    { name: 'Dolakha-1', url: 'https://election.ekantipur.com/pradesh-3/district-dolkha/constituency-1?lng=eng' },
];

async function fetchAndParseConstituency(constId: number, url: string): Promise<{ success: boolean; count: number; withVotes: number; error?: string }> {
    try {
        const res = await fetch(url, {
            headers: { 'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36' },
            signal: AbortSignal.timeout(15000),
        });
        
        if (!res.ok) throw new Error(`HTTP ${res.status}`);
        
        const html = await res.text();
        const parsed = parseCandidates(html);

        if (parsed.length === 0) return { success: false, count: 0, withVotes: 0, error: 'No candidates found' };

        let withVotes = 0;
        for (const cand of parsed) {
            const partyId = await getOrCreateParty(cand.partyName);
            const candidateId = await getOrCreateCandidate(constId, partyId, cand);
            if (!candidateId) continue;
            await upsertResult(candidateId, constId, cand.votes, cand.isWinner);
            if (cand.votes > 0) withVotes++;
        }

        const hasElected = parsed.some(p => p.isWinner);
        await db.from('constituencies').update({ 
            status: hasElected ? 'declared' : 'counting',
            last_updated_at: new Date().toISOString()
        }).eq('id', constId);

        return { success: true, count: parsed.length, withVotes };
    } catch (e: any) {
        return { success: false, count: 0, withVotes: 0, error: e.message };
    }
}

async function main() {
    console.log('🔄 Fetching constituency IDs from database...\n');
    
    // Fetch constituency IDs for the ones we need to update
    const { data: constituencies, error } = await db
        .from('constituencies')
        .select('id, name_en, district_id');
    
    if (error || !constituencies) {
        console.error('Error fetching constituencies:', error);
        process.exit(1);
    }

    // Map constituency names to their IDs
    const constMap = new Map<string, number>();
    for (const c of constituencies) {
        constMap.set(c.name_en, c.id);
    }

    let successCount = 0;
    let failCount = 0;

    for (const item of URLS_TO_SCRAPE) {
        const constId = constMap.get(item.name);
        
        if (!constId) {
            console.log(`❌ ${item.name} - Constituency not found in database`);
            failCount++;
            continue;
        }

        process.stdout.write(`⏳ Scraping ${item.name}... `);
        
        const result = await fetchAndParseConstituency(constId, item.url);
        
        if (result.success) {
            console.log(`✅ Updated (${result.count} candidates, ${result.withVotes} with votes)`);
            successCount++;
        } else {
            console.log(`❌ Failed: ${result.error}`);
            failCount++;
        }

        // Rate limiting
        await new Promise(r => setTimeout(r, 800));
    }

    console.log(`\n📊 Results: ${successCount} succeeded, ${failCount} failed`);
    process.exit(failCount > 0 ? 1 : 0);
}

main().catch(err => {
    console.error('Fatal error:', err);
    process.exit(1);
});
