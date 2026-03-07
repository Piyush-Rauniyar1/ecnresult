import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL || 'https://mock.supabase.co';

// Server-side client: tries to use service role key, but falls back to anon key
const anonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY || 'mock_key';
const serviceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY || anonKey;

if (supabaseUrl === 'https://mock.supabase.co' || serviceRoleKey === 'mock_key') {
    console.warn("Supabase credentials not found. Ensure NEXT_PUBLIC_SUPABASE_URL and NEXT_PUBLIC_SUPABASE_ANON_KEY are set.");
}

// Use this in server components / API routes (has service role key)
export const supabase = createClient(supabaseUrl, serviceRoleKey, {
    auth: {
        persistSession: false,
    }
});

// Use this in 'use client' browser components (anon key only — safe for the browser)
const browserAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY || 'mock_key';
export const supabaseBrowser = createClient(supabaseUrl, browserAnonKey);
