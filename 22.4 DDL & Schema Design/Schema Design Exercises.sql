--Medical Center--
-- A medical center employs several doctors
-- A doctors can see many patients
-- A patient can be seen by many doctors
-- During a visit, a patient may be diagnosed to have one or more diseases.

CREATE TABLE "doctors" (
  "id" int PRIMARY KEY NOT NULL,
  "first_name" text NOT NULL,
  "last_name" text NOT NULL,
  "speciality" text NOT NULL,
  "practice_sites" text
);

CREATE TABLE "patients" (
  "mrn" int[pk],
  "first_name" text NOT NULL,
  "last_name" text NOT NULL,
  "dob" date NOT NULL,
  "gender" text
);

CREATE TABLE "doctors_patients" (
  "doc_id" int,
  "patient_mrn" int,
  "date_visited" date
);

CREATE TABLE "diseases" (
  "id" int PRIMARY KEY,
  "name" text
);

CREATE TABLE "patient_disease" (
  "patient_mrn" int,
  "disease" int
);

ALTER TABLE "doctors_patients" ADD FOREIGN KEY ("doc_id") REFERENCES "doctors" ("id");

ALTER TABLE "doctors_patients" ADD FOREIGN KEY ("patient_mrn") REFERENCES "patients" ("mrn");

ALTER TABLE "patient_disease" ADD FOREIGN KEY ("patient_mrn") REFERENCES "patients" ("mrn");

ALTER TABLE "patient_disease" ADD FOREIGN KEY ("disease") REFERENCES "diseases" ("id");

--Craigslist post--
-- The region of the craigslist post (San Francisco, Atlanta, Seattle, etc)
-- Users and preferred region
-- Posts: contains title, text, the user who has posted, the location of the posting, the region of the posting
-- Categories that each post belongs to

CREATE TABLE "craigslist_posts" (
  "id" int NOT NULL,
  "region" text NOT NULL,
  PRIMARY KEY ("id", "region")
);

CREATE TABLE "user" (
  "id" int[pk],
  "preferred_region" int
);

CREATE TABLE "posts" (
  "id" int PRIMARY KEY NOT NULL,
  "title" text,
  "desc" text,
  "date_posted" date
);

CREATE TABLE "user_posts" (
  "user_id" int,
  "post_id" id,
  "region" int
);

ALTER TABLE "user" ADD FOREIGN KEY ("preferred_region") REFERENCES "craigslist_posts" ("id");

ALTER TABLE "user_posts" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("id");

ALTER TABLE "user_posts" ADD FOREIGN KEY ("post_id") REFERENCES "posts" ("id");

ALTER TABLE "user_posts" ADD FOREIGN KEY ("region") REFERENCES "craigslist_posts" ("id");

--Soccer League--
-- All of the teams in the league
-- All of the goals scored by every player for each game
-- All of the players in the league and their corresponding teams
-- All of the referees who have been part of each game
-- All of the matches played between teams
-- All of the start and end dates for season that a league has
-- The standings/rankings of each team in the league (This doesn’t have to be its own table if the data can be captured somehow).

CREATE TABLE "teams" (
  "id" int PRIMARY KEY NOT NULL,
  "team_name" text,
  "goals" int,
  "coach" text,
  "ranking" int
);

CREATE TABLE "players" (
  "id" int PRIMARY KEY NOT NULL,
  "first_name" text,
  "last_name" text,
  "team" int,
  "goals_scored" int
);

CREATE TABLE "referees" (
  "id" int,
  "first_name" text,
  "last_name" text
);

CREATE TABLE "matches" (
  "id" int PRIMARY KEY,
  "team_1" int,
  "team_2" int,
  "date_played" date_played,
  "referees" int,
  "winner" int
);

ALTER TABLE "players" ADD FOREIGN KEY ("team") REFERENCES "teams" ("id");

ALTER TABLE "matches" ADD FOREIGN KEY ("team_1") REFERENCES "teams" ("id");

ALTER TABLE "matches" ADD FOREIGN KEY ("team_2") REFERENCES "teams" ("id");

ALTER TABLE "matches" ADD FOREIGN KEY ("referees") REFERENCES "referees" ("id");

ALTER TABLE "matches" ADD FOREIGN KEY ("winner") REFERENCES "teams" ("id");

