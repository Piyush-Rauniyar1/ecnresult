#!/usr/bin/env node
/**
 * Check constituency names in database
 */

import 'dotenv/config';
import { createClient } from '@supabase/supabase-js';

const db = createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
);

async function main() {
    const { data: constituencies } = await db
        .from('constituencies')
        .select('id, name_en')
        .in('name_en', ['Illam 1', 'Illam 2', 'Terhathum 1', 'Dhanusa 1', 'Dhanusa 2', 'Dhanusa 3', 'Dhanusa 4', 'Dolkha 1']);
    
    console.log('Found constituencies:', constituencies);
    console.log('\n\nSearching for similar names:\n');
    
    const { data: all } = await db
        .from('constituencies')
        .select('id, name_en, districts(name_en)')
        .order('name_en');
    
    if (all) {
        for (const c of all) {
            if (c.name_en.toLowerCase().includes('illam') || 
                c.name_en.toLowerCase().includes('terhathum') ||
                c.name_en.toLowerCase().includes('dhanusa') ||
                c.name_en.toLowerCase().includes('dolkha')) {
                console.log(`ID: ${c.id}, Name: ${c.name_en}, District: ${(c.districts as any).name_en}`);
            }
        }
    }
}

main().catch(console.error);
