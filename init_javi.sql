-- Podemos simplificar las sentencias de insert en una sola
-- Faltaria una tabla de peliculas pendientes
PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS peliculas;
DROP TABLE IF EXISTS usuarios;

CREATE TABLE IF NOT EXISTS 'peliculas'(
    'id' INTEGER NOT NULL UNIQUE,
    'titulo' TEXT NOT NULL,
    'genero' TEXT  ,
    'año' INTEGER ,
    'director' TEXT,
    PRIMARY KEY ('id' AUTOINCREMENT)
);

CREATE TABLE IF NOT EXISTS 'usuarios'(
    'id' INTEGER NOT NULL UNIQUE,
    'nombre' TEXT NOT NULL  UNIQUE,
    'peliculafav' INTEGER, 
    PRIMARY KEY ('id' AUTOINCREMENT),
    FOREIGN KEY (peliculafav) REFERENCES peliculas ('id')
);


INSERT INTO peliculas (titulo, genero, año, director) VALUES ('Jaws', 'Terror', 1975, 'Steven Spielberg');
INSERT INTO peliculas (titulo, genero, año, director) VALUES ('Spider-Man', 'Ciencia Ficción', 2002, 'Sam Raimi');
INSERT INTO peliculas (titulo, genero, año, director) VALUES ('Van Helsing', 'Fantasía Terrorifica', 2004, 'Stephen Sommers');
INSERT INTO peliculas (titulo, genero, año, director) VALUES ('Dracula Untold', 'Fantasía Terrorifica', 2015, 'Gary Shore');
INSERT INTO peliculas (titulo, genero, año, director) VALUES ('Sonic the Hedgehog 2', 'Aventura', 2022, 'Jeff Fowler');

INSERT INTO usuarios (nombre, peliculafav) VALUES 
('Usuario0', 1), 
('Usuario1', 2), 
('Usuario2', 3), 
('Usuario3', 4), 
('Usuario4', 5);
--SELECT usuarios.nombre, peliculas.nombre AS pelicula_favorita
--FROM usuarios
--JOIN usuarios.peliculafav = peliculas.id; sexo