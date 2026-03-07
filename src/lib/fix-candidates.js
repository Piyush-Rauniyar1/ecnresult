const fs = require('fs');

const seedData = fs.readFileSync('supabase/seed.sql', 'utf8');

// The parties are now in this order:
// 1 = NC
// 2 = UML
// 3 = RSP
// 4 = NCP (Maoists)
// 5 = RPP
// ...
// 30 = IND

let updatedData = seedData
  .replace(/UPDATE parties SET symbol_cloudinary_url = .*;\n/g, '') // remove old placeholder updates since they are built-in
  .replace(/\(91, 1, false, 'Prakash Man Singh'/g, "(91, 1, false, 'Prakash Man Singh'") // NC is 1
  .replace(/\(91, 4, false, 'Pukar Bam'/g, "(91, 3, false, 'Pukar Bam'") // RSP is now 3
  .replace(/\(91, 2, false, 'Kiran Poudel'/g, "(91, 2, false, 'Kiran Poudel'") // UML is 2
  .replace(/\(91, 5, false, 'Rabindra Mishra'/g, "(91, 5, false, 'Rabindra Mishra'") // RPP is 5
  
  .replace(/\(21, 4, false, 'Goma Tamang'/g, "(21, 3, false, 'Goma Tamang'") // RSP is now 3
  .replace(/\(21, 1, false, 'Jay Kumar Rai'/g, "(21, 1, false, 'Jay Kumar Rai'") // NC is 1
  .replace(/\(21, 2, false, 'Ashok Kumar Rai'/g, "(21, 2, false, 'Ashok Kumar Rai'"); // UML is 2

// Remove multiple consecutive blank lines created by the removal of the UPDATEs
updatedData = updatedData.replace(/\n\s*\n\s*\n/g, '\n\n');

fs.writeFileSync('supabase/seed.sql', updatedData);
console.log('Fixed candidate party IDs based on new 1-30 mapping.')
