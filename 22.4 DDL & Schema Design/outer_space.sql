-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE galaxies(
  id SERIAL PRIMARY KEY,
  galaxy TEXT NOT NULL
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  planet_name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around TEXT NOT NULL,  
  moons TEXT[] DEFAULT NULL,
  galaxy INT REFERENCES galaxies(id)
);
INSERT INTO galaxies (galaxy) VALUES ('Milky Way'), ('Proxima Centauri');

INSERT INTO planets
  (planet_name, orbital_period_in_years, orbits_around, moons, galaxy)
VALUES
  ('Earth', 1.00, 'The Sun','{"The Moon"}', 1),
  ('Mars', 1.88, 'The Sun','{"Phobos", "Deimos"}', 1),
  ('Venus', 0.62, 'The Sun', '{}', 1),
  ('Neptune', 164.8, 'The Sun', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}', 1),
  ('Proxima Centauri b', 0.03, 'Proxima Centauri', '{}', 2),
  ('Gliese 876 b', 0.23, 'Gliese 876', '{}', 1);



