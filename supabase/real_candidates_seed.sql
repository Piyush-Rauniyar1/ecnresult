-- Wipe old dummy candidates gracefully
TRUNCATE TABLE candidates, results RESTART IDENTITY CASCADE;

-- Insert any missing parties from the 2022 election lists (Unified Socialist)
INSERT INTO parties (name_en, name_np, abbreviation, color_hex) 
VALUES ('CPN (Unified Socialist)', 'नेकपा (एकीकृत समाजवादी)', 'US', '#FF0000') 
ON CONFLICT DO NOTHING;

-- Insert real candidates using subqueries to automatically match Constituency and Party IDs!
INSERT INTO candidates (constituency_id, party_id, is_independent, name_en, name_np, photo_cloudinary_url, ecn_candidate_id) VALUES

-- Bhojpur 1
((SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bhojpur') AND number = 1), (SELECT id FROM parties WHERE abbreviation = 'MC'), false, 'Sudan Kirati', 'सुदन किराती', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Face-placeholder.svg', 'BHOJ1_MC'),
((SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Bhojpur') AND number = 1), (SELECT id FROM parties WHERE abbreviation = 'UML'), false, 'Sher Dhan Rai', 'शेरधन राई', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Face-placeholder.svg', 'BHOJ1_UML'),

-- Dhankuta 1
((SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dhankuta') AND number = 1), (SELECT id FROM parties WHERE abbreviation = 'UML'), false, 'Rajendra Kumar Rai', 'राजेन्द्र कुमार राई', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Face-placeholder.svg', 'DHAN1_UML'),
((SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Dhankuta') AND number = 1), (SELECT id FROM parties WHERE abbreviation = 'NC'), false, 'Sunil Bahadur Thapa', 'सुनिल बहादुर थापा', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Face-placeholder.svg', 'DHAN1_NC'),

-- Ilam 1
((SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Ilam') AND number = 1), (SELECT id FROM parties WHERE abbreviation = 'UML'), false, 'Mahesh Basnet', 'महेश बस्नेत', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Face-placeholder.svg', 'ILAM1_UML'),
((SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Ilam') AND number = 1), (SELECT id FROM parties WHERE abbreviation = 'US'), false, 'Jhalanath Khanal', 'झलनाथ खनाल', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Face-placeholder.svg', 'ILAM1_US'),

-- Ilam 2
((SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Ilam') AND number = 2), (SELECT id FROM parties WHERE abbreviation = 'UML'), false, 'Subash Chandra Nembang', 'सुवासचन्द्र नेम्वाङ', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Face-placeholder.svg', 'ILAM2_UML'),
((SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Ilam') AND number = 2), (SELECT id FROM parties WHERE abbreviation = 'NC'), false, 'Dambar Bahadur Khadka', 'डम्बर बहादुर खड्का', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Face-placeholder.svg', 'ILAM2_NC'),

-- Jhapa 1
((SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Jhapa') AND number = 1), (SELECT id FROM parties WHERE abbreviation = 'UML'), false, 'Agni Kharel', 'अग्नि खरेल', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Face-placeholder.svg', 'JHA1_UML'),
((SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Jhapa') AND number = 1), (SELECT id FROM parties WHERE abbreviation = 'NC'), false, 'Bishwa Prakash Sharma', 'विश्वप्रकाश शर्मा', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Face-placeholder.svg', 'JHA1_NC'),

-- Jhapa 2
((SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Jhapa') AND number = 2), (SELECT id FROM parties WHERE abbreviation = 'UML'), false, 'Dev Raj Ghimire', 'देवराज घिमिरे', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Face-placeholder.svg', 'JHA2_UML'),
((SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Jhapa') AND number = 2), (SELECT id FROM parties WHERE abbreviation = 'MC'), false, 'Harikumar Ranamagar', 'हरिकुमार रानामगर', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Face-placeholder.svg', 'JHA2_MC'),

-- Jhapa 3
((SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Jhapa') AND number = 3), (SELECT id FROM parties WHERE abbreviation = 'RPP'), false, 'Rajendra Lingden', 'राजेन्द्र लिङ्देन', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Face-placeholder.svg', 'JHA3_RPP'),
((SELECT id FROM constituencies WHERE district_id = (SELECT id FROM districts WHERE name_en = 'Jhapa') AND number = 3), (SELECT id FROM parties WHERE abbreviation = 'NC'), false, 'Krishna Prasad Sitaula', 'कृष्ण सिटौला', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Face-placeholder.svg', 'JHA3_NC');


-- Insert Empty Results entries for them
INSERT INTO results (candidate_id, constituency_id, votes, is_winner) 
SELECT id, constituency_id, 0, false FROM candidates;
