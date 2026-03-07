import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL || '';
const serviceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY || '';
const supabase = createClient(supabaseUrl, serviceRoleKey);

async function forceRukumWin() {
    console.log("Forcing win for Pushpa Kamal Dahal...");

    // 1. Get Rukum East constituency via district mapping
    const { data: ct } = await supabase
        .from('constituencies')
        .select('id, number, districts!inner(name_en)')
        .ilike('districts.name_en', '%Eastern%Rukum%')
        .single();

    if (!ct) {
        console.error("Could not find Rukum East via districts relation");
        return;
    }

    // 2. Find Pushpa Kamal Dahal in Rukum East-1
    const { data: cands } = await supabase
        .from('candidates')
        .select('id, name_en')
        .eq('constituency_id', ct.id)
        .ilike('name_en', '%Pushpa%');

    if (!cands || cands.length === 0) {
        console.error("Could not find Pushpa Kamal Dahal");
        return;
    }

    // 3. Mark as winner and update constituency status
    const targetId = cands[0].id;
    await supabase.from('results').upsert({
        candidate_id: targetId,
        constituency_id: ct.id,
        is_winner: true,
        votes: 34125 // Add some placeholder votes so it shows correctly on hover
    }, { onConflict: 'candidate_id' });

    await supabase.from('constituencies').update({ status: 'declared' }).eq('id', ct.id);

    console.log(`✅ Successfully updated ${cands[0].name_en} to winner in Eastern Rukum-1`);
}

forceRukumWin();
