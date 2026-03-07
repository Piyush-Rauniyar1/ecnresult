-- Auto-generated from candidates.csv — 879 candidates
-- Run this in your Supabase SQL Editor

-- 1. Clear old candidate data
TRUNCATE TABLE candidates, results RESTART IDENTITY CASCADE;

-- 2. Ensure any extra parties from the CSV exist
-- (Add parties not already in your parties table)
-- 3. Insert all 879 candidates
INSERT INTO candidates (constituency_id, party_id, is_independent, name_en, name_np, ecn_candidate_id) VALUES
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Taplejung' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Birendra Shrestha',
    NULL,
    'C1'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Taplejung' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Gajendra Tumyahang',
    NULL,
    'C2'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Taplejung' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Kshitij Thebe',
    NULL,
    'C3'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Taplejung' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Khel Prasad Budhathoki',
    NULL,
    'C4'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Taplejung' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Indra Prasad Thapa',
    NULL,
    'C5'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Panchthar' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Mahendra Bikram Thamsuhang',
    NULL,
    'C6'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Panchthar' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Narendra Kerung',
    NULL,
    'C7'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Panchthar' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Aiendra Sundar Nembang',
    NULL,
    'C8'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Panchthar' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Harka Bahadur Nembang',
    NULL,
    'C9'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Panchthar' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Tej Kerumbang',
    NULL,
    'C10'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Ilam' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Bimal Gadaal',
    NULL,
    'C11'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Ilam' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Niskal Rai',
    NULL,
    'C12'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Ilam' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Kajiman Kagate',
    NULL,
    'C13'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Ilam' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Rana Bahadur Rai',
    NULL,
    'C14'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Ilam' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Jwala Nepal Dahal',
    NULL,
    'C15'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Ilam' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Gokul Bahadur Rai',
    NULL,
    'C16'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Ilam' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Bhesraj Acharaya',
    NULL,
    'C17'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Ilam' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Suhang Nembang',
    NULL,
    'C18'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Ilam' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Om Bahadur Gurung',
    NULL,
    'C19'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Ilam' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Ganesh Prasad Dulal',
    NULL,
    'C20'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Jhapa' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Nisha Dangi',
    NULL,
    'C21'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Jhapa' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Keshab Raj Pandey',
    NULL,
    'C22'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Jhapa' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Ram Chandra Upreti',
    NULL,
    'C23'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Jhapa' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Ashesh Ghimire',
    NULL,
    'C24'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Jhapa' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Hemraj Karki',
    NULL,
    'C25'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Jhapa' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Indira Rana Magar',
    NULL,
    'C26'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Jhapa' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Sarita Prasai',
    NULL,
    'C27'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Jhapa' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Devraj Ghimire',
    NULL,
    'C28'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Jhapa' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Dharmashila Chapagain',
    NULL,
    'C29'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Jhapa' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Swagat Nepal',
    NULL,
    'C30'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Jhapa' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'JP' LIMIT 1),
    false,
    'Ramesh Kumar Rajbanshi',
    NULL,
    'C31'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Jhapa' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Prakash Pathak',
    NULL,
    'C32'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Jhapa' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Rajendra Ghimire',
    NULL,
    'C33'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Jhapa' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Harilal Rajbanshi',
    NULL,
    'C34'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Jhapa' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Dilli Ghimire',
    NULL,
    'C35'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Jhapa' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Rajendra Prasad Lingden',
    NULL,
    'C36'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Jhapa' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'JP' LIMIT 1),
    false,
    'Bharat Lal Rajbanshi',
    NULL,
    'C37'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Jhapa' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Shambhu Suskera',
    NULL,
    'C38'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Jhapa' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Deuman Thebe',
    NULL,
    'C39'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Jhapa' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'L.P. Sawa Limbu',
    NULL,
    'C40'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Jhapa' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Purushottam Chudel',
    NULL,
    'C41'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Jhapa' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Bhakti Prasad Sitaula',
    NULL,
    'C42'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Jhapa' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'JP' LIMIT 1),
    false,
    'Luthro Murmu',
    NULL,
    'C43'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Jhapa' LIMIT 1) AND number = 5 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Balendra Shah',
    NULL,
    'C44'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Jhapa' LIMIT 1) AND number = 5 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Mandhara Chimariya',
    NULL,
    'C45'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Jhapa' LIMIT 1) AND number = 5 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'K.P. Sharma Oli',
    NULL,
    'C46'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Jhapa' LIMIT 1) AND number = 5 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Ranjit Tamang',
    NULL,
    'C47'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Jhapa' LIMIT 1) AND number = 5 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Laxmi Prasad Sangraula',
    NULL,
    'C48'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Jhapa' LIMIT 1) AND number = 5 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'JP' LIMIT 1),
    false,
    'Amrit Mahato',
    NULL,
    'C49'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sankhuwasabha' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Mingma Sherpa',
    NULL,
    'C50'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sankhuwasabha' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Dipan Shrestha',
    NULL,
    'C51'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sankhuwasabha' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Arjun Karki',
    NULL,
    'C52'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sankhuwasabha' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Sarita Khadka Thapa',
    NULL,
    'C53'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sankhuwasabha' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Haridev Shrestha',
    NULL,
    'C54'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Tehrathum' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Surendra Karki',
    NULL,
    'C55'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Tehrathum' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Santosh Subba',
    NULL,
    'C56'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Tehrathum' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Bhanubhakta Dhakal',
    NULL,
    'C57'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Tehrathum' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Ranadhoj Kandangwa',
    NULL,
    'C58'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Tehrathum' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Hom Bhakta Kerumbang',
    NULL,
    'C59'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bhojpur' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Ramesh Prasad Ojha',
    NULL,
    'C60'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bhojpur' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Balkrishna Thapa',
    NULL,
    'C61'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bhojpur' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Sherdhan Rai',
    NULL,
    'C62'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bhojpur' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Ajambar Kangmang Rai',
    NULL,
    'C63'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bhojpur' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Janak Nepal',
    NULL,
    'C64'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bhojpur' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'SSP' LIMIT 1),
    false,
    'Dhurba Rai',
    NULL,
    'C65'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dhankuta' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Dinesh Bhandari',
    NULL,
    'C66'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dhankuta' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Dinesh Rai',
    NULL,
    'C67'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dhankuta' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Rajendra Kumar Rai',
    NULL,
    'C68'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dhankuta' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Dharma Prasad Paudel',
    NULL,
    'C69'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dhankuta' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Vibhatsu Thapa',
    NULL,
    'C70'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Morang' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Yagyamani Neupane',
    NULL,
    'C71'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Morang' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Khadga Bahadur Phago',
    NULL,
    'C72'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Morang' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Ghanashyam Khatiwada',
    NULL,
    'C73'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Morang' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Kulprasad Samba',
    NULL,
    'C74'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Morang' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Purna Bahadur Waiba',
    NULL,
    'C75'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Morang' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Krishna Kumar Karki',
    NULL,
    'C76'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Morang' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Minendra Rijal',
    NULL,
    'C77'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Morang' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Dilip Kumar Bagediya',
    NULL,
    'C78'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Morang' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Chandrabir Rai',
    NULL,
    'C79'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Morang' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Bansaraj Rajbanshi',
    NULL,
    'C80'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Morang' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'JP' LIMIT 1),
    false,
    'Ghanashyam Chaudhary',
    NULL,
    'C81'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Morang' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Ganesh Karki',
    NULL,
    'C82'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Morang' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Sunil Kumar Sharma',
    NULL,
    'C83'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Morang' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Iran Kumar Rai',
    NULL,
    'C84'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Morang' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Devman Sambahamphe',
    NULL,
    'C85'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Morang' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Prem Subedi',
    NULL,
    'C86'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Morang' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Santosh Rajbanshi',
    NULL,
    'C87'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Morang' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Gururaj Ghimire',
    NULL,
    'C88'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Morang' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Jivan Ghimire',
    NULL,
    'C89'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Morang' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Amanlal Modi',
    NULL,
    'C90'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Morang' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Madhav Acharya',
    NULL,
    'C91'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Morang' LIMIT 1) AND number = 5 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Aasha Jha',
    NULL,
    'C92'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Morang' LIMIT 1) AND number = 5 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Phool Kumar Lalbani',
    NULL,
    'C93'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Morang' LIMIT 1) AND number = 5 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Manoj Agrawal',
    NULL,
    'C94'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Morang' LIMIT 1) AND number = 5 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Shiva Kumar Mandal',
    NULL,
    'C95'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Morang' LIMIT 1) AND number = 5 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Kumud Raya',
    NULL,
    'C96'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Morang' LIMIT 1) AND number = 6 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Rubina Acharya',
    NULL,
    'C97'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Morang' LIMIT 1) AND number = 6 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Shekhar Koirala',
    NULL,
    'C98'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Morang' LIMIT 1) AND number = 6 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Binod Dhakal',
    NULL,
    'C99'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Morang' LIMIT 1) AND number = 6 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Opendra Kumar Raya',
    NULL,
    'C100'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Morang' LIMIT 1) AND number = 6 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Sabin Niraula',
    NULL,
    'C101'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sunsari' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Sarin Tamang (Goma)',
    NULL,
    'C102'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sunsari' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Sujendra Tamang',
    NULL,
    'C103'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sunsari' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Tikaram Limbu',
    NULL,
    'C104'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sunsari' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Surya Bahadur Bhattarai',
    NULL,
    'C105'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sunsari' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Uddhav Shrestha',
    NULL,
    'C106'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sunsari' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'SSP' LIMIT 1),
    false,
    'Harka Sampang',
    NULL,
    'C107'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sunsari' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Rajiv Koirala',
    NULL,
    'C108'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sunsari' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Rewati Raman Bhandari',
    NULL,
    'C109'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sunsari' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Ram Kumari Chaudhahry',
    NULL,
    'C110'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sunsari' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Dinesh Kumar Basnet',
    NULL,
    'C111'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sunsari' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'JP' LIMIT 1),
    false,
    'Mahabir Mahato',
    NULL,
    'C112'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sunsari' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Ashok Chaudhary',
    NULL,
    'C113'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sunsari' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Bijay Kumar Gachhadar',
    NULL,
    'C114'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sunsari' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Bhagwati Chaudhary',
    NULL,
    'C115'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sunsari' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Durgesh Chaudhary',
    NULL,
    'C116'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sunsari' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Ghanashyam Gurung',
    NULL,
    'C117'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sunsari' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'JP' LIMIT 1),
    false,
    'Ram Narayam Tharu',
    NULL,
    'C118'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sunsari' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Dipak Kumar Sah',
    NULL,
    'C119'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sunsari' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Gyanendra Bahadur Karki',
    NULL,
    'C120'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sunsari' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Jagadish Kushiyat',
    NULL,
    'C121'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sunsari' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Mohammad Mehfooz Ansari',
    NULL,
    'C122'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sunsari' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Prem Prasad Bhattarai',
    NULL,
    'C123'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Solukhumbu' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Rishidhan Rai',
    NULL,
    'C124'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Solukhumbu' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Prakash Singh Karki',
    NULL,
    'C125'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Solukhumbu' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Kalpana Rai',
    NULL,
    'C126'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Solukhumbu' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Asim Rai',
    NULL,
    'C127'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Solukhumbu' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Rajendra Basnet',
    NULL,
    'C128'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Khotang' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Rudhra Giri',
    NULL,
    'C129'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Khotang' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Birbal Kaji Rai',
    NULL,
    'C130'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Khotang' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Devbikram Rai',
    NULL,
    'C131'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Khotang' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Hari Roka',
    NULL,
    'C132'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Khotang' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Dipak Tamang',
    NULL,
    'C133'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Okhaldhunga' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Bisworaj Pokharel',
    NULL,
    'C134'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Okhaldhunga' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Kumar Luitel',
    NULL,
    'C135'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Okhaldhunga' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Asmita Thapa',
    NULL,
    'C136'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Okhaldhunga' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Ambir Babu Gurung',
    NULL,
    'C137'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Okhaldhunga' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Dik Prasad Bastola',
    NULL,
    'C138'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Udayapur' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Parash Gelal',
    NULL,
    'C139'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Udayapur' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Bidur Basnet',
    NULL,
    'C140'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Udayapur' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Durga Kumar Thapa',
    NULL,
    'C141'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Udayapur' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Baldev Chaudhary',
    NULL,
    'C142'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Udayapur' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Subhas Chandra Khadka',
    NULL,
    'C143'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Udayapur' LIMIT 1) AND number = 1 LIMIT 1),
    NULL,
    true,
    'Devraj Roka',
    NULL,
    'C144'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Udayapur' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Surya Bahadur Tamang',
    NULL,
    'C145'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Udayapur' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Ram Kumar Rai',
    NULL,
    'C146'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Udayapur' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Ambar Rayamajhi',
    NULL,
    'C147'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Udayapur' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Suresh Kumar Rai',
    NULL,
    'C148'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Udayapur' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Bishnu Bahadur Khadka',
    NULL,
    'C149'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Udayapur' LIMIT 1) AND number = 2 LIMIT 1),
    NULL,
    true,
    'Major Rai',
    NULL,
    'C150'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Saptari' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Pushpa Chaudhary',
    NULL,
    'C151'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Saptari' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Ramdev Sah',
    NULL,
    'C152'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Saptari' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Suman Pyakurel',
    NULL,
    'C153'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Saptari' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Rabindra Chaudhary',
    NULL,
    'C154'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Saptari' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Sanyajit Kumar Jha',
    NULL,
    'C155'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Saptari' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'PSP-N' LIMIT 1),
    false,
    'Shyam Sardar',
    NULL,
    'C156'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Saptari' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'Janamat' LIMIT 1),
    false,
    'Jay Kant Ruat',
    NULL,
    'C157'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Saptari' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Ramji Yadav',
    NULL,
    'C158'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Saptari' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Ram Kumar Yadav',
    NULL,
    'C159'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Saptari' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Ziya Ulhaq Ansari',
    NULL,
    'C160'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Saptari' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Suryanath Prasad Yadav',
    NULL,
    'C161'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Saptari' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Ajay Kumar Das',
    NULL,
    'C162'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Saptari' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'PSP-N' LIMIT 1),
    false,
    'Umesh Kumar Yadav',
    NULL,
    'C163'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Saptari' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'Janamat' LIMIT 1),
    false,
    'C.K. Raut',
    NULL,
    'C164'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Saptari' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Umakanta Chaudhary',
    NULL,
    'C165'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Saptari' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Dinesh Kumar Yadav',
    NULL,
    'C166'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Saptari' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Tarakanta Chaudhary',
    NULL,
    'C167'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Saptari' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Arun Kumar Sah',
    NULL,
    'C168'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Saptari' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Umdeshwar Sah',
    NULL,
    'C169'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Saptari' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'PSP-N' LIMIT 1),
    false,
    'Upendra Yadav',
    NULL,
    'C170'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Saptari' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'Janamat' LIMIT 1),
    false,
    'Surendra Sharma',
    NULL,
    'C171'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Saptari' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Sitaram Shah',
    NULL,
    'C172'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Saptari' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Tejulal Chaudhary',
    NULL,
    'C173'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Saptari' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Ganga Prasad Chaudhari',
    NULL,
    'C174'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Saptari' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Rubi Kumari Karna',
    NULL,
    'C175'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Saptari' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Rup Kumar Neupane',
    NULL,
    'C176'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Saptari' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'PSP-N' LIMIT 1),
    false,
    'Bobby Singh',
    NULL,
    'C177'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Saptari' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'Janamat' LIMIT 1),
    false,
    'Jitendra Kumar Sah',
    NULL,
    'C178'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Siraha' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Bablu Gupta',
    NULL,
    'C179'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Siraha' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Ramsundar Chaudhary',
    NULL,
    'C180'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Siraha' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Kedarnath Yadav',
    NULL,
    'C181'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Siraha' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Ramchandra Yadav',
    NULL,
    'C182'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Siraha' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Basudev Sah',
    NULL,
    'C183'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Siraha' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'PSP-N' LIMIT 1),
    false,
    'Satyanarayan Yadav',
    NULL,
    'C184'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Siraha' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'Janamat' LIMIT 1),
    false,
    'Ramswaroop Chaudhary',
    NULL,
    'C185'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Siraha' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Shivasankar Yadav',
    NULL,
    'C186'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Siraha' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Ram Chandra Yadav',
    NULL,
    'C187'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Siraha' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Nabin Kumar Yadav',
    NULL,
    'C188'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Siraha' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Mukti Singh',
    NULL,
    'C189'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Siraha' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Shyamkishor Sah Haluwai',
    NULL,
    'C190'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Siraha' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'PSP-N' LIMIT 1),
    false,
    'Sanjiv Yadav',
    NULL,
    'C191'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Siraha' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'Janamat' LIMIT 1),
    false,
    'Binod Kumar Yadav',
    NULL,
    'C192'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Siraha' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Dr Sambhu Yadav',
    NULL,
    'C193'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Siraha' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Subhash Chandra Yadav',
    NULL,
    'C194'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Siraha' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Lilanath Shrestha',
    NULL,
    'C195'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Siraha' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Bishwonath Sah',
    NULL,
    'C196'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Siraha' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Devdayal Singh',
    NULL,
    'C197'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Siraha' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'PSP-N' LIMIT 1),
    false,
    'Asheshwar Yadav',
    NULL,
    'C198'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Siraha' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'Janamat' LIMIT 1),
    false,
    'Rohit Mahato',
    NULL,
    'C199'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Siraha' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Tapeshwor Yadav',
    NULL,
    'C200'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Siraha' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Chandrakala Kumari Yadav',
    NULL,
    'C201'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Siraha' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Biltu Sah',
    NULL,
    'C202'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Siraha' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Ajay Shankar Nayak',
    NULL,
    'C203'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Siraha' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Shubendra Kumar Sah',
    NULL,
    'C204'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Siraha' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'PSP-N' LIMIT 1),
    false,
    'Rajkishor Yadav',
    NULL,
    'C205'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Siraha' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'Janamat' LIMIT 1),
    false,
    'Birendra Prasad Mahato',
    NULL,
    'C206'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dhanusha' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Kishori Shah',
    NULL,
    'C207'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dhanusha' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Ram Paltan Sah',
    NULL,
    'C208'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dhanusha' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Ramchandra Mandal',
    NULL,
    'C209'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dhanusha' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Matrika Prasad Yadav',
    NULL,
    'C210'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dhanusha' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Manoj Malla Thakuri',
    NULL,
    'C211'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dhanusha' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'PSP-N' LIMIT 1),
    false,
    'Deepak Karki',
    NULL,
    'C212'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dhanusha' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'Janamat' LIMIT 1),
    false,
    'Brahmadev Mahato',
    NULL,
    'C213'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dhanusha' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Rambinod Shah',
    NULL,
    'C214'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dhanusha' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Dinesh Parshaila',
    NULL,
    'C215'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dhanusha' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Umashankar Argariya',
    NULL,
    'C216'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dhanusha' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Ram Chandra Jha',
    NULL,
    'C217'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dhanusha' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Viheshwar Mandal',
    NULL,
    'C218'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dhanusha' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'PSP-N' LIMIT 1),
    false,
    'Pashupati Yadav',
    NULL,
    'C219'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dhanusha' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'Janamat' LIMIT 1),
    false,
    'Surendra Prasad Yadav',
    NULL,
    'C220'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dhanusha' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Manish Jha',
    NULL,
    'C221'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dhanusha' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Bimalendra Nidhi',
    NULL,
    'C222'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dhanusha' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Julie Kumari Mahato',
    NULL,
    'C223'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dhanusha' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Ram Lalit Mandal',
    NULL,
    'C224'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dhanusha' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Huseni Kabadi',
    NULL,
    'C225'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dhanusha' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'PSP-N' LIMIT 1),
    false,
    'Parmeshwar Sah Sudi',
    NULL,
    'C226'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dhanusha' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'Janamat' LIMIT 1),
    false,
    'Gopal Sah',
    NULL,
    'C227'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dhanusha' LIMIT 1) AND number = 3 LIMIT 1),
    NULL,
    true,
    'Diwakar Sah',
    NULL,
    'C228'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dhanusha' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Raj Kishor Mahato',
    NULL,
    'C229'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dhanusha' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Mahendra Yadav',
    NULL,
    'C230'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dhanusha' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Raghubir Mahaseth',
    NULL,
    'C231'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dhanusha' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Sanjay Kumar Mahato',
    NULL,
    'C232'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dhanusha' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Rambabu Sah',
    NULL,
    'C233'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dhanusha' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'PSP-N' LIMIT 1),
    false,
    'Krishna Chandra Sah',
    NULL,
    'C234'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dhanusha' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'Janamat' LIMIT 1),
    false,
    'Indrajit Kumar Yadav',
    NULL,
    'C235'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Mahottari' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Pramod Mahato',
    NULL,
    'C236'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Mahottari' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Mukesh Raj Kafle',
    NULL,
    'C237'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Mahottari' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Laxmi Mahato Koiri',
    NULL,
    'C238'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Mahottari' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Girirajmani Pokharel',
    NULL,
    'C239'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Mahottari' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Yanikhar Gautam',
    NULL,
    'C240'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Mahottari' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'PSP-N' LIMIT 1),
    false,
    'Yognarayan Mahato',
    NULL,
    'C241'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Mahottari' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'Janamat' LIMIT 1),
    false,
    'Birendra Mahato',
    NULL,
    'C242'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Mahottari' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Dipak Shah',
    NULL,
    'C243'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Mahottari' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Kiran Yadav',
    NULL,
    'C244'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Mahottari' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Ram Parikshyan Yadav',
    NULL,
    'C245'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Mahottari' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Laxman Yadav',
    NULL,
    'C246'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Mahottari' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Ramlakhan Sah',
    NULL,
    'C247'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Mahottari' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'PSP-N' LIMIT 1),
    false,
    'Sharat Singh Bhandari',
    NULL,
    'C248'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Mahottari' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'Janamat' LIMIT 1),
    false,
    'Jiya Kumar Pandey',
    NULL,
    'C249'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Mahottari' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Ujjwal Jha',
    NULL,
    'C250'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Mahottari' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Bajarang Nepali',
    NULL,
    'C251'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Mahottari' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Manoj Kumar Singh',
    NULL,
    'C252'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Mahottari' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Rajkishor Sah Sudi',
    NULL,
    'C253'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Mahottari' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Rajeshwar Ray Yadav',
    NULL,
    'C254'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Mahottari' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'PSP-N' LIMIT 1),
    false,
    'Minakshi Jha',
    NULL,
    'C255'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Mahottari' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'Janamat' LIMIT 1),
    false,
    'Arbin Thakur',
    NULL,
    'C256'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Mahottari' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Gauri Kumari Yadav',
    NULL,
    'C257'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Mahottari' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Mahendra Kumar Raya',
    NULL,
    'C258'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Mahottari' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Nilam Adhikari',
    NULL,
    'C259'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Mahottari' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Bharat Prasad Sah',
    NULL,
    'C260'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Mahottari' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Sunil Kumar Singh',
    NULL,
    'C261'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Mahottari' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'PSP-N' LIMIT 1),
    false,
    'Surendra Yadav',
    NULL,
    'C262'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Mahottari' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'Janamat' LIMIT 1),
    false,
    'Manoj Kumar Sah',
    NULL,
    'C263'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sarlahi' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Nimita Karki',
    NULL,
    'C264'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sarlahi' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Sambhulal Shrestha',
    NULL,
    'C265'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sarlahi' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Manoj Devkota',
    NULL,
    'C266'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sarlahi' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Pramod Sah',
    NULL,
    'C267'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sarlahi' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Suryanarayan Yadav',
    NULL,
    'C268'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sarlahi' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'PSP-N' LIMIT 1),
    false,
    'Ram Prakash Chaudhary',
    NULL,
    'C269'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sarlahi' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'Janamat' LIMIT 1),
    false,
    'Shreejanya Mahato',
    NULL,
    'C270'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sarlahi' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Rabin Mahato',
    NULL,
    'C271'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sarlahi' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Saroj Kumar Yadav',
    NULL,
    'C272'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sarlahi' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Dharmendra Ray',
    NULL,
    'C273'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sarlahi' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Mahindra Ray Yadav',
    NULL,
    'C274'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sarlahi' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Rajkishor Ray Yadav',
    NULL,
    'C275'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sarlahi' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'PSP-N' LIMIT 1),
    false,
    'Bharat Chaudhary',
    NULL,
    'C276'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sarlahi' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'Janamat' LIMIT 1),
    false,
    'Bipin Kapad',
    NULL,
    'C277'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sarlahi' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Narendra Shah Kalwar',
    NULL,
    'C278'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sarlahi' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Binod Khanal',
    NULL,
    'C279'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sarlahi' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Hari Prasad Upreti',
    NULL,
    'C280'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sarlahi' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Narayan Kaji Shrestha',
    NULL,
    'C281'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sarlahi' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Dholaram Barakoti',
    NULL,
    'C282'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sarlahi' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'PSP-N' LIMIT 1),
    false,
    'J.P. Yadav',
    NULL,
    'C283'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sarlahi' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'Janamat' LIMIT 1),
    false,
    'Sunil Prasad Gupta',
    NULL,
    'C284'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sarlahi' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Amresh Kumar Singh',
    NULL,
    'C285'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sarlahi' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Gagan Thapa',
    NULL,
    'C286'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sarlahi' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Rabi Singh Kushwaha',
    NULL,
    'C287'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sarlahi' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Ragnish Raya Yadav',
    NULL,
    'C288'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sarlahi' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Pradeep Jha',
    NULL,
    'C289'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sarlahi' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'PSP-N' LIMIT 1),
    false,
    'Rameshwar Ray Yadav',
    NULL,
    'C290'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sarlahi' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'Janamat' LIMIT 1),
    false,
    'Rakesh Kumar Mishra',
    NULL,
    'C291'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rautahat' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Rajesh Chaudhary',
    NULL,
    'C292'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rautahat' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Anil Kumar Jha',
    NULL,
    'C293'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rautahat' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Ajay Kumar Gupta',
    NULL,
    'C294'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rautahat' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Madhav Kumar Nepal',
    NULL,
    'C295'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rautahat' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Shreeram Sah',
    NULL,
    'C296'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rautahat' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'PSP-N' LIMIT 1),
    false,
    'Yogendra Rae Yadav',
    NULL,
    'C297'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rautahat' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'Janamat' LIMIT 1),
    false,
    'Devendra Mishra',
    NULL,
    'C298'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rautahat' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Sheikh Sagir',
    NULL,
    'C299'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rautahat' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Firdosh Alam',
    NULL,
    'C300'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rautahat' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Shailendra Sah',
    NULL,
    'C301'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rautahat' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Kiran Kumar Sah',
    NULL,
    'C302'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rautahat' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Ravindra Prasad Sah',
    NULL,
    'C303'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rautahat' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'PSP-N' LIMIT 1),
    false,
    'Ram Aashish Ray Yadav',
    NULL,
    'C304'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rautahat' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'Janamat' LIMIT 1),
    false,
    'Sonu Kushwaha',
    NULL,
    'C305'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rautahat' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Dhiraj Patel',
    NULL,
    'C306'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rautahat' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Ram Kripal Yadav',
    NULL,
    'C307'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rautahat' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Kundan Prasad Kushwaha',
    NULL,
    'C308'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rautahat' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Punam Devi',
    NULL,
    'C309'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rautahat' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Sikindra Prasad Sah',
    NULL,
    'C310'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rautahat' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'Janamat' LIMIT 1),
    false,
    'Mohammad Praved Alam',
    NULL,
    'C311'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rautahat' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Ganesh Paudel',
    NULL,
    'C312'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rautahat' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Dev Prasad Timilsena',
    NULL,
    'C313'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rautahat' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Ramji Sah',
    NULL,
    'C314'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rautahat' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Ram Kumar Bhattarai',
    NULL,
    'C315'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rautahat' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Bahadur Yadav',
    NULL,
    'C316'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rautahat' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'Janamat' LIMIT 1),
    false,
    'Ram Kalyan Raut',
    NULL,
    'C317'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rautahat' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'AJP' LIMIT 1),
    false,
    'Rishi Dhamala',
    NULL,
    'C318'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bara' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Ganesh Dhimal',
    NULL,
    'C319'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bara' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Shambhu Budhathoki',
    NULL,
    'C320'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bara' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Achyut Prasad Mainali',
    NULL,
    'C321'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bara' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Santosh Dhungel',
    NULL,
    'C322'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bara' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Laxmi Sah Kalwar',
    NULL,
    'C323'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bara' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'Janamat' LIMIT 1),
    false,
    'Kamullah Ansari',
    NULL,
    'C324'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bara' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Chandan Singh',
    NULL,
    'C325'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bara' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Bhaiyaram Yadav',
    NULL,
    'C326'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bara' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Balbir Prasad Chaudhary',
    NULL,
    'C327'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bara' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Ramesh Prasad Yadav',
    NULL,
    'C328'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bara' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Lal Bahadur Prasad Teli',
    NULL,
    'C329'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bara' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'Janamat' LIMIT 1),
    false,
    'Rajesh Sah',
    NULL,
    'C330'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bara' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Arbinda Shah',
    NULL,
    'C331'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bara' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Farmullah Mansoor',
    NULL,
    'C332'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bara' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Jwala Kumari Sah',
    NULL,
    'C333'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bara' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Bharat Prasad Sah',
    NULL,
    'C334'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bara' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Rajendra Prasad Jaiswal',
    NULL,
    'C335'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bara' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'PSP-N' LIMIT 1),
    false,
    'Rambabu Kumar Yadav',
    NULL,
    'C336'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bara' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'Janamat' LIMIT 1),
    false,
    'Pramod Gupta',
    NULL,
    'C337'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bara' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Rahabar Ansari',
    NULL,
    'C338'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bara' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Shyambabu Gupta',
    NULL,
    'C339'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bara' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Krishna Kumar Shrestha',
    NULL,
    'C340'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bara' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Ajay Kushwaha',
    NULL,
    'C341'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bara' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Dileep Kumar Sharma Nepal',
    NULL,
    'C342'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bara' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'Janamat' LIMIT 1),
    false,
    'Hasanjaan Miya',
    NULL,
    'C343'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Parsa' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Hari Panta',
    NULL,
    'C344'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Parsa' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Anil Kumar Rungata',
    NULL,
    'C345'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Parsa' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Pradeep Yadav',
    NULL,
    'C346'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Parsa' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Ajay Chaurasiya',
    NULL,
    'C347'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Parsa' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Nandakishor Prasad Shreewastav',
    NULL,
    'C348'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Parsa' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'PSP-N' LIMIT 1),
    false,
    'Ramnaresh Yadav',
    NULL,
    'C349'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Parsa' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'Janamat' LIMIT 1),
    false,
    'Omprakash Sarraf',
    NULL,
    'C350'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Parsa' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Sushil Patel',
    NULL,
    'C351'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Parsa' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Ajay Chaurasiya',
    NULL,
    'C352'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Parsa' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Rima Kumari Yadav',
    NULL,
    'C353'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Parsa' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Manoj Chaudhary',
    NULL,
    'C354'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Parsa' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Bina Jaiswal',
    NULL,
    'C355'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Parsa' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'PSP-N' LIMIT 1),
    false,
    'Ashok Temani',
    NULL,
    'C356'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Parsa' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'Janamat' LIMIT 1),
    false,
    'Shyam Kumar Gupta',
    NULL,
    'C357'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Parsa' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Ramakanta Chaurasiya',
    NULL,
    'C358'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Parsa' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Surendra Prasad Chaudhary',
    NULL,
    'C359'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Parsa' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Rupesh Pandey',
    NULL,
    'C360'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Parsa' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Chhotelal Yadav',
    NULL,
    'C361'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Parsa' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Nabin Kumar Singh',
    NULL,
    'C362'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Parsa' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'Janamat' LIMIT 1),
    false,
    'Malti Kumari Kushwaha',
    NULL,
    'C363'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Parsa' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Tek Bahadur Shakya',
    NULL,
    'C364'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Parsa' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Ramesh Rijal',
    NULL,
    'C365'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Parsa' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Zalim Miya Ansari',
    NULL,
    'C366'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Parsa' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Jay Prakash Tharu',
    NULL,
    'C367'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Parsa' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Shanta Kumar Joshi',
    NULL,
    'C368'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Parsa' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'PSP-N' LIMIT 1),
    false,
    'Kripa Sindhu Chaudhary',
    NULL,
    'C369'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Parsa' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'Janamat' LIMIT 1),
    false,
    'Sima Gupta',
    NULL,
    'C370'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dolakha' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Jagdish Kharel',
    NULL,
    'C371'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dolakha' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Ajaya Babu Shiwakoti',
    NULL,
    'C372'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dolakha' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Parbat Gurung',
    NULL,
    'C373'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dolakha' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Bishal Khadka',
    NULL,
    'C374'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dolakha' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Prabin Kumar Thokar Tamang',
    NULL,
    'C375'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Ramechhap' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Krishnahari Budhathoki',
    NULL,
    'C376'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Ramechhap' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Ramchandra Khadka',
    NULL,
    'C377'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Ramechhap' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Madhav Prasad Dhungel',
    NULL,
    'C378'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Ramechhap' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Shyam Kumar Shrestha',
    NULL,
    'C379'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Ramechhap' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Gore Bahadur Tamang',
    NULL,
    'C380'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Ramechhap' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UNP' LIMIT 1),
    false,
    'Deep Bahadur Yonjan',
    NULL,
    'C381'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sindhuli' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Dhanendra Karki',
    NULL,
    'C382'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sindhuli' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Ujjwal Baral',
    NULL,
    'C383'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sindhuli' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Pradeep K.C.',
    NULL,
    'C384'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sindhuli' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Dekendra Subedi',
    NULL,
    'C385'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sindhuli' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Ramnarayan Adhikari Danuwar',
    NULL,
    'C386'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sindhuli' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UNP' LIMIT 1),
    false,
    'Motilal Tamang',
    NULL,
    'C387'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sindhuli' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Asish Gajurel',
    NULL,
    'C388'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sindhuli' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Sushila Thing',
    NULL,
    'C389'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sindhuli' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Manoj Jung Thapa',
    NULL,
    'C390'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sindhuli' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Lekhnath Dahal',
    NULL,
    'C391'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sindhuli' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Mukunda Prasad Gajurel',
    NULL,
    'C392'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sindhuli' LIMIT 1) AND number = 2 LIMIT 1),
    NULL,
    true,
    'Maheshwar Dahal',
    NULL,
    'C393'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rasuwa' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Basanta Bhatta',
    NULL,
    'C394'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rasuwa' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Mohan Acharya',
    NULL,
    'C395'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rasuwa' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Prem Bahadur Tamang',
    NULL,
    'C396'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rasuwa' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Madhav Lamichhane',
    NULL,
    'C397'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rasuwa' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Hariprasad Ghimire',
    NULL,
    'C398'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rasuwa' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UNP' LIMIT 1),
    false,
    'Man Bahadur Tamang',
    NULL,
    'C399'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dhading' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Ashika Tamang',
    NULL,
    'C400'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dhading' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Krishna Rijal',
    NULL,
    'C401'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dhading' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Bhumi Tripathi',
    NULL,
    'C402'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dhading' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Rajendra Prasad Pandey',
    NULL,
    'C403'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dhading' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Geeta Prasad Acharya',
    NULL,
    'C404'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dhading' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UNP' LIMIT 1),
    false,
    'Shyamraja Pandey',
    NULL,
    'C405'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dhading' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Bodh Narayan Shrestha',
    NULL,
    'C406'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dhading' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Ramesh Prasad Dhamala',
    NULL,
    'C407'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dhading' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Dhan Bahadur Ghale',
    NULL,
    'C408'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dhading' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Ram Bahadur Bhandari',
    NULL,
    'C409'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dhading' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Suresh Rijal',
    NULL,
    'C410'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dhading' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UNP' LIMIT 1),
    false,
    'Amir Tamang',
    NULL,
    'C411'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Nuwakot' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Bikram Timilsina',
    NULL,
    'C412'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Nuwakot' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Prakash Sharan Mahat',
    NULL,
    'C413'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Nuwakot' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Badri Mainali',
    NULL,
    'C414'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Nuwakot' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Hit Bahadur Tamang',
    NULL,
    'C415'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Nuwakot' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Bima Thapa',
    NULL,
    'C416'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Nuwakot' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UNP' LIMIT 1),
    false,
    'Amit Tamang',
    NULL,
    'C417'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Nuwakot' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Achyutam Lamichhane',
    NULL,
    'C418'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Nuwakot' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Jagdishwor Narsingh K.C.',
    NULL,
    'C419'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Nuwakot' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Keshavraj Pandey',
    NULL,
    'C420'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Nuwakot' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Harinath Khatiwada',
    NULL,
    'C421'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Nuwakot' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Jhanak Pyakurel',
    NULL,
    'C422'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Nuwakot' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UNP' LIMIT 1),
    false,
    'Gyandendra Prakash Ghale',
    NULL,
    'C423'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Ranju Darshana',
    NULL,
    'C424'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Prawal Thapa',
    NULL,
    'C425'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Mohan Regmi',
    NULL,
    'C426'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Menaka Bhandari',
    NULL,
    'C427'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Rabindra Mishra',
    NULL,
    'C428'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UNP' LIMIT 1),
    false,
    'Mangal Lal Shrestha',
    NULL,
    'C429'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Sunil K.C.',
    NULL,
    'C430'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Kabir Sharma',
    NULL,
    'C431'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Maniram Phuyal',
    NULL,
    'C432'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Nitesh Paudel',
    NULL,
    'C433'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Kuntidevi Pokharel',
    NULL,
    'C434'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UNP' LIMIT 1),
    false,
    'Pawan Pokhrel',
    NULL,
    'C435'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Raju Pandey',
    NULL,
    'C436'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Ramesh Aryal',
    NULL,
    'C437'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Rameshwor Phuyal',
    NULL,
    'C438'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Niraj Lama',
    NULL,
    'C439'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Surendra Singh Bohara',
    NULL,
    'C440'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UNP' LIMIT 1),
    false,
    'Kulman Ghising',
    NULL,
    'C441'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Pukar Bam',
    NULL,
    'C442'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Sachin Timalsina',
    NULL,
    'C443'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Rajan Bhattarai',
    NULL,
    'C444'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Indra Bhusal',
    NULL,
    'C445'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Surendra Bhandari',
    NULL,
    'C446'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UNP' LIMIT 1),
    false,
    'Jhanak Bahadur Adhikari',
    NULL,
    'C447'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 5 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Sasmit Pokhrel',
    NULL,
    'C448'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 5 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Pradip Paudel',
    NULL,
    'C449'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 5 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Ishwar Pokhrel',
    NULL,
    'C450'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 5 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Kalpana Sharma',
    NULL,
    'C451'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 5 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Kamal Thapa',
    NULL,
    'C452'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 5 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UNP' LIMIT 1),
    false,
    'Shree Ram Gurung',
    NULL,
    'C453'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 6 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Shishir Khanal',
    NULL,
    'C454'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 6 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Krishna Baniya',
    NULL,
    'C455'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 6 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Aman Kumar Maskey',
    NULL,
    'C456'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 6 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Hemlal Sharma',
    NULL,
    'C457'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 6 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Uddhavraj Bhetwal',
    NULL,
    'C458'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 6 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UNP' LIMIT 1),
    false,
    'Warish Dharel',
    NULL,
    'C459'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 7 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Ganesh Parajuli',
    NULL,
    'C460'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 7 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Pramodhari Guragai',
    NULL,
    'C461'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 7 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Prakash Shrestha',
    NULL,
    'C462'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 7 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Basanta Prasad Manandhar',
    NULL,
    'C463'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 7 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Lal Kumar Lama',
    NULL,
    'C464'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 7 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UNP' LIMIT 1),
    false,
    'Bimala Lama',
    NULL,
    'C465'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 8 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Biraj Bhakta Shrestha',
    NULL,
    'C466'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 8 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Sapana Rajbhandari',
    NULL,
    'C467'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 8 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Rajesh Shakya',
    NULL,
    'C468'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 8 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Suman Sayami',
    NULL,
    'C469'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 8 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Nabin Shahi',
    NULL,
    'C470'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 8 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UNP' LIMIT 1),
    false,
    'Rajan Khadgi',
    NULL,
    'C471'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 9 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Dol Prasad Aryal',
    NULL,
    'C472'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 9 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Nanu Bastola',
    NULL,
    'C473'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 9 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Ajaykranti Shakya',
    NULL,
    'C474'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 9 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Radhakrishna Maharjan',
    NULL,
    'C475'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 9 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Dilip Kumar Karki',
    NULL,
    'C476'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 9 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UNP' LIMIT 1),
    false,
    'Rameshwar Shrestha',
    NULL,
    'C477'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 10 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Pradip Bista',
    NULL,
    'C478'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 10 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Himal Karki',
    NULL,
    'C479'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 10 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Binod Shrestha',
    NULL,
    'C480'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 10 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Rupa Maharjan',
    NULL,
    'C481'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 10 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Balaram Thapa',
    NULL,
    'C482'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kathmandu' LIMIT 1) AND number = 10 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UNP' LIMIT 1),
    false,
    'Dr. Rakesh Neupane',
    NULL,
    'C483'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bhaktapur' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Rukesh Ranjit',
    NULL,
    'C484'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bhaktapur' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Kiran Neupane',
    NULL,
    'C485'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bhaktapur' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Som Prasad Mishra',
    NULL,
    'C486'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bhaktapur' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Hariram Lawaju',
    NULL,
    'C487'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bhaktapur' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Bharat Bahadur Khadka',
    NULL,
    'C488'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bhaktapur' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UNP' LIMIT 1),
    false,
    'Ramesh Balla',
    NULL,
    'C489'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bhaktapur' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NMKP' LIMIT 1),
    false,
    'Prem Suwal',
    NULL,
    'C490'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bhaktapur' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Rajiv Khatri',
    NULL,
    'C491'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bhaktapur' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Kabir Rana',
    NULL,
    'C492'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bhaktapur' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Mahesh Basnet',
    NULL,
    'C493'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bhaktapur' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Ram Prasad Sapkota',
    NULL,
    'C494'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bhaktapur' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Bikram Thapa',
    NULL,
    'C495'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bhaktapur' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UNP' LIMIT 1),
    false,
    'Jitram Lama',
    NULL,
    'C496'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bhaktapur' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NMKP' LIMIT 1),
    false,
    'Ramesh Baidya',
    NULL,
    'C497'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Lalitpur' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Buddha Ratna Maharjan',
    NULL,
    'C498'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Lalitpur' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Udaya Shumsher Rana',
    NULL,
    'C499'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Lalitpur' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Chetnath Sanjyel',
    NULL,
    'C500'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Lalitpur' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Sunil Maharjan',
    NULL,
    'C501'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Lalitpur' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Sajina Karki',
    NULL,
    'C502'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Lalitpur' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UNP' LIMIT 1),
    false,
    'Padam Tamang',
    NULL,
    'C503'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Lalitpur' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Jagdish Kharel',
    NULL,
    'C504'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Lalitpur' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Prem Krishna Maharjan',
    NULL,
    'C505'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Lalitpur' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Prem Bahadur Maharjan',
    NULL,
    'C506'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Lalitpur' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Rajendra Amatya',
    NULL,
    'C507'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Lalitpur' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Raghubarraj Thapa',
    NULL,
    'C508'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Lalitpur' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UNP' LIMIT 1),
    false,
    'Rajaram Tandukar',
    NULL,
    'C509'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Lalitpur' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Toshima Karki',
    NULL,
    'C510'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Lalitpur' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Jitendra Kumar Shrestha',
    NULL,
    'C511'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Lalitpur' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Sandan Thapa Magar',
    NULL,
    'C512'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Lalitpur' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Rajkaji Maharjan',
    NULL,
    'C513'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Lalitpur' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Sabin Khadka',
    NULL,
    'C514'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Lalitpur' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UNP' LIMIT 1),
    false,
    'Ashutosh Bijay Pant',
    NULL,
    'C515'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kavrepalanchok' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Madhu Kumar Chaulagai',
    NULL,
    'C516'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kavrepalanchok' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Gunaraj Moktan',
    NULL,
    'C517'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kavrepalanchok' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Amit Lama',
    NULL,
    'C518'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kavrepalanchok' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Dinanath Gautam',
    NULL,
    'C519'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kavrepalanchok' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Nabaraj Satyal',
    NULL,
    'C520'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kavrepalanchok' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UNP' LIMIT 1),
    false,
    'Yogendra Lama',
    NULL,
    'C521'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kavrepalanchok' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Badan Kumar Bhandari',
    NULL,
    'C522'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kavrepalanchok' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Madhu Prasad Acharya',
    NULL,
    'C523'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kavrepalanchok' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Ashok Kumar Byanju',
    NULL,
    'C524'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kavrepalanchok' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Basundhara Humagain',
    NULL,
    'C525'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kavrepalanchok' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Ranjib Shrestha',
    NULL,
    'C526'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kavrepalanchok' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UNP' LIMIT 1),
    false,
    'Jyotsana Sainju',
    NULL,
    'C527'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sindhupalchok' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Bharat Prasad Parajuli',
    NULL,
    'C528'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sindhupalchok' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Jangabahadur Lama',
    NULL,
    'C529'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sindhupalchok' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Hom Narayan Shrestha',
    NULL,
    'C530'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sindhupalchok' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Madhav Sapkota',
    NULL,
    'C531'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sindhupalchok' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Rammani Neupane',
    NULL,
    'C532'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sindhupalchok' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Ajay Shrestha',
    NULL,
    'C533'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sindhupalchok' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Bangshalal Tamang',
    NULL,
    'C534'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sindhupalchok' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Sher Bahadur Tamang',
    NULL,
    'C535'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sindhupalchok' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Yuvaraj Dulal',
    NULL,
    'C536'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Sindhupalchok' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Gopikrishna Chaulagain',
    NULL,
    'C537'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Makwanpur' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Prakash Gautam',
    NULL,
    'C538'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Makwanpur' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Mahalaxmi Upadhaya',
    NULL,
    'C539'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Makwanpur' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Rameshwor Rana',
    NULL,
    'C540'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Makwanpur' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Bijay Gautam',
    NULL,
    'C541'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Makwanpur' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Deepak Bahadur Singh',
    NULL,
    'C542'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Makwanpur' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UNP' LIMIT 1),
    false,
    'Surendra Lama',
    NULL,
    'C543'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Makwanpur' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Prashant Uprety',
    NULL,
    'C544'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Makwanpur' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Buddha Lama',
    NULL,
    'C545'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Makwanpur' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Mahesh Bartaula',
    NULL,
    'C546'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Makwanpur' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Labasher Bista',
    NULL,
    'C547'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Makwanpur' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Ram Bahadur Thokar',
    NULL,
    'C548'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Makwanpur' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UNP' LIMIT 1),
    false,
    'Prabin Kumar Syangtan',
    NULL,
    'C549'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Chitwan' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Hari Dhakal',
    NULL,
    'C550'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Chitwan' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Rajendra Burlakoti',
    NULL,
    'C551'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Chitwan' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Kamalraj Pathak',
    NULL,
    'C552'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Chitwan' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Krishna Panta',
    NULL,
    'C553'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Chitwan' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Balaram Khanal',
    NULL,
    'C554'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Chitwan' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UNP' LIMIT 1),
    false,
    'Dhan Bahadur Gurung',
    NULL,
    'C555'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Chitwan' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Rabi Lamichhane',
    NULL,
    'C556'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Chitwan' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Mina Kumari Kharel',
    NULL,
    'C557'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Chitwan' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Asmin Ghimire',
    NULL,
    'C558'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Chitwan' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Pratap Gurung',
    NULL,
    'C559'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Chitwan' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Jagadish Adhikari',
    NULL,
    'C560'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Chitwan' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UNP' LIMIT 1),
    false,
    'Nikumar Pakhrin',
    NULL,
    'C561'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Chitwan' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Sobita Gautam',
    NULL,
    'C562'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Chitwan' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Tek Prasad Gurung',
    NULL,
    'C563'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Chitwan' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Shankarraj Thapaliya',
    NULL,
    'C564'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Chitwan' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Renu Dahal',
    NULL,
    'C565'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Chitwan' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Dipak Thapa Magar',
    NULL,
    'C566'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Chitwan' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UNP' LIMIT 1),
    false,
    'Dambar Bahadur Tamang',
    NULL,
    'C567'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Gorkha' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Sudan Gurung',
    NULL,
    'C568'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Gorkha' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Prem Kumar Khatri',
    NULL,
    'C569'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Gorkha' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Ramchandra Lamichhane',
    NULL,
    'C570'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Gorkha' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Hariraj Adhikari',
    NULL,
    'C571'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Gorkha' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Kedarmani Khanal',
    NULL,
    'C572'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Gorkha' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Kabindra Burlakoti',
    NULL,
    'C573'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Gorkha' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Prakash Chandra Dawadi',
    NULL,
    'C574'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Gorkha' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Milan Gurung',
    NULL,
    'C575'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Gorkha' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Lekhnath Neupane',
    NULL,
    'C576'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Gorkha' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Kul Bahadur Basnet',
    NULL,
    'C577'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Manang' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Tek Bahadur Gurung',
    NULL,
    'C578'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Manang' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Yasodha Subedi Gurung',
    NULL,
    'C579'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Manang' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'MNO' LIMIT 1),
    false,
    'Ram Bahadur Ghale',
    NULL,
    'C580'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Lamjung' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Dharma Raj K.C.',
    NULL,
    'C581'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Lamjung' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Gam Prasad Gurung',
    NULL,
    'C582'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Lamjung' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Prithvi Subba Gurung',
    NULL,
    'C583'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Lamjung' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Hari Jung Tamang',
    NULL,
    'C584'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Lamjung' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Kebindra Jung Gurung',
    NULL,
    'C585'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kaski' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Khadak Raj Paudel',
    NULL,
    'C586'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kaski' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Rajendra Prasad Paudel',
    NULL,
    'C587'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kaski' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Prithvi Subba Gurung',
    NULL,
    'C588'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kaski' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Rekha Sharma',
    NULL,
    'C589'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kaski' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Sharada Bahadur Gurung',
    NULL,
    'C590'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kaski' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Swarnim Wagle',
    NULL,
    'C591'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kaski' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Dhan Bahadur Budha',
    NULL,
    'C592'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kaski' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Krishna Bahadur Mahara',
    NULL,
    'C593'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kaski' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Nar Bahadur Pun',
    NULL,
    'C594'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kaski' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Dawa Lama',
    NULL,
    'C595'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Tanahun' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Swarnim Wagle',
    NULL,
    'C596'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Tanahun' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Bijaya Kumar Gauchan',
    NULL,
    'C597'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Tanahun' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Binod Prasad Chaulagain',
    NULL,
    'C598'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Tanahun' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Shyam Bahadur Gurung',
    NULL,
    'C599'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Tanahun' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Prem Bahadur Gauchan',
    NULL,
    'C600'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Tanahun' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Kamal Thapa Magar',
    NULL,
    'C601'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Tanahun' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Rabindra Prasad Adhikari',
    NULL,
    'C602'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Tanahun' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Bishnu Prasad Paudel',
    NULL,
    'C603'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Tanahun' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Ram Prasad Koirala',
    NULL,
    'C604'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Tanahun' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Laxman Thapa',
    NULL,
    'C605'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Syangja' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Ganesh Prasad Regmi',
    NULL,
    'C606'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Syangja' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Surya Bahadur Thapa Magar',
    NULL,
    'C607'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Syangja' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Rameshwor Prasad Paudel',
    NULL,
    'C608'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Syangja' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Hari Bahadur Thapa',
    NULL,
    'C609'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Syangja' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Krishna Prasad Panta',
    NULL,
    'C610'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Syangja' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Durga Prasad Poudel',
    NULL,
    'C611'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Syangja' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Surendra Raj Acharya',
    NULL,
    'C612'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Syangja' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Ramhari Baral',
    NULL,
    'C613'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Syangja' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Tilak Pariyar',
    NULL,
    'C614'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Syangja' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Moti Lal Pokhrel',
    NULL,
    'C615'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Parbat' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Lekhnath Neupane',
    NULL,
    'C616'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Parbat' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Yagya Bahadur Thapa',
    NULL,
    'C617'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Parbat' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Kuber Prasad Sharma',
    NULL,
    'C618'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Parbat' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Lal Bahadur Khadka',
    NULL,
    'C619'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Parbat' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Ghanashyam Khanal',
    NULL,
    'C620'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Baglung' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Prabin Kandel',
    NULL,
    'C621'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Baglung' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Sher Bahadur Deuba',
    NULL,
    'C622'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Baglung' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Bikram Bahadur Thapa',
    NULL,
    'C623'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Baglung' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Lal Bahadur Baniya',
    NULL,
    'C624'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Baglung' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Purna Bahadur Khadka',
    NULL,
    'C625'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Baglung' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Ram Bahadur Magar',
    NULL,
    'C626'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Baglung' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Padam Bahadur Gurung',
    NULL,
    'C627'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Baglung' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Devi Prasad Bhatt',
    NULL,
    'C628'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Baglung' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Ganesh Prasad Paudel',
    NULL,
    'C629'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Baglung' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Til Bahadur Pun',
    NULL,
    'C630'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Myagdi' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Bikash Thapa',
    NULL,
    'C631'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Myagdi' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Raam Bahadur Thapa',
    NULL,
    'C632'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Myagdi' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Hum Bahadur Budha Magar',
    NULL,
    'C633'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Myagdi' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Prem Bahadur Ale',
    NULL,
    'C634'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Myagdi' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Tek Bahadur Budha',
    NULL,
    'C635'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Myagdi' LIMIT 1) AND number = 1 LIMIT 1),
    NULL,
    true,
    'Mahabir Pun',
    NULL,
    'C636'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Mustang' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Dhana Bahadur Sherchan',
    NULL,
    'C637'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Mustang' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Lobsang Lama',
    NULL,
    'C638'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Mustang' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Sangita Gurung',
    NULL,
    'C639'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Mustang' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Gyanbir Sherchan',
    NULL,
    'C640'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Nawalpur' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Balram Adhikari',
    NULL,
    'C641'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Nawalpur' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Dil Bahadur Gurung',
    NULL,
    'C642'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Nawalpur' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Gopal Bahadur Raut',
    NULL,
    'C643'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Nawalpur' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Bimal Poudel',
    NULL,
    'C644'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Nawalpur' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Ram Bahadur Kumal',
    NULL,
    'C645'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Nawalpur' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Deepak Prasad Paudel',
    NULL,
    'C646'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Nawalpur' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Bharat Prasad Gupta',
    NULL,
    'C647'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Nawalpur' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Surendra Prasad Khadka',
    NULL,
    'C648'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Nawalpur' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Bhumi Prasad Upadhyaya',
    NULL,
    'C649'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Nawalpur' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Lal Bahadur Hamal',
    NULL,
    'C650'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rupandehi' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Amar Bahadur Thapa',
    NULL,
    'C651'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rupandehi' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Ramesh Prasad Lekhak',
    NULL,
    'C652'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rupandehi' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Tika Ram Pun',
    NULL,
    'C653'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rupandehi' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Shital Prasad Chaudhary',
    NULL,
    'C654'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rupandehi' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Siddhi Prasad Neupane',
    NULL,
    'C655'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rupandehi' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Kamal Thapa Chhetri',
    NULL,
    'C656'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rupandehi' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Hari Prasad Paudel',
    NULL,
    'C657'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rupandehi' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Mahesh Shrestha',
    NULL,
    'C658'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rupandehi' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Hom Bahadur Thapa',
    NULL,
    'C659'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rupandehi' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Bharat Prasad Khanal',
    NULL,
    'C660'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rupandehi' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Surendra Prasad Pandey',
    NULL,
    'C661'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rupandehi' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Sita Gurung',
    NULL,
    'C662'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rupandehi' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Bed Prasad Sharma',
    NULL,
    'C663'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rupandehi' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Tilak Pariyar',
    NULL,
    'C664'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rupandehi' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Kedar Nath Acharya',
    NULL,
    'C665'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kapilvastu' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Baburam Chaudhary',
    NULL,
    'C666'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kapilvastu' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Anita Devi Chaudhary',
    NULL,
    'C667'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kapilvastu' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Jitendra Kumar Sonwal',
    NULL,
    'C668'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kapilvastu' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Pradeep Kumar Gyawali',
    NULL,
    'C669'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kapilvastu' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Bharat Raj Poudel',
    NULL,
    'C670'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kapilvastu' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Narayan Prasad Dhakal',
    NULL,
    'C671'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kapilvastu' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Ramsahay Prasad Yadav',
    NULL,
    'C672'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kapilvastu' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Krishna Prasad Sitaula',
    NULL,
    'C673'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kapilvastu' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Sher Bahadur Deuba',
    NULL,
    'C674'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kapilvastu' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Ram Chandra Paudel',
    NULL,
    'C675'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Palpa' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Shankar Prasad Pokhrel',
    NULL,
    'C676'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Palpa' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Kiran Gurung',
    NULL,
    'C677'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Palpa' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Radheshyam Adhikari',
    NULL,
    'C678'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Palpa' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Girdhari Sharma',
    NULL,
    'C679'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Palpa' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Naraj Bahadur Thapa',
    NULL,
    'C680'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Palpa' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Dipendra Bahadur Pal',
    NULL,
    'C681'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Palpa' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Balkrishna Khand',
    NULL,
    'C682'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Palpa' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Kamal Raj Acharya',
    NULL,
    'C683'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Palpa' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Kamal Bahadur Shah',
    NULL,
    'C684'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Palpa' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Bhawani Prasad Kharel',
    NULL,
    'C685'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Gulmi' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Krishna Bahadur Raut',
    NULL,
    'C686'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Gulmi' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Ramesh Prasad Ghimire',
    NULL,
    'C687'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Gulmi' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Mahesh Prasad Basnet',
    NULL,
    'C688'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Gulmi' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Mohan Bahadur Basnet',
    NULL,
    'C689'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Gulmi' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Gopal Prasad Ghimire',
    NULL,
    'C690'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Gulmi' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Dhan Bahadur Magar',
    NULL,
    'C691'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Gulmi' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Purna Bahadur Gharti',
    NULL,
    'C692'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Gulmi' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Laxman Prasad Ghimire',
    NULL,
    'C693'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Gulmi' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Mohan Bahadur K.C.',
    NULL,
    'C694'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Gulmi' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Bhim Bahadur Rana',
    NULL,
    'C695'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Arghakhanchi' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Narendra Prasad Panta',
    NULL,
    'C696'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Arghakhanchi' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Ramnarayan Bidari',
    NULL,
    'C697'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Arghakhanchi' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Bishnu Prasad Paudel',
    NULL,
    'C698'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Arghakhanchi' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Shiva Prasad Humagain',
    NULL,
    'C699'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Arghakhanchi' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Dil Bahadur Gharti',
    NULL,
    'C700'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Pyuthan' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Gokul Prasad Baskota',
    NULL,
    'C701'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Pyuthan' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Sita Ram Updhyaya',
    NULL,
    'C702'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Pyuthan' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Dipak Bohara',
    NULL,
    'C703'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Pyuthan' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Bimala Gharti',
    NULL,
    'C704'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Pyuthan' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Padam Bahadur K.C.',
    NULL,
    'C705'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rolpa' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Purna Bahadur Gharti Magar',
    NULL,
    'C706'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rolpa' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Chitra Bahadur K.C.',
    NULL,
    'C707'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rolpa' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Gopal Prasad Bohara',
    NULL,
    'C708'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rolpa' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Post Bahadur Bogati',
    NULL,
    'C709'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rolpa' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Tek Bahadur Gharti',
    NULL,
    'C710'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rukum East' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Govinda Prasad Sharma',
    NULL,
    'C711'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rukum East' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Kul Bahadur Gurung',
    NULL,
    'C712'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rukum East' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Agni Prasad Sapkota',
    NULL,
    'C713'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rukum East' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Pampha Bhusal',
    NULL,
    'C714'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rukum East' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Dhan Bahadur Khadka',
    NULL,
    'C715'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dang' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Pramod Kumar Upadhyaya',
    NULL,
    'C716'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dang' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Sher Bahadur Malla',
    NULL,
    'C717'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dang' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Prem Bahadur Ale',
    NULL,
    'C718'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dang' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Ram Bahadur Thapa',
    NULL,
    'C719'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dang' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Khem Raj Regmi',
    NULL,
    'C720'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dang' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Lal Bahadur Thapa',
    NULL,
    'C721'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dang' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Bhim Prasad Chaudhary',
    NULL,
    'C722'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dang' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Surendra Bahadur Shahi',
    NULL,
    'C723'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dang' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Lila Prasad Shrestha',
    NULL,
    'C724'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dang' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Ram Bahadur Thapa Magar',
    NULL,
    'C725'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Banke' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Santosh Kumar Chalise',
    NULL,
    'C726'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Banke' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Dilendra Prasad Badu',
    NULL,
    'C727'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Banke' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Bishnu Prasad Paudel',
    NULL,
    'C728'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Banke' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Purna Bahadur Khadka',
    NULL,
    'C729'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Banke' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Gajendra Bahadur Hamal',
    NULL,
    'C730'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Banke' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Nawaraj Silwal',
    NULL,
    'C731'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Banke' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Lila Prasad Giri',
    NULL,
    'C732'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Banke' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Krishna Bahadur Raut',
    NULL,
    'C733'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Banke' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Mohan Bahadur Chand',
    NULL,
    'C734'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Banke' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Sher Bahadur Thapa',
    NULL,
    'C735'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bardiya' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Ghanashyam Ayer',
    NULL,
    'C736'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bardiya' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Rekha Sharma',
    NULL,
    'C737'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bardiya' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Mahesh Prasad Basnet',
    NULL,
    'C738'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bardiya' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Nar Bahadur Chand',
    NULL,
    'C739'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bardiya' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Dilendra Bahadur Chand',
    NULL,
    'C740'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bardiya' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Lekh Nath Regmi',
    NULL,
    'C741'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bardiya' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Ganga Prasad Ayer',
    NULL,
    'C742'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bardiya' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Karna Bahadur Thapa',
    NULL,
    'C743'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bardiya' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Surya Bahadur Khadka',
    NULL,
    'C744'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bardiya' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Laxmi Prasad Tharu',
    NULL,
    'C745'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Parasi' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Sanjay Kumar Gupta',
    NULL,
    'C746'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Parasi' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Chitra Lekha Yadav',
    NULL,
    'C747'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Parasi' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Narayan Prasad Sah',
    NULL,
    'C748'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Parasi' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Shiv Prasad Humagain',
    NULL,
    'C749'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Parasi' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Gyan Bahadur Shahi',
    NULL,
    'C750'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dolpa' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Karna Bahadur Budha',
    NULL,
    'C751'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dolpa' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Jit Bahadur Buda',
    NULL,
    'C752'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dolpa' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Ram Bahadur Budha',
    NULL,
    'C753'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dolpa' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Man Bahadur Budha',
    NULL,
    'C754'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Mugu' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Khadga Bahadur Shahi',
    NULL,
    'C755'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Mugu' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Sher Bahadur Shahi',
    NULL,
    'C756'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Mugu' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Gokul Prasad Baskota',
    NULL,
    'C757'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Mugu' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Bikram Bahadur Shahi',
    NULL,
    'C758'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Humla' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Jayapati Rokaya',
    NULL,
    'C759'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Humla' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Mahendra Bahadur Shahi',
    NULL,
    'C760'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Humla' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Narayan Bahadur Rokaya',
    NULL,
    'C761'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Humla' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Gokul Bahadur Rokaya',
    NULL,
    'C762'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Jumla' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Deep Bahadur Shahi',
    NULL,
    'C763'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Jumla' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Gopal Bahadur Hamal',
    NULL,
    'C764'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Jumla' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Ram Bahadur Shahi',
    NULL,
    'C765'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Jumla' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Dhan Bahadur Shahi',
    NULL,
    'C766'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kalikot' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Harsh Bahadur Bam',
    NULL,
    'C767'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kalikot' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Nawaraj Saud',
    NULL,
    'C768'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kalikot' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Gopal Bahadur Rokaya',
    NULL,
    'C769'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kalikot' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Harka Bahadur Bam',
    NULL,
    'C770'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Salyan' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Kesh Bahadur Bishta',
    NULL,
    'C771'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Salyan' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Narayan Prasad Dhakal',
    NULL,
    'C772'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Salyan' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Tulsi Bahadur Hamal',
    NULL,
    'C773'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Salyan' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Dhan Bahadur Shahi',
    NULL,
    'C774'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Jajarkot' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Ram Bahadur Bhandari',
    NULL,
    'C775'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Jajarkot' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Deepak Prasad Bhandari',
    NULL,
    'C776'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Jajarkot' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Prem Bahadur Singh',
    NULL,
    'C777'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Jajarkot' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Dhan Bahadur Bhandari',
    NULL,
    'C778'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rukum West' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Gopal Bahadur Magar',
    NULL,
    'C779'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rukum West' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Khagendra Bahadur Magar',
    NULL,
    'C780'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rukum West' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Nawaraj Oli',
    NULL,
    'C781'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Rukum West' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Khadga Bahadur Shahi',
    NULL,
    'C782'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dailekh' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Prithvi Bahadur Singh',
    NULL,
    'C783'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dailekh' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Tara Bahadur Singh',
    NULL,
    'C784'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dailekh' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Gopal Bahadur Thapa',
    NULL,
    'C785'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dailekh' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Nabin Bahadur Singh',
    NULL,
    'C786'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dailekh' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Lila Bahadur Baniya',
    NULL,
    'C787'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dailekh' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Sher Bahadur Thapa',
    NULL,
    'C788'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dailekh' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Prem Bahadur Rawal',
    NULL,
    'C789'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dailekh' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Ram Bahadur Rokaya',
    NULL,
    'C790'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Surkhet' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Ganesh Prasad Lamichhane',
    NULL,
    'C791'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Surkhet' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Rekha Sharma',
    NULL,
    'C792'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Surkhet' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Mahendra Bahadur Shahi',
    NULL,
    'C793'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Surkhet' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Prem Bahadur Ale',
    NULL,
    'C794'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Surkhet' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Narayan Bahadur Rana',
    NULL,
    'C795'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Surkhet' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Nar Bahadur Chand',
    NULL,
    'C796'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Surkhet' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Kalpana Dhamala',
    NULL,
    'C797'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Surkhet' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Gopal Bahadur Hamal',
    NULL,
    'C798'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Surkhet' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Nanda Bahadur Pun',
    NULL,
    'C799'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Surkhet' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Tek Bahadur Chand',
    NULL,
    'C800'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bajura' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Janakraj Giri',
    NULL,
    'C801'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bajura' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Mahendra Bahadur Shahi',
    NULL,
    'C802'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bajura' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Gopal Bahadur Thapa',
    NULL,
    'C803'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bajura' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Khem Bahadur Thapa',
    NULL,
    'C804'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bajhang' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Prakash Snehi Rasaili',
    NULL,
    'C805'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bajhang' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Surendra Bahadur Bista',
    NULL,
    'C806'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bajhang' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Ram Bahadur Bista',
    NULL,
    'C807'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bajhang' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Dhan Bahadur Bista',
    NULL,
    'C808'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bajhang' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Lal Bahadur Bista',
    NULL,
    'C809'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bajhang' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Nawaraj Bista',
    NULL,
    'C810'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bajhang' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Man Bahadur Bista',
    NULL,
    'C811'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bajhang' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Khadga Bahadur Bista',
    NULL,
    'C812'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Doti' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Bharat Bahadur Khadka',
    NULL,
    'C813'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Doti' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Narendra Bahadur Thapa',
    NULL,
    'C814'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Doti' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Prem Bahadur Bohara',
    NULL,
    'C815'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Doti' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Gopal Prasad Thapa',
    NULL,
    'C816'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Doti' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Prem Bahadur Saud',
    NULL,
    'C817'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Doti' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Kamal Bahadur Shah',
    NULL,
    'C818'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Doti' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Man Bahadur Bist',
    NULL,
    'C819'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Doti' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Bikram Bahadur Bist',
    NULL,
    'C820'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Achham' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Bharat Swar',
    NULL,
    'C821'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Achham' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Surendra Bahadur Bist',
    NULL,
    'C822'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Achham' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Narayan Bahadur Bist',
    NULL,
    'C823'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Achham' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Dhan Bahadur Bist',
    NULL,
    'C824'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Achham' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Pushpa Bahadur Shah',
    NULL,
    'C825'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Achham' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Khem Bahadur Bist',
    NULL,
    'C826'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Achham' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Gopal Bahadur Shah',
    NULL,
    'C827'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Achham' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Narayan Bahadur Rokaya',
    NULL,
    'C828'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dadeldhura' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Ram Bahadur Thapa',
    NULL,
    'C829'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dadeldhura' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Sher Bahadur Thapa',
    NULL,
    'C830'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dadeldhura' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Gopal Bahadur Thapa',
    NULL,
    'C831'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dadeldhura' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Khadga Bahadur Thapa',
    NULL,
    'C832'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Baitadi' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Chatur Bahadur Chand',
    NULL,
    'C833'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Baitadi' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Nawaraj Bist',
    NULL,
    'C834'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Baitadi' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Deepak Bahadur Bist',
    NULL,
    'C835'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Baitadi' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Rajendra Bahadur Bist',
    NULL,
    'C836'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Baitadi' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Prem Bahadur Joshi',
    NULL,
    'C837'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Baitadi' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Gopal Bahadur Joshi',
    NULL,
    'C838'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Baitadi' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Ram Bahadur Joshi',
    NULL,
    'C839'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Baitadi' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Sher Bahadur Joshi',
    NULL,
    'C840'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Darchula' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Dharmanand Joshi',
    NULL,
    'C841'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Darchula' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Narayan Bahadur Bist',
    NULL,
    'C842'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Darchula' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Gopal Bahadur Bist',
    NULL,
    'C843'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Darchula' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Khadga Bahadur Bist',
    NULL,
    'C844'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kailali' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Lila Prasad Bohara',
    NULL,
    'C845'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kailali' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Janakraj Chaudhary',
    NULL,
    'C846'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kailali' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Surendra Bahadur Shahi',
    NULL,
    'C847'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kailali' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Purna Bahadur Chand',
    NULL,
    'C848'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kailali' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Gopal Bahadur Hamal',
    NULL,
    'C849'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kailali' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Narayan Bahadur Saud',
    NULL,
    'C850'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kailali' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Vijay Swar',
    NULL,
    'C851'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kailali' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Khadga Bahadur Bist',
    NULL,
    'C852'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kailali' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Bikram Bahadur Thapa',
    NULL,
    'C853'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kailali' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Ram Bahadur Saud',
    NULL,
    'C854'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kailali' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Dipendra Bahadur Pal',
    NULL,
    'C855'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kailali' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Dilendra Prasad Badu',
    NULL,
    'C856'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kailali' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Sher Bahadur Deuba',
    NULL,
    'C857'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kailali' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Mohan Bahadur Chand',
    NULL,
    'C858'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kailali' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Shanti Devi Thapa',
    NULL,
    'C859'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kailali' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Ganesh Prasad Lamichhane',
    NULL,
    'C860'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kailali' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Karna Bahadur Tharu',
    NULL,
    'C861'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kailali' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Nawaraj Sharma',
    NULL,
    'C862'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kailali' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Tara Devi Bam',
    NULL,
    'C863'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kailali' LIMIT 1) AND number = 4 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Dhan Bahadur Rana',
    NULL,
    'C864'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kanchanpur' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Surendra Bahadur Bist',
    NULL,
    'C865'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kanchanpur' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Narayan Prasad Sah',
    NULL,
    'C866'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kanchanpur' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Gopal Bahadur Rokaya',
    NULL,
    'C867'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kanchanpur' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Ram Bahadur Saud',
    NULL,
    'C868'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kanchanpur' LIMIT 1) AND number = 1 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Laxmi Prasad Joshi',
    NULL,
    'C869'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kanchanpur' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Narayan Bahadur Bist',
    NULL,
    'C870'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kanchanpur' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Dhan Bahadur Bist',
    NULL,
    'C871'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kanchanpur' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Khadga Bahadur Bist',
    NULL,
    'C872'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kanchanpur' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Sher Bahadur Bist',
    NULL,
    'C873'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kanchanpur' LIMIT 1) AND number = 2 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Gopal Bahadur Joshi',
    NULL,
    'C874'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kanchanpur' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RSP' LIMIT 1),
    false,
    'Prem Bahadur Saud',
    NULL,
    'C875'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kanchanpur' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NC' LIMIT 1),
    false,
    'Mohan Bahadur Thapa',
    NULL,
    'C876'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kanchanpur' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'UML' LIMIT 1),
    false,
    'Narayan Bahadur Bist',
    NULL,
    'C877'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kanchanpur' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'NCP' LIMIT 1),
    false,
    'Gopal Bahadur Bist',
    NULL,
    'C878'
  ),
  (
    (SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Kanchanpur' LIMIT 1) AND number = 3 LIMIT 1),
    (SELECT id FROM parties WHERE abbreviation = 'RPP' LIMIT 1),
    false,
    'Bikram Bahadur Bist',
    NULL,
    'C879'
  );

-- 4. Create empty vote result entries for all candidates
INSERT INTO results (candidate_id, constituency_id, votes, is_winner)
SELECT id, constituency_id, 0, false FROM candidates;
