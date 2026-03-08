#!/usr/bin/env node
/**
 * Manual update script for specific constituencies with corrected URLs
 */

import 'dotenv/config';
import { createClient } from '@supabase/supabase-js';

const db = createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
);

// URLs provided by user
const URLS_TO_SCRAPE = [
    { name: 'Illam 1', url: 'https://election.ekantipur.com/pradesh-1/district-illam/constituency-1?lng=eng' },
    { name: 'Illam 2', url: 'https://election.ekantipur.com/pradesh-1/district-illam/constituency-2?lng=eng' },
    { name: 'Terhathum 1', url: 'https://election.ekantipur.com/pradesh-1/district-terhathum/constituency-1?lng=eng' },
    { name: 'Dhanusa 1', url: 'https://election.ekantipur.com/pradesh-2/district-dhanusa/constituency-1?lng=eng' },
    { name: 'Dhanusa 2', url: 'https://election.ekantipur.com/pradesh-2/district-dhanusa/constituency-2?lng=eng' },
    { name: 'Dhanusa 3', url: 'https://election.ekantipur.com/pradesh-2/district-dhanusa/constituency-3?lng=eng' },
    { name: 'Dhanusa 4', url: 'https://election.ekantipur.com/pradesh-2/district-dhanusa/constituency-4?lng=eng' },
    { name: 'Dolkha 1', url: 'https://election.ekantipur.com/pradesh-3/district-dolkha/constituency-1?lng=eng' },
];

async function testUrls() {
    console.log('Testing URLs provided by user...\n');
    
    for (const item of URLS_TO_SCRAPE) {
        try {
            const res = await fetch(item.url, {
                headers: { 'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36' },
                signal: AbortSignal.timeout(10000),
            });
            
            const status = res.status;
            const ok = res.ok;
            const contentLength = res.headers.get('content-length');
            
            console.log(`${ok ? '✅' : '❌'} ${item.name}`);
            console.log(`   Status: ${status} | Content-Length: ${contentLength} bytes`);
            
            if (ok) {
                const html = await res.text();
                const candidateCount = (html.match(/\/profile\/\d+/g) || []).length;
                console.log(`   Found ${candidateCount} candidate profiles`);
            }
            console.log('');
        } catch (e: any) {
            console.log(`❌ ${item.name}`);
            console.log(`   Error: ${e.message}\n`);
        }
    }
}

testUrls().catch(console.error);
