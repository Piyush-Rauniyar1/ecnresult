// Basic translation utility using Google Translate API (REST)
export async function translateNepaliToEnglish(text: string): Promise<string> {
    if (!text) return text;

    // Clean up common terms early
    if (text.includes('स्वतन्त्र')) return 'Independent';

    try {
        const apiKey = process.env.GOOGLE_TRANSLATE_API_KEY;
        if (!apiKey) {
            console.warn("GOOGLE_TRANSLATE_API_KEY not set. Returning original text.");
            return text;
        }

        const response = await fetch(
            `https://translation.googleapis.com/language/translate/v2?key=${apiKey}`,
            {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    q: text,
                    source: 'ne',
                    target: 'en',
                    format: 'text'
                })
            }
        );

        const data = await response.json();
        return data?.data?.translations?.[0]?.translatedText || text;
    } catch (error) {
        console.error('Translation error:', error);
        return text;
    }
}
