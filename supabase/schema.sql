-- 7 Provinces
create table provinces (
  id serial primary key,
  name_en text not null,
  name_np text
);

-- 77 Districts
create table districts (
  id serial primary key,
  province_id int references provinces(id),
  name_en text not null,
  name_np text
);

-- 165 FPTP Constituencies
create table constituencies (
  id serial primary key,
  district_id int references districts(id),
  number int not null,
  name_en text not null,        -- e.g. "Sunsari-3"
  name_np text,
  total_voters int,
  status text default 'counting' -- 'counting' | 'declared'
);

-- Political Parties (66+ parties)
create table parties (
  id serial primary key,
  name_en text not null,
  name_np text,
  abbreviation text,
  symbol_cloudinary_url text,   -- party election symbol image
  color_hex text                -- used for chart coloring
);

-- Candidates (3400+ total including independents)
create table candidates (
  id serial primary key,
  constituency_id int references constituencies(id),
  party_id int references parties(id),   -- NULL if independent
  is_independent boolean default false,
  name_en text not null,
  name_np text,
  photo_cloudinary_url text,
  ecn_candidate_id text unique           -- ECN internal ID for deduplication
);

-- Live Results (upserted every scrape)
create table results (
  id serial primary key,
  candidate_id int references candidates(id) unique,
  constituency_id int references constituencies(id),
  votes int default 0,
  is_winner boolean default false,
  last_scraped_at timestamptz default now()
);

-- Vote Snapshots (one row per candidate per scrape — used for line chart)
create table vote_snapshots (
  id serial primary key,
  candidate_id int references candidates(id),
  votes int not null,
  snapshot_time timestamptz default now()
);

-- Scrape Log
create table scrape_log (
  id serial primary key,
  run_at timestamptz default now(),
  constituencies_updated int,
  status text,                   -- 'success' | 'error'
  error_message text
);

-- Enable Realtime for Results Table
alter publication supabase_realtime add table results;
