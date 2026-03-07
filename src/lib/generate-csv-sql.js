/*
 * CSV columns (with header row):
 * province, province_no, district, constituency_id, constituency_name, party, candidate_name, is_independent
 * 
 * Run from inside the nepal-election folder:
 *   node src/lib/generate-csv-sql.js
 *
 * Output: supabase/generated_candidates.sql
 */

const fs = require('fs');
const path = require('path');

const csvPath = path.resolve('candidates.csv');
if (!fs.existsSync(csvPath)) {
    console.error("ERROR: candidates.csv not found in the nepal-election folder!");
    process.exit(1);
}

const rawCsv = fs.readFileSync(csvPath, 'utf8');
const lines = rawCsv.split('\n').filter(l => l.trim() !== '');

// Skip header row
const dataLines = lines.slice(1);

// Collect all unique party abbreviations (some are full words like 'Janamat', 'PSP-N')
const seenParties = new Set();

let insertValues = [];
let counter = 1;

for (const line of dataLines) {
    // Trim Windows-style \r
    const parts = line.replace(/\r/g, '').split(',');
    if (parts.length < 8) continue;

    const district = parts[2].trim().replace(/'/g, "''");
    const constName = parts[4].trim(); // e.g. "Taplejung-1", "Rukum East-1"
    const party = parts[5].trim().replace(/'/g, "''");
    const candidateName = parts[6].trim().replace(/'/g, "''");
    const isIndependent = parts[7].trim().toUpperCase() === 'TRUE' ? 'true' : 'false';

    // Parse constituency number from the name (last segment after "-")
    const hyphenIdx = constName.lastIndexOf('-');
    const constNum = hyphenIdx >= 0 ? parseInt(constName.substring(hyphenIdx + 1)) : 1;

    // Independent candidates: set party_id to NULL
    const partyClause = isIndependent === 'true'
        ? 'NULL'
        : `(SELECT id FROM parties WHERE abbreviation = '${party}' LIMIT 1)`;

    seenParties.add(party);

    const val = `  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = '${district}' LIMIT 1) AND number = ${constNum} LIMIT 1),
    ${partyClause},
    ${isIndependent},
    '${candidateName}',
    NULL,
    'C${counter}'
  )`;
    insertValues.push(val);
    counter++;
}

let sql = `-- Auto-generated from candidates.csv — ${counter - 1} candidates\n`;
sql += `-- Run this in your Supabase SQL Editor\n\n`;
sql += `-- 1. Clear old candidate data\n`;
sql += `TRUNCATE TABLE candidates, results RESTART IDENTITY CASCADE;\n\n`;

sql += `-- 2. Ensure any extra parties from the CSV exist\n`;
sql += `-- (Add parties not already in your parties table)\n`;
// Collect non-standard party abbreviations for notice
const standardParties = new Set(['NC', 'UML', 'RSP', 'NCP', 'RPP', 'MC', 'PSP-N', 'Janamat', 'JP', 'SSP', 'US', 'UNP', 'NMKP', 'AJP', 'MNO', 'IND']);
const extraParties = [...seenParties].filter(p => !standardParties.has(p) && p !== 'IND');
if (extraParties.length > 0) {
    sql += `-- WARNING: These party abbreviations were found in the CSV. Ensure they exist in your parties table:\n`;
    extraParties.forEach(p => {
        sql += `-- '${p}'\n`;
    });
    sql += `\n`;
}

sql += `-- 3. Insert all ${counter - 1} candidates\n`;
sql += `INSERT INTO candidates (constituency_id, party_id, is_independent, name_en, name_np, ecn_candidate_id) VALUES\n`;
sql += insertValues.join(',\n');
sql += `;\n\n`;

sql += `-- 4. Create empty vote result entries for all candidates\n`;
sql += `INSERT INTO results (candidate_id, constituency_id, votes, is_winner)\n`;
sql += `SELECT id, constituency_id, 0, false FROM candidates;\n`;

const outPath = path.resolve('supabase/generated_candidates.sql');
fs.writeFileSync(outPath, sql);
console.log(`\n✅ Successfully parsed ${counter - 1} candidates!`);
console.log(`📄 Output saved to: supabase/generated_candidates.sql`);
console.log(`\nNext step: Copy the SQL from that file and run it in your Supabase SQL Editor.\n`);
