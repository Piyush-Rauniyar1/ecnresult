#!/usr/bin/env node

import 'dotenv/config';
import { createClient } from '@supabase/supabase-js';

const db = createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
);

console.log('Testing database connection...');

try {
    const { data, error } = await db
        .from('constituencies')
        .select('id, name_en')
        .eq('name_en', 'Dolakha-1')
        .single();
    
    if (error) {
        console.log('Error:', error);
    } else {
        console.log('Found Dolakha-1:', data);
    }
} catch (e) {
    console.error('Exception:', e);
}
