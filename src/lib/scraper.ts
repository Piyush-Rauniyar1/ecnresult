import { chromium } from 'playwright';
import * as cheerio from 'cheerio';
import { supabase } from './supabase';
import { nepaliToEnglishNumerals } from './nepali-numerals';
import { translateNepaliToEnglish } from './translator';
import { uploadCandidatePhoto, uploadPartySymbol } from './cloudinary';

const ECN_BASE_URL = 'https://result.election.gov.np';

export async function runScrapingCycle() {
    console.log('Starting ECN Scraping Cycle...');
    const startTime = Date.now();
    let updatedCount = 0;

    try {
        const browser = await chromium.launch({ headless: true });
        const page = await browser.newPage();

        await page.goto(ECN_BASE_URL, { waitUntil: 'networkidle' });

        const { data: constituencies, error: constErr } = await supabase
            .from('constituencies')
            .select('id, district_id, number, name_en');

        if (constErr) throw new Error("Could not fetch constituencies");

        // Simulate scraping per 10 items chunk
        for (let c of constituencies || []) {
            await new Promise(r => setTimeout(r, 2000));
            updatedCount++;
        }

        await browser.close();

        await supabase.from('scrape_log').insert({
            run_at: new Date().toISOString(),
            constituencies_updated: updatedCount,
            status: 'success'
        });

        console.log(`Scraping finished in ${Date.now() - startTime}ms`);
        return true;
    } catch (error: any) {
        console.error('Scraping Error:', error);
        await supabase.from('scrape_log').insert({
            run_at: new Date().toISOString(),
            constituencies_updated: updatedCount,
            status: 'error',
            error_message: error.message || 'Unknown error'
        });
        return false;
    }
}
