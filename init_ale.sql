DROP TABLE IF EXISTS Pelis_Pendientes;
DROP TABLE IF EXISTS peliculas;
DROP TABLE IF EXISTS usuarios;
PRAGMA foreign_keys = on;

CREATE TABLE IF NOT EXISTS 'usuarios'(
  'id' INTEGER NOT NULL UNIQUE,
  'nombre' TEXT NOT NULL UNIQUE,
  'email' TEXT NOT NULL UNIQUE,
  'favPeli' INTEGER,
  PRIMARY KEY ('id' AUTOINCREMENT)
  FOREIGN KEY (favPeli) REFERENCES peliculas(id)
);--STRICT;

CREATE TABLE IF NOT EXISTS 'peliculas'(
    'titulo' TEXT NOT NULL,
    'id' INTEGER NOT NULL,
    'genero' TEXT,
    'año' INTEGER,
    'director' TEXT NOT NULL,
    --'autor' TEXT NOT NULL,
    --FOREIGN KEY ('autor') REFERENCES 'usuarios' ('id'),
 PRIMARY KEY ('id' AUTOINCREMENT)
);--STRICT;

CREATE TABLE IF NOT EXISTS 'Pelis_Pendientes'(
    'id' INTEGER NOT NULL,
    'pelicula_No_Vista' INTEGER NOT NULL,
    'usuario' INTEGER NOT NULL,
 PRIMARY KEY ('id' AUTOINCREMENT)
 FOREIGN KEY ('pelicula_No_Vista') REFERENCES 'peliculas'('id')     
 FOREIGN KEY ('usuario') REFERENCES 'usuarios'('id')
);

INSERT INTO 'usuarios' (nombre, email) VALUES 
('Pepe', 'Epep@gmail.com'),
('Alberto', 'kokointo@gmail.com'),
('Kiko', 'MegustanLosKikos@gmail.com');

INSERT INTO 'peliculas' (titulo, genero, año, director) VALUES ('Django', 'western', 2012, 'Quentin Tarantino'),
('Interstellar', 'Drama', 2014, 'Christopher Nolan'),
('El corral, una fiesta muy bestia', 'comedia', 2006, 'Steve Oedekerk'),
('El gato con botas: Los tres diablos', 'animacion', 2012, 'Raman Hui'),
('Indiana Jones y el dial del destino', 'aventuras', 2023, 'James Mangold'),
('Harry Potter y la cámara secreta', 'fantasia', 2002, 'Chris Columbus'),
('El Señor de los Anillos: las dos torres', 'fantasia', 2002, 'Peter Jackson'),
('Spider-Man', 'Ciencia Ficcion', 2002, 'Sam Raimi'),
('Iron Man', 'SuperHeroes', 2008, 'Jon Favreau'),
('El viaje de Chihiro', 'fantasia', 2001, 'Hayao Miyazaki');

INSERT INTO 'Pelis_Pendientes' (usuario, pelicula_No_Vista) VALUES 
(2,7),
(2,6),
(3,4),
(3,10);

SELECT usuarios.nombre, peliculas.titulo AS peliculasFavoritas
FROM usuarios
JOIN peliculas ON usuarios.favPeli = peliculas.id;
JOIN peliculas ON Pelis_Pendientes.pelicula_No_Vista = peliculas.id