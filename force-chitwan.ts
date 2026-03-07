import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL || '';
const serviceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY || '';

const supabase = createClient(supabaseUrl, serviceRoleKey);

async function forceWin() {
    console.log("Forcing win for Rabi Lamichhane (ID 9237)...");

    // Mark as winner
    await supabase.from('results').upsert({
        candidate_id: 9237,
        constituency_id: 64, // Chitwan-2
        is_winner: true
    }, { onConflict: 'candidate_id' });

    // Make sure old duplicate isn't winning
    await supabase.from('results').update({ is_winner: false }).eq('candidate_id', 556);

    // Update constituency status
    await supabase.from('constituencies').update({ status: 'declared' }).eq('id', 64);

    console.log("✅ Successfully updated Rabi Lamichhane (9237) to winner in Chitwan-2");
}

forceWin();
