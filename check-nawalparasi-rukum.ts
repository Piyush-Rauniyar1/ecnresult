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
        .select('id, name_en, districts(name_en)')
        .order('name_en');
    
    if (all) {
        const filtered = all.filter((c: any) => 
            c.name_en.includes('Nawalparasi') || 
            c.name_en.includes('Parasi') ||
            (c.districts as any)?.name_en.includes('Nawalparasi') ||
            (c.districts as any)?.name_en.includes('Parasi') ||
            c.name_en.includes('Rukum') ||
            (c.districts as any)?.name_en.includes('Rukum')
        );
        
        console.log('Nawalparasi and Rukum constituencies:');
        filtered.forEach((c: any) => {
            console.log(`${c.id}: ${c.name_en} (${(c.districts as any).name_en})`);
        });
    }
}

main().catch(console.error);
