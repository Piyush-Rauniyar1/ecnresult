const fs = require('fs');

const rawCsv = `NC,Nepali Congress,नेपाली काँग्रेस,#0047AB,🌳,Gagan Thapa,1950,Social Democracy / Centrism,165,89,https://upload.wikimedia.org/wikipedia/commons/a/a4/Nepali_Congress_alt_flag.svg
UML,Communist Party of Nepal (Unified Marxist–Leninist),नेकपा (एकीकृत मार्क्सवादी-लेनिनवादी),#E10600,☀️,K.P. Sharma Oli,1991,Democratic Socialism / Communism,164,79,https://upload.wikimedia.org/wikipedia/commons/1/1a/CPN-UML_Flag.svg
RSP,Rastriya Swatantra Party,राष्ट्रिय स्वतन्त्र पार्टी,#FF6B00,🔔,Rabi Lamichhane,2022,Centrist / Anti-corruption,164,21,https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/Rastriya_Swatantra_Party_logo.png/200px-Rastriya_Swatantra_Party_logo.png
NCP,Nepali Communist Party (2025 merger),नेपाली कम्युनिस्ट पार्टी,#CC0000,⭐,Pushpa Kamal Dahal / Madhav Kumar Nepal,2025,Democratic Socialism / Left-wing,164,42 (combined),https://upload.wikimedia.org/wikipedia/commons/thumb/8/8b/Flag_of_CPN_%28Maoist_Centre%29.svg/200px-Flag_of_CPN_%28Maoist_Centre%29.svg.png
RPP,Rastriya Prajatantra Party,राष्ट्रिय प्रजातन्त्र पार्टी,#006400,🐄,Rajendra Lingden,1990,Constitutional Monarchism / Hindu Nationalism,163,14,https://upload.wikimedia.org/wikipedia/commons/thumb/a/a3/Rastriya_Prajatantra_Party_Nepal_logo.png/200px-Rastriya_Prajatantra_Party_Nepal_logo.png
PSP-N,People's Socialist Party Nepal (Janata Samajwadi Party-Nepal),जनता समाजवादी पार्टी नेपाल,#8B4513,☂️,Upendra Yadav,2020,Democratic Socialism / Madhesh Rights,94,12,https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Janata_Samajbadi_Party_Nepal_Flag.svg/200px-Janata_Samajbadi_Party_Nepal_Flag.svg.png
Janamat,Janamat Party,जनमत पार्टी,#DAA520,📢,C.K. Raut,2023,Madhesh Autonomy / Federalism,61,6,https://upload.wikimedia.org/wikipedia/commons/thumb/3/38/Janamat_party_logo.png/200px-Janamat_party_logo.png
UNP,Ujyaalo Nepal Party,उज्यालो नेपाल पार्टी,#FFD700,💡,Kulman Ghising,2025,Centrist / Development,112,0 (new),
SSP,Shram Sanskriti Party,श्रम संस्कृति पार्टी,#8B0000,🤲,N/A,2025,Labour Rights / Localism / Nationalism,109,0 (new),
AJP,Aam Janata Party,आम जनता पार्टी,#4B0082,📱,Rishi Dhamala,2023,Populist / Anti-establishment,82,0,
NWPP,Nepal Workers and Peasants Party,नेपाल मजदुर किसान पार्टी,#B22222,🥁,Narayan Man Bijukchhe,1975,Marxism-Leninism / Agrarianism,120,4,
MNO,Mongol National Organization,मंगोल राष्ट्रिय संगठन,#556B2F,🏔️,Gopal Gurung,1989,Ethnic Rights / Federalism,113,0,
RMP,Rastriya Mukti Party Nepal,राष्ट्रिय मुक्ति पार्टी नेपाल,#708090,✊,N/A,N/A,Left-wing / Nationalism,33,0,
PLP,Pragatishil Loktantrik Party,प्रगतिशील लोकतान्त्रिक पार्टी,#2E8B57,🌿,N/A,N/A,Progressive / Liberal Democracy,82,0,
SLRM,Sanghiya Loktantrik Rastriya Manch,संघीय लोकतान्त्रिक राष्ट्रिय मञ्च,#CD853F,🏛️,N/A,N/A,Federalism / Democracy,23,0,
NJP,Nepal Janamukti Party,नेपाल जनमुक्ति पार्टी,#4169E1,🕊️,N/A,N/A,Left-wing / Liberation,18,0,
RPaP,Rastriya Pariwartan Party,राष्ट्रिय परिवर्तन पार्टी,#FF8C00,🔄,N/A,N/A,Reformist / Centrist,17,0,
RJP,Rastriya Janamukti Party,राष्ट्रिय जनमुक्ति पार्टी,#9400D3,⚑,N/A,N/A,Nationalist / Left,17,0,
NCPSa,Nepal Communist Party (Sainyukta),नेपाल कम्युनिस्ट पार्टी (संयुक्त),#DC143C,⚒️,N/A,N/A,Communism,35,0,
NCPMarx,Nepal Communist Party Marxist (Pushpalal),नेपाल कम्युनिस्ट पार्टी मार्क्सवादी (पुष्पलाल),#8B0000,☭,N/A,N/A,Marxism / Communism,4,0,
NatRepNepal,National Republic Nepal,राष्ट्रिय गणतन्त्र नेपाल,#2F4F4F,🏴,N/A,N/A,Republican / Nationalist,46,0,
RJanaMorcha,Rastriya Janamorcha,राष्ट्रिय जनमोर्चा,#A52A2A,✡,N/A,N/A,Left-wing / Marxist,70,0,
NJSSP,Nepali Janashramdan Sanskriti Party,नेपाली जनश्रमदान संस्कृति पार्टी,#696969,🌾,N/A,N/A,Labour / Culture,2,0,
NUP,Nagarik Unmukti Party,नागरिक उन्मुक्ति पार्टी,#20B2AA,🗽,N/A,N/A,Liberation / Civil Rights,2,0,
PFP,People First Party,जनता पहिले पार्टी,#FF69B4,👥,N/A,N/A,Populist,3,0,
NFSP,Nepal Federal Socialist Party,नेपाल संघीय समाजवादी पार्टी,#6B8E23,🌐,N/A,N/A,Socialist / Federalism,N/A,0,
Mukti,Rastriya Mukti Party (Single Symbol),राष्ट्रिय मुक्ति पार्टी (एकल चुनाव चिन्ह),#708090,✊,N/A,N/A,Nationalist,N/A,0,
JP,Janajati Party / Janajati front parties,जनजाति पार्टी,#228B22,🌱,N/A,N/A,Indigenous Rights / Ethnic Federalism,N/A,0,
SwaP,Swatantra Party (various),स्वतन्त्र पार्टी,#C0C0C0,🗳️,N/A,N/A,Independent / Anti-establishment,N/A,0,
IND,Independent,स्वतन्त्र,#6B7280,🗳️,N/A,N/A,Independent,1143,0,
`;

const lines = rawCsv.split('\n').filter(l => l.trim() !== '');

let sql = `-- Replaced 30 Political Parties \nINSERT INTO parties (name_en, name_np, abbreviation, color_hex, symbol_cloudinary_url) VALUES\n`;
let values = [];

for (const line of lines) {
  const parts = line.split(',');
  const abbreviation = parts[0].trim();
  const name_en = parts[1].trim().replace(/'/g, "''");
  const name_np = parts[2].trim().replace(/'/g, "''");
  const color_hex = parts[3].trim();
  const symbol_url = parts[10] ? parts[10].trim() : '';
  
  const urlInsert = symbol_url ? `'${symbol_url}'` : 'NULL';
  values.push(`('${name_en}', '${name_np}', '${abbreviation}', '${color_hex}', ${urlInsert})`);
}

sql += values.join(',\n') + ';\n';
fs.writeFileSync('supabase/parties_seed.sql', sql);
