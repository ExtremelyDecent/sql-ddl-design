-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  producer_names TEXT[] NOT NULL
);

INSERT INTO producers
  (producer_names)
VALUES
  ('{"Dust Brothers", "Stephen Lironi"}'),
  ('{"Roy Thomas Baker"}'),
  ('{"Walter Afanasieff"}'),
  ('{"Benjamin Rice"}'),
  ('{"Rick Parashar"}'),
  ('{"Al Shux"}'),
  ('{"Max Martin", "Cirkut"}'),
  ('{"Shellback", "Benny Blanco"}'),
  ('{"The Matrix"}'),
  ('{"Darkchild"}');

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  name TEXT[] NOT NULL UNIQUE
);

INSERT INTO artists
  (name)
VALUES
  ('{"Hanson"}'),
  ('{"Queen"}'),
  ('{"Mariah Cary", "Boyz II Men"}'),
  ('{"Lady Gaga", "Bradley Cooper"}'),
  ('{"Nickelback"}'),
  ('{"Jay Z", "Alicia Keys"}'),
  ('{"Katy Perry", "Juicy J"}'),
  ('{"Maroon 5", "Christina Aguilera"}'),
  ('{"Avril Lavigne"}'),
  ('{"Destiny''s Child"}');

CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  album_name TEXT NOT NULL,
  release_date DATE NOT NULL,
  artists_id INT REFERENCES artists

);

INSERT INTO albums
  (release_date, artists_id, album_name)
VALUES
  ('04-15-1997', 1, 'Middle of Nowhere'),
  ('10-31-1975', 2, 'A Night at the Opera'),
  ('11-14-1995', 3, 'Daydream'),
  ('09-27-2018', 4, 'A Star Is Born'),
  ('08-21-2001', 5, 'Silver Side Up'),
  ('10-20-2009', 6, 'The Blueprint 3'),
  ('12-17-2013', 7, 'Prism'),
  ('06-21-2011', 8, 'Hands All Over'),
  ('05-14-2002', 9, 'Let Go'),
  ('11-07-1999', 10, 'The Writing''s on the Wall');

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  artists_id INT REFERENCES artists,
  album_id INT REFERENCES albums,
  producer_id INT REFERENCES producers
);




INSERT INTO songs
  (title, duration_in_seconds, artists_id, album_id, producer_id)
VALUES
  ('MMMBop', 238, 1, 1, 1),
  ('Bohemian Rhapsody', 355, 2, 2, 2),
  ('One Sweet Day', 282, 3, 3, 3),
  ('Shallow', 216, 4, 4, 4),
  ('How You Remind Me', 223, 5, 5, 5),
  ('New York State of Mind', 276, 6, 6, 6),
  ('Dark Horse', 215, 7, 7, 7),
  ('Moves Like Jagger', 201, 8, 8, 8),
  ('Complicated', 244, 9, 9, 9),
  ('Say My Name', 240, 10, 10, 10);
