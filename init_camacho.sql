DROP TABLE IF EXISTS peliculasPendientes;
DROP TABLE IF EXISTS peliculas;
DROP TABLE IF EXISTS usuarios;
PRAGMA foreign_keys = ON;


CREATE TABLE IF NOT EXISTS usuarios(
    'id' INTEGER NOT NULL UNIQUE,
    'nombre' TEXT NOT NULL UNIQUE,
    'peliculafav' INTEGER,
    PRIMARY KEY ('id' AUTOINCREMENT),
    FOREIGN KEY (peliculafav) REFERENCES peliculas (id)
);

CREATE TABLE IF NOT EXISTS peliculas(
    'id' INTEGER NOT NULL  ,
    'titulo' TEXT NOT NULL ,
    'genero' TEXT,
    'año' INTEGER NOT NULL,
    'director' TEXT NOT NULL,
    PRIMARY KEY ('id' AUTOINCREMENT)
);  

CREATE TABLE IF NOT EXISTS peliculasPendientes(
    'id' INTEGER PRIMARY KEY AUTOINCREMENT,
    'user' INTEGER,
    'movie' INTEGER,
    FOREIGN KEY ('user') REFERENCES usuarios('id'),
    FOREIGN KEY ('movie') REFERENCES peliculas('id')
);

INSERT INTO 'peliculas' (id, titulo, genero, año, director) VALUES 
(1, 'The Matrix', 'Ciencia Ficción', 1999, 'The Wachowskis'), --no hace falta añadir el id!
(2, 'Inception', 'Ciencia Ficción', 2010, 'Christopher Nolan'),
(3, 'The Shawshank Redemption', 'Drama', 1994, 'Frank Darabont'),
(4, 'The Godfather', 'Drama', 1972, 'Francis Ford Coppola'),
(5, 'Forrest Gump', 'Drama', 1994, 'Robert Zemeckis'),
(6, 'Interstellar', 'Ciencia Ficción', 2014, 'Christopher Nolan'),
(7, 'The Dark Knight', 'Acción', 2008, 'Christopher Nolan'),
(8, 'Pulp Fiction', 'Crimen', 1994, 'Quentin Tarantino'),
(9, 'The Lord of the Rings: The Fellowship of the Ring', 'Fantasía', 2001, 'Peter Jackson'),
(10, 'The Avengers', 'Acción', 2012, 'Joss Whedon'),
(11, 'The Dark Knight Rises', 'Acción', 2012, 'Christopher Nolan'),
(12, 'The Silence of the Lambs', 'Crimen', 1991, 'Jonathan Demme'),
(13, 'Gladiator', 'Acción', 2000, 'Ridley Scott'),
(14, 'Inglourious Basterds', 'Bélico', 2009, 'Quentin Tarantino'),
(15, 'The Departed', 'Crimen', 2006, 'Martin Scorsese'),
(16, 'The Prestige', 'Drama', 2006, 'Christopher Nolan'),
(17, 'Titanic', 'Romance', 1997, 'James Cameron'),
(18, 'The Lion King', 'Animación', 1994, 'Roger Allers'),
(19, 'Avatar', 'Ciencia Ficción', 2009, 'James Cameron'),
(20, 'Jurassic Park', 'Aventura', 1993, 'Steven Spielberg'),
(21, 'The Green Mile', 'Drama', 1999, 'Frank Darabont'),
(22, 'Goodfellas', 'Crimen', 1990, 'Martin Scorsese'),
(23, 'The Matrix Reloaded', 'Ciencia Ficción', 2003, 'The Wachowskis'),
(24, 'The Matrix Revolutions', 'Ciencia Ficción', 2003, 'The Wachowskis'),
(25, 'Django Unchained', 'Western', 2012, 'Quentin Tarantino'),
(26, 'Fight Club', 'Drama', 1999, 'David Fincher'),
(27, 'The Sixth Sense', 'Drama', 1999, 'M. Night Shyamalan'),
(28, 'The Social Network', 'Drama', 2010, 'David Fincher'),
(29, 'The Revenant', 'Aventura', 2015, 'Alejandro González Iñárritu'),
(30, 'Saving Private Ryan', 'Bélico', 1998, 'Steven Spielberg');


INSERT INTO 'usuarios' (nombre, peliculafav) VALUES 
('Usuario1', 1),
('Usuario2', 7),
('Usuario3', 2),
('Usuario4', 1),
('Usuario5', 19),
('Usuario6', 25),
('Usuario7', 8),
('Usuario8', 18),
('Usuario9', 14),
('Usuario10', 16),
('Usuario11', 17),
('Usuario12', 20),
('Usuario13', 28),
('Usuario14', 20),
('Usuario15', 21),
('Usuario16', 22),
('Usuario17', 23),
('Usuario18', 24),
('Usuario19', 25),
('Usuario20', 26),
('Usuario21', 27),
('Usuario22', 29),
('Usuario23', 30),
('Usuario24', 30),
('Usuario25', 11),
('Usuario26', 12),
('Usuario27', 13),
('Usuario28', 5),
('Usuario29', 6),
('Usuario30', 4);




INSERT INTO peliculasPendientes (user, movie) VALUES
(1, 2), -- Usuario1 tiene la película "Inception" pendiente
(3, 4); -- Usuario3 tiene la película "The Godfather" pendiente


SELECT usuarios.nombre, peliculas.titulo AS pelicula_pendiente
FROM usuarios
JOIN peliculasPendientes ON usuarios.id = peliculasPendientes.user
JOIN peliculas ON peliculasPendientes.movie = peliculas.id;





--SELECT usuarios.nombre, peliculas.titulo AS peliculafav
--FROM usuarios
--JOIN peliculas ON usuarios.peliculafav = peliculas.id;