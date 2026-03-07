import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL || 'https://mock.supabase.co';

// Server-side client: has access to SUPABASE_SERVICE_ROLE_KEY (bypasses RLS)
const serviceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY || 'mock_key';

if (supabaseUrl === 'https://mock.supabase.co') {
    console.warn("Supabase credentials not found. Using mock fallback for build. Ensure environment variables are set in production.");
}

// Use this in server components / API routes (has service role key)
export const supabase = createClient(supabaseUrl, serviceRoleKey, {
    auth: {
        persistSession: false,
    }
});

// Use this in 'use client' browser components (anon key only — safe for the browser)
const anonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY || 'mock_key';
export const supabaseBrowser = createClient(supabaseUrl, anonKey);
