import { NextResponse } from 'next/server';

export const revalidate = 60; // Cache the official endpoint for 60 seconds to avoid spamming the ECN servers

export async function GET() {
    try {
        console.log('[API/STANDINGS] Fetching fresh tokens from ECN...');

        // Step 1: Hit the homepage to get the session and CSRF cookies
        const initRes = await fetch('https://result.election.gov.np/', {
            headers: {
                'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36'
            }
        });

        // Debugging headers in Next.js fetch
        const setCookieHeaders = initRes.headers.get('set-cookie') || '';
        console.log('[API/STANDINGS] Raw Set-Cookie header:', setCookieHeaders);
        for (const [key, value] of initRes.headers) {
            console.log(`[API/STANDINGS] Header [${key}]:`, value);
        }

        // Extract cookies
        let csrfToken = '';
        let sessionId = '';

        const csrfMatch = setCookieHeaders.match(/CsrfToken=([^;]+)/i);
        if (csrfMatch) csrfToken = csrfMatch[1];

        const sessionMatch = setCookieHeaders.match(/ASP\.NET_SessionId=([^;]+)/i);
        if (sessionMatch) sessionId = sessionMatch[1];

        console.log('[API/STANDINGS] Parsed:', { csrfToken, sessionId });

        if (!csrfToken) {
            throw new Error(`Failed to extract CSRF token from ECN headers: ${setCookieHeaders.substring(0, 100)}`);
        }

        console.log(`[API/STANDINGS] Tokens acquired. Fetching data...`);

        // Step 2: Fetch the actual JSON data using the extracted tokens
        const dataRes = await fetch('https://result.election.gov.np/Handlers/SecureJson.ashx?file=JSONFiles/Election2082/Common/HoRPartyTop5.txt', {
            headers: {
                'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
                'X-CSRF-Token': csrfToken,
                'Referer': 'https://result.election.gov.np/',
                'X-Requested-With': 'XMLHttpRequest',
                'Cookie': `CsrfToken=${csrfToken}; ASP.NET_SessionId=${sessionId}`
            }
        });

        if (!dataRes.ok) {
            throw new Error(`ECN API responded with status: ${dataRes.status}`);
        }

        const data = await dataRes.json();

        return NextResponse.json(data);

    } catch (error: any) {
        console.error('[API/STANDINGS] Fetch Error:', error);
        return NextResponse.json({ error: error.message }, { status: 500 });
    }
}
