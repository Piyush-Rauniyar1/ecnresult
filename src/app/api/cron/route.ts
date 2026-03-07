import { NextResponse } from 'next/server';
import { runScraper } from '@/lib/ekantipur-scraper';

export const maxDuration = 60; // Set max duration for Vercel Serverless Function
export const dynamic = 'force-dynamic';

export async function GET(request: Request) {
    // Authenticate the cron request
    const authHeader = request.headers.get('authorization');
    if (process.env.CRON_SECRET && authHeader !== `Bearer ${process.env.CRON_SECRET}`) {
        return NextResponse.json(
            { error: 'Unauthorized', status: 'You must provide a valid CRON_SECRET Bearer token.' },
            { status: 401 }
        );
    }

    try {
        console.log('[API/CRON] Triggering scraper...');
        const result = await runScraper();
        console.log('[API/CRON] Scraper completed:', result);

        return NextResponse.json({
            success: true,
            message: 'Scraper executed successfully.',
            data: result
        });
    } catch (error: any) {
        console.error('[API/CRON] Scraper failed:', error);
        return NextResponse.json({
            success: false,
            error: error.message || 'Unknown error during scraping'
        }, { status: 500 });
    }
}
