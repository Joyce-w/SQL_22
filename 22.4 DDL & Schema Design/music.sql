-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE songs
(
  id SERIAL UNIQUE PRIMARY KEY,
  song_title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  artists TEXT[] NOT NULL
);

CREATE TABLE albums (
  id SERIAL UNIQUE PRIMARY KEY,
  album_title TEXT NOT NULL,
  release_date DATE NOT NULL,
  producers TEXT[] NOT NULL
);

CREATE TABLE album_songs (
  song_id INTEGER REFERENCES songs ON DELETE CASCADE,
  album_id INTEGER REFERENCES albums ON DELETE CASCADE
);

INSERT INTO songs
  (song_title, duration_in_seconds, artists)
VALUES
  ('MMMBop', 238, '{"Hanson"}'),
  ('Bohemian Rhapsody', 355, '{"Queen"}'),
  ('One Sweet Day', 282, '{"Mariah Cary", "Boyz II Men"}'),
  ('Shallow', 216,'{"Lady Gaga", "Bradley Cooper"}'),
  ('How You Remind Me', 223, '{"Nickelback"}'),
  ('New York State of Mind', 276, '{"Jay Z", "Alicia Keys"}'),
  ('Dark Horse', 215, '{"Katy Perry", "Juicy J"}'),
  ('Moves Like Jagger', 201,'{"Maroon 5", "Christina Aguilera"}'),
  ('Complicated', 244, '{"Avril Lavigne"}'),
  ('Say My Name', 240, '{"Destiny''s Child"}');

INSERT INTO albums (release_date, album_title,  producers) VALUES
  ('04-15-1997','Middle of Nowhere', '{"Dust Brothers", "Stephen Lironi"}'),
  ('10-31-1975','A Night at the Opera', '{"Roy Thomas Baker"}'),
  ('11-14-1995', 'Daydream', '{"Walter Afanasieff"}'),
  ('09-27-2018', 'A Star Is Born', '{"Benjamin Rice"}'),
  ('08-21-2001', 'Silver Side Up', '{"Rick Parashar"}'),
  ('10-20-2009', 'The Blueprint 3', '{"Al Shux"}'),
  ('12-17-2013', 'Prism', '{"Max Martin", "Cirkut"}'),
  ('06-21-2011', 'Hands All Over', '{"Shellback", "Benny Blanco"}'),
  ('05-14-2002', 'Let Go', '{"The Matrix"}'),
  ('11-07-1999', 'The Writing''s on the Wall', '{"Darkchild"}');


INSERT INTO album_songs
  (song_id, album_id) VALUES 
  (1,1),
  (2,2),
  (3,3),
  (4,4),
  (5,5),
  (6,6),
  (7,7),
  (8,8),
  (9,9),
  (3,10);

