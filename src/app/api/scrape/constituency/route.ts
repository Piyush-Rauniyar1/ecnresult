import { NextResponse } from 'next/server';
import { runSingleScrape } from '@/lib/ekantipur-scraper';

export async function POST(req: Request) {
    try {
        const { id } = await req.json();

        if (!id) {
            return NextResponse.json({ error: 'Constituency ID is required' }, { status: 400 });
        }

        console.log(`[API/SCRAPE] Manual trigger for constituency ID: ${id}`);

        const result = await runSingleScrape(Number(id));

        if (result.error) {
            return NextResponse.json({ error: result.error }, { status: 500 });
        }

        return NextResponse.json({
            success: true,
            message: `Scraped ${result.count} candidates for constituency ${id}`,
            data: result
        });

    } catch (error: any) {
        console.error('[API/SCRAPE] Error:', error);
        return NextResponse.json({ error: error.message }, { status: 500 });
    }
}
