
-- Update Party Symbols with placeholder URLs
UPDATE parties SET symbol_cloudinary_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Flag_of_the_Nepali_Congress.svg/220px-Flag_of_the_Nepali_Congress.svg.png' WHERE abbreviation = 'NC';
UPDATE parties SET symbol_cloudinary_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/Nepal_Communist_Party_Logo.svg/200px-Nepal_Communist_Party_Logo.svg.png' WHERE abbreviation = 'UML';
UPDATE parties SET symbol_cloudinary_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/CPN_%28Maoist_Centre%29_Election_Symbol.png/220px-CPN_%28Maoist_Centre%29_Election_Symbol.png' WHERE abbreviation = 'MC';
UPDATE parties SET symbol_cloudinary_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/Rastriya_Swatantra_Party_logo.png/220px-Rastriya_Swatantra_Party_logo.png' WHERE abbreviation = 'RSP';
UPDATE parties SET symbol_cloudinary_url = 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Hala_%28Plow%29.svg/220px-Hala_%28Plow%29.svg.png' WHERE abbreviation = 'RPP';

-- Adding mock candidates for Kathmandu-1 (id: 91)
INSERT INTO candidates (constituency_id, party_id, is_independent, name_en, name_np, photo_cloudinary_url, ecn_candidate_id) VALUES
(91, 1, false, 'Prakash Man Singh', 'प्रकाशमान सिंह', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Prakash_Man_Singh.jpg/220px-Prakash_Man_Singh.jpg', 'KTM1_NC_01'),
(91, 4, false, 'Pukar Bam', 'पुकार बम', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Face-placeholder.svg', 'KTM1_RSP_01'),
(91, 2, false, 'Kiran Poudel', 'किरण पौडेल', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Face-placeholder.svg', 'KTM1_UML_01'),
(91, 5, false, 'Rabindra Mishra', 'रवीन्द्र मिश्र', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Rabindra_Mishra.jpg/220px-Rabindra_Mishra.jpg', 'KTM1_RPP_01');

-- Adding mock candidates for Sunsari-1 (id: 21)
INSERT INTO candidates (constituency_id, party_id, is_independent, name_en, name_np, photo_cloudinary_url, ecn_candidate_id) VALUES
(21, 4, false, 'Goma Tamang', 'गोमा तामाङ', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Face-placeholder.svg', 'SUN1_RSP_01'),
(21, 1, false, 'Jay Kumar Rai', 'जय कुमार राई', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Face-placeholder.svg', 'SUN1_NC_01'),
(21, 2, false, 'Ashok Kumar Rai', 'अशोक कुमार राई', 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Face-placeholder.svg', 'SUN1_UML_01');

-- Insert initial empty Results for Kathmandu-1
INSERT INTO results (candidate_id, constituency_id, votes, is_winner) VALUES
((SELECT id FROM candidates WHERE ecn_candidate_id = 'KTM1_NC_01'), 91, 0, false),
((SELECT id FROM candidates WHERE ecn_candidate_id = 'KTM1_RSP_01'), 91, 0, false),
((SELECT id FROM candidates WHERE ecn_candidate_id = 'KTM1_UML_01'), 91, 0, false),
((SELECT id FROM candidates WHERE ecn_candidate_id = 'KTM1_RPP_01'), 91, 0, false);

-- Insert initial empty Results for Sunsari-1
INSERT INTO results (candidate_id, constituency_id, votes, is_winner) VALUES
((SELECT id FROM candidates WHERE ecn_candidate_id = 'SUN1_RSP_01'), 21, 0, false),
((SELECT id FROM candidates WHERE ecn_candidate_id = 'SUN1_NC_01'), 21, 0, false),
((SELECT id FROM candidates WHERE ecn_candidate_id = 'SUN1_UML_01'), 21, 0, false);
