-- la tabla de peliculas pendientes tiene un fallo y no esta correctamente creada
-- Las sentencias de insert pueden simplificar en una sola
DROP TABLE IF EXISTS personas;
DROP TABLE IF EXISTS pelicula;

CREATE TABLE 'personas' (
    'id' INTEGER NOT NULL UNIQUE,
    'nombre' TEXT NOT NULL UNIQUE,
    'peliculaFavorita' TEXT NOT NULL,    PRIMARY KEY ('id' AUTOINCREMENT),
    FOREIGN KEY (peliculaFavorita) REFERENCES pelicula(id)
)STRICT;


CREATE TABLE 'pelicula' (
    'id' INTEGER NOT NULL UNIQUE,
    'nombrePelucla' TEXT NOT NULL,
    'genero' TEXT NOT NULL,
    'ano' INTEGER,
    'duracionEnMinutos' INTEGER,
    PRIMARY KEY ('id' AUTOINCREMENT)
)STRICT;

CREATE TABLE 'listaDePeliculaFavorita' (
    'id' INTEGER NOT NULL UNIQUE,
    'usuario' INTEGER,
    'peliculaFavorita' INTEGER,
    FOREIGN KEY ('usuario') REFERENCES 'personas' ('id'),
    FOREIGN KEY ('pelicula') REFERENCES 'pelicula' ('id')    
)STRICT;
    
INSERT INTO personas (id, nombre, peliculaFavorita) VALUES(1, 'Rico', 'Iluminados por el fuego');

INSERT INTO pelicula (id, nombrePelucla, genero, ano, duracionEnMinutos) VALUES(1, 'Iluminados por el fuego', 'historico/drama/guerra', 2005, 105);
INSERT INTO pelicula (id, nombrePelucla, genero, ano, duracionEnMinutos) VALUES(2, 'Neuilly sa mere', 'Comedia', 2009, 90);
INSERT INTO pelicula (id, nombrePelucla, genero, ano, duracionEnMinutos) VALUES(3, 'starship trooper', 'cienca ficcion militar', 1997, 129);
INSERT INTO pelicula (id, nombrePelucla, genero, ano, duracionEnMinutos) VALUES(4, 'Five Nights at Freddys', 'horror', 2023, 109);
INSERT INTO pelicula (id, nombrePelucla, genero, ano, duracionEnMinutos) VALUES(5, 'Company of Heroes', 'historico/guerra', 2013, 100);
INSERT INTO pelicula (id, nombrePelucla, genero, ano, duracionEnMinutos) VALUES(6, 'Pieles', 'comedia/drama', 2017, 77);

