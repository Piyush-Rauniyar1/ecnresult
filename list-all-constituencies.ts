#!/usr/bin/env node

import 'dotenv/config';
import { createClient } from '@supabase/supabase-js';

const db = createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
);

async function main() {
    const { data: all } = await db
        .from('constituencies')
        .select('id, name_en, district_id, districts(name_en)')
        .limit(200);
    
    console.log('Total constituencies:', all?.length);
    console.log('\nAll constituencies:');
    if (all) {
        for (const c of all) {
            const distName = (c.districts as any)?.name_en || 'unknown';
            console.log(`${c.id}: ${c.name_en} (${distName})`);
        }
    }
}

main().catch(console.error);
