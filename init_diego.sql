PRAGMA foreign_keys = ON;
DROP TABLE IF EXISTS peliculas_pendientes;
DROP TABLE IF EXISTS usuarios;
DROP TABLE IF EXISTS peliculas;

CREATE TABLE 'usuarios'(
    'id' INTEGER NOT NULL UNIQUE,
    'nombre' TEXT NOT NULL UNIQUE,
    'edad' INTEGER NOT NULL,
    'favorita' INTEGER,
    'pais' TEXT NOT NULL,
    PRIMARY KEY (id AUTOINCREMENT),
    FOREIGN KEY (favorita) REFERENCES peliculas(id)
);

CREATE TABLE 'peliculas'(
    'id' INTEGER NOT NULL UNIQUE,
    'nombre' TEXT NOT NULL UNIQUE,
    'año' INTEGER NOT NULL,
    'director' TEXT NOT NULL,
    PRIMARY KEY (id AUTOINCREMENT)
);

CREATE TABLE 'peliculas_pendientes'(
    'id' INTEGER NOT NULL UNIQUE,
    'id_usuario' INTEGER NOT NULL,
    'id_pelicula' INTEGER NOT NULL,
    PRIMARY KEY (id AUTOINCREMENT),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
    FOREIGN KEY (id_pelicula) REFERENCES peliculas(id)
);

INSERT INTO peliculas(nombre, año, director) VALUES 
('Cinema Paradiso', 1988, 'Giuseppe Tornatore'),
('La desconocida', 2006, 'Giuseppe Tornatore'),

('Langosta', 2015, 'Yorgos Lanthimos'),
('Canino', 2009, 'Yorgos Lanthimos'),
('Sacrificio de un ciervo sagrado', 2017, 'Yorgos Lanthimos'),
('Pobres Criaturas', 2023, 'Yorgos Lanthimos'),

('Hereditary', 2018, 'Ari Aster'),
('Midsommar', 2019, 'Ari Aster'),
('Lo extraño de los Johnson', 2011, 'Ari Aster'),
('Beau tiene miedo', 2023, 'Ari Aster'),

('El club de la lucha', 1999, 'David Fincher'),
('Perdida', 2014, 'David Fincher'),
('El curioso caso de Benjamin Button', 2008, 'David Fincher'),
('Zodiac', 2007, 'David Fincher'),

('El resplandor', 1980, 'Stanley Kubrick'),
('2001: Una odisea del espacio', 1968, 'Stanley Kubrick'),
('La naranja mecánica', 1971, 'Stanley Kubrick'),
('La chaqueta metálica', 1987, 'Stanley Kubrick'),

('El Padrino', 1972, 'Francis Ford Coppola'),
('Apocalipsis Now', 1979, 'Francis Ford Coppola'),
('La ley de la calle', 1983, 'Francis Ford Coppola'),
('La conversación', 1974, 'Francis Ford Coppola'),

('El club de los poetas muertos', 1989, 'Peter Weir'),
('La sociedad de los poetas muertos', 1989, 'Peter Weir'),
('El show de Truman', 1998, 'Peter Weir'),
('Master and Commander: Al otro lado del mundo', 2003, 'Peter Weir'),

('El silencio de los corderos', 1991, 'Jonathan Demme'),
('Philadelphia', 1993, 'Jonathan Demme'),
('Algo salvaje', 1986, 'Jonathan Demme'),
('Casada con todos', 1988, 'Jonathan Demme'),

('El gran Lebowski', 1998, 'Hermanos Coen'),
('Fargo', 1996, 'Hermanos Coen'),
('No es país para viejos', 2007, 'Hermanos Coen'),
('Quemar después de leer', 2008, 'Hermanos Coen'),

('El viaje de Chihiro', 2001, 'Hayao Miyazaki'),
('Mi vecino Totoro', 1988, 'Hayao Miyazaki'),
('El castillo ambulante', 2004, 'Hayao Miyazaki'),
('Nausicaä del valle del viento', 1984, 'Hayao Miyazaki'),

('Almuerzo al desnudo', 1991, 'David Cronenberg'),
('Scanners', 1981, 'David Cronenberg'),
('Crash', 1996, 'David Cronenberg'),
('Videodrome', 1983, 'David Cronenberg'),
('La mosca', 1986, 'David Cronenberg');

INSERT INTO usuarios(nombre, edad, favorita, pais) VALUES 
('admin', 33, 8, 'España'),
('firulai', 21, 12, 'Francia'),
('bob', 28, 4, 'Estonia'),
('manolo12937', 22, 10, 'España'),
('notanuser84', 42, 5, 'España'),
('nice_g', 20, 4, 'Londres'),
('nicewifi', 23, 11, 'Italia'),
('foobar1234', 23, 4, 'Francia');

INSERT INTO peliculas_pendientes(id_usuario, id_pelicula) VALUES 
(1, 10),
(2, 1),
(3, 13),
(4, 8),
(5, 2),
(6, 3),
(7, 6),
(8, 5);

SELECT usuarios.nombre, peliculas.nombre AS pelicula_favorita --nombres de las columnas
FROM usuarios -- tabla principal de la que se obtienen los datos
JOIN peliculas ON usuarios.favorita = peliculas.id; -- union de las tablas y condicion de union
