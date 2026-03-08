'use client';

import { useEffect, useState } from 'react';
import { supabaseBrowser } from '@/lib/supabase';

interface SeatResult {
  partyName: string;
  partyColor: string;
  count: number;
}

interface Seat {
  id: number;
  partyName: string | null;
  partyColor: string;
  position?: { x: number; y: number };
}

export default function SeatMap() {
  const [seats, setSeats] = useState<Seat[]>([]);
  const [partyStats, setPartyStats] = useState<SeatResult[]>([]);
  const [loading, setLoading] = useState(true);
  const [hoveredSeat, setHoveredSeat] = useState<number | null>(null);

  // Function to calculate proper hemicycle parliament positions
  const calculateParliamentPositions = (totalSeats: number) => {
    const positions: { [key: number]: { x: number; y: number } } = {};
    
    const centerX = 300;
    const centerY = 380;
    const minRadius = 60;
    const maxRadius = 340;
    const seatRadius = 10;
    
    // Distribute seats into arcs
    const arcs: number[] = [];
    let remainingSeats = totalSeats;
    let seatsInArc = 8;
    
    while (remainingSeats > 0) {
      arcs.push(Math.min(seatsInArc, remainingSeats));
      remainingSeats -= seatsInArc;
      seatsInArc += 1.5;
    }
    
    let seatIndex = 0;
    arcs.forEach((countInArc, arcIndex) => {
      // Calculate radius for this arc
      const radius = minRadius + (arcIndex / (arcs.length > 1 ? arcs.length - 1 : 1)) * (maxRadius - minRadius);
      
      // Spread across 180 degrees (hemicycle)
      const angleSpan = Math.PI; // 180 degrees
      const startAngle = 0; // Start from right
      
      for (let i = 0; i < countInArc; i++) {
        const normalizedI = countInArc > 1 ? i / (countInArc - 1) : 0.5;
        const angle = startAngle + normalizedI * angleSpan;
        
        const x = centerX + radius * Math.cos(angle);
        const y = centerY - radius * Math.sin(angle);
        
        positions[seatIndex] = { x, y };
        seatIndex++;
      }
    });
    
    return positions;
  };

  useEffect(() => {
    async function fetchSeats() {
      // Fetch all constituencies with their winning results
      const { data: constituencies, error } = await supabaseBrowser
        .from('constituencies')
        .select(`
          id, name_en, status,
          results(
            is_winner,
            candidates(
              parties(name_en, color_hex)
            )
          )
        `);

      if (!error && constituencies) {
        // Transform to seats
        const seatData: Seat[] = constituencies.map((c: any) => {
          const winnerRow = c.results?.find((r: any) => r.is_winner);
          const partyName = winnerRow?.candidates?.parties?.name_en || null;
          const partyColor = winnerRow?.candidates?.parties?.color_hex || '#e5e7eb';

          return {
            id: c.id,
            partyName,
            partyColor
          };
        });

        // Calculate positions
        const positions = calculateParliamentPositions(seatData.length);
        const seatsWithPositions = seatData.map((seat, index) => ({
          ...seat,
          position: positions[index]
        }));

        setSeats(seatsWithPositions);

        // Calculate party stats
        const partyMap = new Map<string, { count: number; color: string }>();
        seatData.forEach(seat => {
          if (seat.partyName) {
            const existing = partyMap.get(seat.partyName) || { count: 0, color: seat.partyColor };
            partyMap.set(seat.partyName, {
              count: existing.count + 1,
              color: seat.partyColor
            });
          }
        });

        const stats = Array.from(partyMap.entries())
          .map(([name, data]) => ({
            partyName: name,
            partyColor: data.color,
            count: data.count
          }))
          .sort((a, b) => b.count - a.count);

        setPartyStats(stats);
      }
      setLoading(false);
    }

    fetchSeats();
  }, []);

  if (loading) {
    return (
      <div className="bg-white rounded-2xl border border-gray-100 shadow-sm p-8">
        <div className="flex items-center justify-center h-96">
          <div className="text-center">
            <div className="inline-block h-8 w-8 animate-spin rounded-full border-4 border-gray-300 border-t-blue-600"></div>
            <p className="mt-4 text-gray-500">Loading parliament...</p>
          </div>
        </div>
      </div>
    );
  }

  const seatRadius = 11;

  return (
    <div className="bg-white rounded-2xl border border-gray-100 shadow-sm overflow-hidden">
      <div className="p-6 border-b border-gray-100">
        <h2 className="text-2xl font-black text-gray-900">Parliamentary Seat Map</h2>
        <p className="text-sm text-gray-500 mt-1">Hemicycle visualization of 165 constituency seats by winning party</p>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-4 gap-6 p-6">
        {/* Nested Parliament Visualization */}
        <div className="lg:col-span-3">
          <div className="bg-gradient-to-b from-gray-50 to-gray-100 rounded-xl p-8 flex items-center justify-center">
            <svg width="700" height="480" className="max-w-full h-auto" viewBox="0 0 700 480">
              {/* Background */}
              <defs>
                <linearGradient id="bgGradient" x1="0%" y1="0%" x2="0%" y2="100%">
                  <stop offset="0%" style={{ stopColor: '#f9fafb', stopOpacity: 1 }} />
                  <stop offset="100%" style={{ stopColor: '#f3f4f6', stopOpacity: 1 }} />
                </linearGradient>
              </defs>
              <rect width="700" height="480" fill="url(#bgGradient)" rx="12" />
              
              {/* Seats */}
              {seats.map((seat, index) => {
                const isHovered = hoveredSeat === seat.id;
                return (
                  <g key={seat.id}>
                    <circle
                      cx={seat.position?.x}
                      cy={seat.position?.y}
                      r={seatRadius}
                      fill={seat.partyColor}
                      className="transition-all cursor-pointer"
                      style={{
                        filter: isHovered ? 'drop-shadow(0 0 10px rgba(0,0,0,0.4))' : 'drop-shadow(0 2px 4px rgba(0,0,0,0.15))',
                        stroke: isHovered ? 'rgba(255,255,255,0.8)' : 'none',
                        strokeWidth: isHovered ? '2' : '0',
                        transform: isHovered ? `scale(1.4)` : 'scale(1)',
                        transformOrigin: `${seat.position?.x}px ${seat.position?.y}px`,
                        transition: 'all 0.2s ease'
                      }}
                      onMouseEnter={() => setHoveredSeat(seat.id)}
                      onMouseLeave={() => setHoveredSeat(null)}
                    />
                    {/* Tooltip */}
                    {isHovered && (
                      <g>
                        <rect
                          x={(seat.position?.x || 0) - 70}
                          y={(seat.position?.y || 0) - 50}
                          width="140"
                          height="32"
                          fill="#1f2937"
                          rx="4"
                          opacity="0.95"
                        />
                        <text
                          x={seat.position?.x}
                          y={(seat.position?.y || 0) - 28}
                          textAnchor="middle"
                          fill="white"
                          fontSize="13"
                          fontWeight="bold"
                          pointerEvents="none"
                        >
                          {seat.partyName || 'Undeclared'}
                        </text>
                      </g>
                    )}
                  </g>
                );
              })}
            </svg>
          </div>
          <div className="mt-6 text-center text-sm text-gray-600">
            Total: <span className="font-bold text-gray-900">{seats.length}</span> seats
          </div>
        </div>

        {/* Party Standings Sidebar */}
        <div className="lg:col-span-1">
          <div className="bg-gray-50 rounded-xl p-4 max-h-96 overflow-y-auto">
            <h3 className="font-bold text-gray-900 mb-4 text-sm">Party Standings</h3>
            <div className="space-y-3">
              {partyStats.map((party) => (
                <div key={party.partyName} className="flex items-center gap-3">
                  <div
                    className="flex-shrink-0 w-4 h-4 rounded-full shadow-sm"
                    style={{ backgroundColor: party.partyColor }}
                  />
                  <div className="flex-1 min-w-0">
                    <p className="text-sm font-semibold text-gray-900 truncate">
                      {party.partyName}
                    </p>
                  </div>
                  <span className="flex-shrink-0 text-sm font-black text-gray-900 bg-white px-2 py-1 rounded">
                    {party.count}
                  </span>
                </div>
              ))}
            </div>

            {/* Undeclared count */}
            {seats.filter(s => !s.partyName).length > 0 && (
              <div className="mt-4 pt-4 border-t border-gray-200">
                <div className="flex items-center gap-3">
                  <div className="flex-shrink-0 w-4 h-4 rounded-full bg-gray-300 shadow-sm" />
                  <div className="flex-1 min-w-0">
                    <p className="text-sm font-semibold text-gray-900">Undeclared</p>
                  </div>
                  <span className="flex-shrink-0 text-sm font-black text-gray-900 bg-white px-2 py-1 rounded">
                    {seats.filter(s => !s.partyName).length}
                  </span>
                </div>
              </div>
            )}
          </div>
        </div>
      </div>
    </div>
  );
}