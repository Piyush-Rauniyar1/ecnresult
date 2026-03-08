#!/usr/bin/env node

import 'dotenv/config';
import { createClient } from '@supabase/supabase-js';

const db = createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
);

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

        candidates.push({ name, partyName, photoUrl, ekCandidateId, ekPartyId, votes, isWinner });
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
    const { data: inserted } = await db.from('parties').insert({
        name_en: partyName,
        abbreviation: isIndependent ? 'IND' : partyName.replace(/[^A-Z]/g, '').substring(0, 5) || partyName.substring(0, 4).toUpperCase(),
        color_hex: '#9ca3af',
    }).select('id').single();
    
    if (inserted) {
        partyCache.set(partyName, inserted.id);
        return inserted.id;
    }
    return null;
}

async function main() {
    console.log('Fetching Ilam-1 URL to verify data...\n');
    
    const url = 'https://election.ekantipur.com/pradesh-1/district-illam/constituency-1?lng=eng';
    
    try {
        const res = await fetch(url, {
            headers: { 'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36' },
            signal: AbortSignal.timeout(20000),
        });
        
        if (!res.ok) throw new Error(`HTTP ${res.status}`);
        
        const html = await res.text();
        const candidates = parseCandidates(html);

        console.log(`Found ${candidates.length} candidates from URL:\n`);
        candidates.forEach((c, i) => {
            console.log(`${i + 1}. ${c.name} (${c.partyName}) - ${c.votes} votes  ${c.isWinner ? '(WINNER)' : ''}`);
        });

        // Now clear and update DB
        console.log('\n\nDeleting old data and inserting fresh data...');
        
        const { data: const1 } = await db
            .from('constituencies')
            .select('id')
            .eq('name_en', 'Ilam-1')
            .single();
        
        if (!const1) {
            console.log('Ilam-1 not found in DB');
            return;
        }

        const constId = const1.id;

        // Delete old candidates
        const { data: oldCands } = await db
            .from('candidates')
            .select('id')
            .eq('constituency_id', constId);

        if (oldCands && oldCands.length > 0) {
            const candIds = oldCands.map(c => c.id);
            await db.from('results').delete().in('candidate_id', candIds);
            await db.from('vote_snapshots').delete().in('candidate_id', candIds);
            await db.from('candidates').delete().in('id', candIds);
            console.log(`Deleted ${oldCands.length} old candidates`);
        }

        // Insert new candidates
        let inserted = 0;
        for (const cand of candidates) {
            const partyId = await getOrCreateParty(cand.partyName);
            const ekKey = `ek_${constId}_${cand.ekCandidateId}`;
            const isIndependent = /independent/i.test(cand.partyName);
            
            const { data: newCand } = await db.from('candidates').insert({
                constituency_id: constId,
                party_id: isIndependent ? null : partyId,
                is_independent: isIndependent,
                name_en: cand.name,
                photo_cloudinary_url: cand.photoUrl,
                ecn_candidate_id: ekKey,
            }).select('id').single();

            if (newCand) {
                await db.from('results').upsert({
                    candidate_id: newCand.id,
                    constituency_id: constId,
                    votes: cand.votes,
                    is_winner: cand.isWinner,
                    last_scraped_at: new Date().toISOString(),
                }, { onConflict: 'candidate_id' });
                
                inserted++;
            }
        }

        console.log(`Inserted ${inserted} new candidates`);
        console.log('\n✅ Ilam-1 updated with fresh data!');

    } catch (e: any) {
        console.error('Error:', e.message);
    }
}

main();
