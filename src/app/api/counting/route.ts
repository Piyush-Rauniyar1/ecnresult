import { supabase } from '@/lib/supabase';
import { NextResponse } from 'next/server';

export async function GET() {
  try {
    // Get constituencies that are still being counted (not declared)
    const { data: countingConstituencies, error } = await supabase
      .from('constituencies')
      .select('id, name_en, status')
      .neq('status', 'declared')
      .order('id');

    if (error) {
      return NextResponse.json({ error: error.message }, { status: 500 });
    }

    // Get total counts for summary
    const { count: totalCount } = await supabase
      .from('constituencies')
      .select('*', { count: 'exact', head: true });

    const { count: declaredCount } = await supabase
      .from('constituencies')
      .select('*', { count: 'exact', head: true })
      .eq('status', 'declared');

    return NextResponse.json({
      counting: countingConstituencies,
      summary: {
        total: totalCount,
        declared: declaredCount,
        stillCounting: countingConstituencies.length
      }
    });
  } catch (error) {
    return NextResponse.json({ error: 'Internal server error' }, { status: 500 });
  }
}