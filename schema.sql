CREATE DATABASE CATALOG;

CREATE TABLE IF NOT EXISTS item (
  id SERIAL PRIMARY KEY,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS label (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  color VARCHAR(100) NOT NULL,
  book_id INT,
  items INT[],
  FOREIGN KEY (book_id) REFERENCES item(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS book (
  id SERIAL PRIMARY KEY,
  publisher VARCHAR(255) NOT NULL,
  cover_state VARCHAR(25) NOT NULL,
  FOREIGN KEY (id) REFERENCES item(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS author (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  items INT[]
);

CREATE TABLE IF NOT EXISTS game (
  id SERIAL PRIMARY KEY,
  multiplayer TEXT NOT NULL,
  last_played_at DATE NOT NULL,
  item_id INT,
  FOREIGN KEY (item_id) REFERENCES item(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS genre (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  items INT[],
  FOREIGN KEY (item_id) REFERENCES item(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS musicalbum (
  id SERIAL PRIMARY KEY,
  on_spotify BOOLEAN NOT NULL,
  genre_id INT,
  FOREIGN KEY (genre_id) REFERENCES genre(id) ON DELETE CASCADE
);
