--Activar foreign_keys
PRAGMA foreign_keys = ON;

--Reinicio/Borrar tablas por si existen
DROP TABLE IF EXISTS whitelist;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS movies;

CREATE TABLE IF NOT EXISTS movies (
    'id' INTEGER PRIMARY KEY AUTOINCREMENT,
    'title' TEXT NOT NULL UNIQUE,
    'genre' TEXT NOT NULL,
    'age' INTEGER NOT NULL,
    'director' TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS users (
    'id' INTEGER PRIMARY KEY AUTOINCREMENT,
    'user_name' TEXT NOT NULL,
    'fav_movie' INTEGER,
    FOREIGN KEY ('fav_movie') REFERENCES movies('id')
);

CREATE TABLE IF NOT EXISTS whitelist(
    'id' INTEGER PRIMARY KEY AUTOINCREMENT,
    'user' INTEGER,
    'movie' INTEGER,
    FOREIGN KEY ('user') REFERENCES users('id'),
    FOREIGN KEY ('movie') REFERENCES movies('id')
);

INSERT INTO movies(title, genre, age, director) VALUES 
('Baaria', 'Comedia', 2009, 'Giuseppe Tornatore'),
('Suzume', 'Aventura', 2022, 'Makoto Shinkai'),
('La Naranja Mecánica', 'Crimen', 1975, 'Stanley Kubrick'),
('Midsommar', 'Terror', 2019, 'Ari Aster'),
('El padrino', 'Crimen', 1972, 'Francis Ford Coppola'),
('Cinema Paradiso', 'Drama', 1988, 'Giuseppe Tornatore'),
('Indiana Jones (Raiders of the Lost Ark)', 'Aventura', 1981, 'Steven Spielberg'),
('Indiana Jones and the Temple of Doom', 'Aventura', 1984, 'Steven Spielberg'),
('Tiburón', 'Suspenso', 1975, 'Steven Spielberg'),
('Parque Jurásico', 'Ciencia Ficción', 1993, 'Steven Spielberg'),
('Hereditary', 'Terror', 2018, 'Ari Aster'),
('Training Day', 'Suspenso', 2001, 'Antoine Fuqua');

INSERT INTO users(user_name, fav_movie) VALUES 
('Alvaro', 1),
('Violeta', 10),
('Lucas', 8),
('Alex', 7),
('Irene', 3);

INSERT INTO whitelist(user, movie) VALUES
(1,1),
(2,6);
/*
--Actualizar los usuarios
UPDATE users
SET user_name='Javi', fav_movie=5
WHERE id = 1;  

--Borrar usuarios
--Fallo en esta línea!!
DELETE FROM users WHERE id = 1;

--SELECT users.user_name, movies.title AS pelicula_favorita
--FROM users
--JOIN movies ON users.fav_movie = movies.id;

-- Consulta de usuarios y películas pendientes
SELECT users.user_name, movies.title AS pelicula_pendiente
FROM users
JOIN whitelist ON users.id = whitelist.user
JOIN movies ON whitelist.movie = movies.id;
*/