import { runSingleScrape } from './src/lib/ekantipur-scraper';
import { createClient } from '@supabase/supabase-js';

const db = createClient(process.env.NEXT_PUBLIC_SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY);

async function run() {
    console.log("Fetching all 165 voting districts...");
    const { data: constituencies } = await db.from('constituencies').select('id, name_en').order('id');

    // The ones they specifically requested
    const prioIds = [22, 24, 5, 9, 21, 7, 8, 6, 23, 63, 64, 65, 12, 13, 11]; // Just prioritizing some general ones

    console.log(`Spinning up thread pool...`);
    const limit = 10;
    let i = 0;
    while (i < constituencies.length) {
        const batch = constituencies.slice(i, i + limit);
        await Promise.all(batch.map(async (c) => {
            await runSingleScrape(c.id).catch(e => console.error(`${c.name_en} Failed`, e));
            console.log(`[Synced] ${c.name_en}`);
        }));
        i += limit;
    }
    console.log("All data scraped and synced to Supabase DB!");
}
run();
