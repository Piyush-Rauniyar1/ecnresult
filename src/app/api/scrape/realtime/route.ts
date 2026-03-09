import { NextResponse } from 'next/server';
import { runSingleScrape } from '@/lib/ekantipur-scraper';

export const maxDuration = 300; // 5 minutes max
export const dynamic = 'force-dynamic';

// The 8 constituencies to continuously scrape
const TARGET_CONSTITUENCIES = [3, 4, 9, 26, 33, 34, 35, 36, 68, 85, 84, 93, 37, 96, 127, 128, 121, 149]; // All 18 active constituencies

export async function GET(request: Request) {
    try {
        console.log('[API/REALTIME-SCRAPE] Starting realtime scrape for 8 constituencies...');
        
        const results = [];
        
        // Scrape each constituency sequentially with minimal delay
        for (const constId of TARGET_CONSTITUENCIES) {
            try {
                console.log(`[API/REALTIME-SCRAPE] Scraping constituency ${constId}...`);
                const result = await runSingleScrape(constId);
                results.push({ constId, success: !!result.success, count: result.count, error: result.error });
                
                // Small delay between requests to be respectful to the server
                await new Promise(r => setTimeout(r, 500));
            } catch (error: any) {
                console.error(`[API/REALTIME-SCRAPE] Error scraping ${constId}:`, error.message);
                results.push({ constId, success: false, error: error.message });
            }
        }

        console.log('[API/REALTIME-SCRAPE] Completed:', results);

        return NextResponse.json({
            success: true,
            message: 'Realtime scrape completed',
            data: results,
            timestamp: new Date().toISOString()
        });

    } catch (error: any) {
        console.error('[API/REALTIME-SCRAPE] Fatal error:', error);
        return NextResponse.json({
            success: false,
            error: error.message || 'Unknown error'
        }, { status: 500 });
    }
}
