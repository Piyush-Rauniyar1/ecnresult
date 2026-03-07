import { createClient } from '@supabase/supabase-js';
import fs from 'fs';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL || '';
const serviceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY || '';
const supabase = createClient(supabaseUrl, serviceRoleKey);

async function debugMerge() {
    console.log("Fetching DB Results...");
    const { data: results } = await supabase
        .from('results')
        .select(`
            id, is_winner, votes,
            candidate:candidates(id, name_en, name_ne, parties(name_en, name_ne, color, logo_url)),
            constituency:constituencies(id, number, districts(name_en))
        `)
        .eq('is_winner', true);

    if (!results) {
        console.error("No results found");
        return;
    }

    console.log(`Found ${results.length} winners in DB`);

    // Look at Chitwan DB entries
    const chitwanWinners = results.filter(r => r.constituency?.districts?.name_en?.toLowerCase().includes('chitwan'));
    console.log("\nChitwan DB Winners:", JSON.stringify(chitwanWinners.map(w => ({
        candidate: w.candidate?.name_en,
        party: w.candidate?.parties?.name_en,
        district: w.constituency?.districts?.name_en,
        con: w.constituency?.number
    })), null, 2));

    // Look at GeoJSON logic
    const gJson = JSON.parse(fs.readFileSync('public/nepal-165-constituencies.geojson', 'utf8'));
    const chitwanFeatures = gJson.features.filter((f: any) => f.properties.DISTRICT === 'CHITAWAN');
    console.log(`\nFound ${chitwanFeatures.length} Chitwan GeoJSON Features`);

    const NAME_ALIASES: Record<string, string> = {
        'eastern rukum': 'rukum_e',
        'western rukum': 'rukum_w',
        'eastern nawalparasi': 'nawalparasi_e',
        'western nawalparasi': 'nawalparasi_w',
        'chitwan': 'chitawan'
    };

    console.log("\nSimulating Map Merge Logic:");
    chitwanFeatures.forEach((feature: any) => {
        const geoJSONDistrict = feature.properties.DISTRICT.toLowerCase();
        const geoJSONCon = feature.properties.CON;

        console.log(`\nEvaluating GeoJSON Feature: ${geoJSONDistrict} - ${geoJSONCon}`);

        let foundMatch = false;
        results.forEach((w: any) => {
            if (!w.constituency?.districts?.name_en) return;
            const dbDistrictRaw = w.constituency.districts.name_en.toLowerCase();
            const dbDistrictAliased = NAME_ALIASES[dbDistrictRaw] || dbDistrictRaw;
            const dbCon = w.constituency.number;

            if (geoJSONDistrict === 'chitawan' && dbDistrictRaw === 'chitwan') {
                console.log(`   Comparing to DB Record: Raw=${dbDistrictRaw}, Aliased=${dbDistrictAliased}, Con=${dbCon}`);
                if (dbDistrictAliased === geoJSONDistrict && dbCon === geoJSONCon) {
                    console.log(`   ✅ MATCH FOUND! Winner: ${w.candidate?.name_en}`);
                    foundMatch = true;
                }
            }
        });

        if (!foundMatch) {
            console.log(`   ❌ NO MATCH FOUND`);
        }
    });
}

debugMerge();
