#!/usr/bin/env node
/**
 * Real-time Background Scraper
 * Continuously scrapes the 8 constituencies every 30 seconds
 * Run with: npm run scrape:realtime
 */

import 'dotenv/config';
import { runSingleScrape } from './src/lib/ekantipur-scraper';

// The 8 target constituencies
const TARGET_CONSTITUENCIES = [
    { id: 3, name: 'Ilam-1' },
    { id: 4, name: 'Ilam-2' },
    { id: 26, name: 'Tehrathum-1' },
    { id: 33, name: 'Dhanusha-1' },
    { id: 34, name: 'Dhanusha-2' },
    { id: 35, name: 'Dhanusha-3' },
    { id: 36, name: 'Dhanusha-4' },
    { id: 68, name: 'Dolakha-1' },
];

async function scrapeAll() {
    console.log(`\n[${new Date().toISOString()}] Starting realtime scrape cycle...`);
    
    let successCount = 0;
    let failCount = 0;

    for (const const_item of TARGET_CONSTITUENCIES) {
        try {
            const result = await runSingleScrape(const_item.id);
            
            if (result.success) {
                console.log(`✅ ${const_item.name} - ${result.count} candidates`);
                successCount++;
            } else {
                console.log(`❌ ${const_item.name} - ${result.error}`);
                failCount++;
            }

            // Small delay between requests
            await new Promise(r => setTimeout(r, 400));
        } catch (error: any) {
            console.log(`❌ ${const_item.name} - ${error.message}`);
            failCount++;
        }
    }

    console.log(`[${new Date().toISOString()}] Cycle complete: ${successCount}✅ ${failCount}❌\n`);
}

async function start() {
    console.log('🚀 Starting Real-time Background Scraper');
    console.log('📍 Monitoring 8 constituencies: Ilam-1/2, Tehrathum-1, Dhanusha-1-4, Dolakha-1');
    console.log('⏱️  Running every 30 seconds\n');

    // Run immediately on start
    await scrapeAll();

    // Then run every 30 seconds
    setInterval(scrapeAll, 30000);

    // Keep the process alive
    process.on('SIGINT', () => {
        console.log('\n\n🛑 Stopping Real-time Scraper...');
        process.exit(0);
    });
}

start().catch(error => {
    console.error('Fatal error:', error);
    process.exit(1);
});
