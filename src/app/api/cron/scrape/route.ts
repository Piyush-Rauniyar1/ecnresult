import { NextResponse } from 'next/server';
import { runScraper } from '@/lib/ekantipur-scraper';

export async function GET(request: Request) {
    // Extract authorization header
    const authHeader = request.headers.get('authorization');
    const cronSecret = process.env.CRON_SECRET;

    if (authHeader !== `Bearer ${cronSecret}`) {
        return new NextResponse('Unauthorized', { status: 401 });
    }

    // Run the scraping job
    try {
        const stats = await runScraper();
        if (stats && !stats.error) {
            return NextResponse.json({
                message: 'Scraping cycle completed successfully',
                stats
            });
        } else {
            return NextResponse.json({ error: 'Scraping cycle encountered an error' }, { status: 500 });
        }
    } catch (err: any) {
        return NextResponse.json({ error: err.message }, { status: 500 });
    }
}
