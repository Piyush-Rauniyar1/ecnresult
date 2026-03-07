const fs = require('fs');

const data = {
  // Koshi
  'Taplejung': 1, 'Panchthar': 1, 'Ilam': 2, 'Jhapa': 5, 'Sankhuwasabha': 1, 
  'Tehrathum': 1, 'Bhojpur': 1, 'Dhankuta': 1, 'Morang': 6, 'Sunsari': 4, 
  'Solukhumbu': 1, 'Khotang': 1, 'Okhaldhunga': 1, 'Udayapur': 2,
  // Madhesh
  'Saptari': 4, 'Siraha': 4, 'Dhanusha': 4, 'Mahottari': 4, 'Sarlahi': 4, 
  'Rautahat': 4, 'Bara': 4, 'Parsa': 4,
  // Bagmati
  'Dolakha': 1, 'Ramechhap': 1, 'Sindhuli': 2, 'Kavrepalanchok': 2, 
  'Lalitpur': 3, 'Bhaktapur': 2, 'Kathmandu': 10, 'Nuwakot': 2, 'Dhading': 2, 
  'Chitwan': 3, 'Makwanpur': 2, 'Rasuwa': 1, 'Sindhupalchok': 2,
  // Gandaki
  'Gorkha': 2, 'Manang': 1, 'Mustang': 1, 'Myagdi': 1, 'Kaski': 3, 
  'Lamjung': 1, 'Tanahun': 2, 'Syangja': 2, 'Nawalpur': 2, 'Parbat': 1, 'Baglung': 2,
  // Lumbini
  'Rupandehi': 5, 'Kapilvastu': 3, 'Palpa': 2, 'Arghakhanchi': 1, 'Gulmi': 2, 
  'Dang': 3, 'Banke': 3, 'Bardiya': 2, 'Pyuthan': 1, 'Rolpa': 1, 
  'Eastern Rukum': 1, 'Parasi': 2,
  // Karnali
  'Dolpa': 1, 'Mugu': 1, 'Humla': 1, 'Jumla': 1, 'Kalikot': 1, 'Dailekh': 2, 
  'Jajarkot': 1, 'Surkhet': 2, 'Salyan': 1, 'Western Rukum': 1,
  // Sudurpashchim
  'Bajura': 1, 'Bajhang': 1, 'Achham': 2, 'Doti': 1, 'Kailali': 5, 
  'Kanchanpur': 3, 'Dadeldhura': 1, 'Baitadi': 1, 'Darchula': 1
};

// District IDs based on exactly how we inserted them in seed.sql:
// Koshi starts at 1
// Madhesh starts at 15
// Bagmati starts at 23
// Gandaki starts at 36
// Lumbini starts at 47
// Karnali starts at 59
// Sudurpashchim starts at 69

const districtOrder = [
  // 1. Koshi Province (14) -> IDs 1-14
  'Bhojpur', 'Dhankuta', 'Ilam', 'Jhapa', 'Khotang', 'Morang', 'Okhaldhunga', 'Panchthar', 'Sankhuwasabha', 'Solukhumbu', 'Sunsari', 'Taplejung', 'Tehrathum', 'Udayapur',
  // 2. Madhesh Province (8) -> IDs 15-22
  'Bara', 'Dhanusha', 'Mahottari', 'Parsa', 'Rautahat', 'Saptari', 'Sarlahi', 'Siraha',
  // 3. Bagmati Province (13) -> IDs 23-35
  'Bhaktapur', 'Chitwan', 'Dhading', 'Dolakha', 'Kathmandu', 'Kavrepalanchok', 'Lalitpur', 'Makwanpur', 'Nuwakot', 'Ramechhap', 'Rasuwa', 'Sindhuli', 'Sindhupalchok',
  // 4. Gandaki Province (11) -> IDs 36-46
  'Baglung', 'Gorkha', 'Kaski', 'Lamjung', 'Manang', 'Mustang', 'Myagdi', 'Nawalpur', 'Parbat', 'Syangja', 'Tanahun',
  // 5. Lumbini Province (12) -> IDs 47-58
  'Arghakhanchi', 'Banke', 'Bardiya', 'Dang', 'Eastern Rukum', 'Gulmi', 'Kapilvastu', 'Parasi', 'Palpa', 'Pyuthan', 'Rolpa', 'Rupandehi',
  // 6. Karnali Province (10) -> IDs 59-68
  'Dailekh', 'Dolpa', 'Humla', 'Jajarkot', 'Jumla', 'Kalikot', 'Mugu', 'Salyan', 'Surkhet', 'Western Rukum',
  // 7. Sudurpashchim Province (9) -> IDs 69-77
  'Achham', 'Baitadi', 'Bajhang', 'Bajura', 'Dadeldhura', 'Darchula', 'Doti', 'Kailali', 'Kanchanpur'
];

let sql = `-- All 165 Constituencies\nINSERT INTO constituencies (district_id, number, name_en, name_np) VALUES\n`;
let values = [];

for (let i = 0; i < districtOrder.length; i++) {
  const districtName_en = districtOrder[i];
  const districtId = i + 1; // 1-indexed based on SQL inserts
  const count = data[districtName_en];
  
  if (!count) {
    console.error(`Missing count for ${districtName_en}`);
    continue;
  }
  
  for (let num = 1; num <= count; num++) {
    // English mapping
    const name_en = `${districtName_en}-${num}`;
    // Fast Nepali numeral map for 1-10
    const npNums = ['०','१','२','३','४','५','६','७','८','९','१०']; 
    // It requires the exact district nepali name, but since we are generating seed, we can just omit name_np for now to populate the dropdowns!
    values.push(`(${districtId}, ${num}, '${name_en}', NULL)`);
  }
}

sql += values.join(',\n') + ';\n';
fs.writeFileSync('supabase/constituencies_seed.sql', sql);
console.log('Successfully generated supabase/constituencies_seed.sql with 165 entries.');
