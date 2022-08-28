-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE

);
INSERT INTO galaxies
  (name)
VALUES
  ('Milky Way'),
  ('Proxima Centauri b'),
  ('Gliese 876 b');


CREATE TABLE stars
(
  id SERIAL PRIMARY KEY,
  star_name TEXT NOT NULL UNIQUE,
  galaxy_id INT REFERENCES galaxies

);

INSERT INTO stars
  (star_name, galaxy_id)
VALUES
  ('The Sun', 1),
  ('Proxima Centauri', 2),
  ('Gliese 876', 3);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  star_id INT REFERENCES stars,
  orbital_period_in_years FLOAT NOT NULL
);
INSERT INTO planets
  (name, orbital_period_in_years, star_id)
VALUES
  ('Earth', 1.00, 1),
  ('Mars', 1.88, 1),
  ('Venus', 0.62, 1),
  ('Neptune', 164.8, 1),
  ('Proxima Centauri b', 0.03,  2),
  ('Gliese 876 b', 0.23,  3);


CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  name TEXT,
  planet_id INT REFERENCES planets
);

INSERT INTO moons
  (planet_id, name)
VALUES
  (1, 'The Moon'),
  (2, 'Phobos'),
  (2, 'Deimos'),
  (4, 'Naiad'),
  (4, 'Thalassa'),
  (4, 'Despina'),
  (4, 'Galatea'),
  (4, 'Larissa'),
  (4, 'S/2004 N 1'),
  (4, 'Proteus'),
  (4, 'Triton'),
  (4, 'Nereid'),
  (4, 'Halimede'),
  (4, 'Sao'),
  (4, 'Laomedeia'),
  (4, 'Psamathe'),
  (4, 'Neso');