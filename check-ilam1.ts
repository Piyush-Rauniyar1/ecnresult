#!/usr/bin/env node

import 'dotenv/config';
import { createClient } from '@supabase/supabase-js';

const db = createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
);

async function main() {
    console.log('Checking Ilam-1 data...\n');
    
    // Get constituency ID
    const { data: const1 } = await db
        .from('constituencies')
        .select('id')
        .eq('name_en', 'Ilam-1')
        .single();
    
    if (!const1) {
        console.log('Ilam-1 not found');
        return;
    }

    const constId = const1.id;
    console.log(`Ilam-1 ID: ${constId}\n`);

    // Get all candidates
    const { data: candidates } = await db
        .from('candidates')
        .select('id, name_en')
        .eq('constituency_id', constId);

    console.log(`Total candidates in DB: ${candidates?.length || 0}\n`);

    if (candidates) {
        console.log('Candidates:');
        candidates.forEach((c, i) => {
            console.log(`${i + 1}. ${c.name_en}`);
        });
    }

    // Get results
    const { data: results } = await db
        .from('results')
        .select('votes, is_winner, candidates(name_en)')
        .eq('constituency_id', constId)
        .order('votes', { ascending: false });

    console.log(`\n\nResults with votes:`);
    if (results) {
        results.forEach((r, i) => {
            console.log(`${i + 1}. ${(r.candidates as any).name_en}: ${r.votes} votes (Winner: ${r.is_winner})`);
        });
    }
}

main().catch(console.error);
