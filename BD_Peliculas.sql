CREATE TABLE Director (
    ID_Director INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Fecha_Nacimiento DATE,
    Nacionalidad VARCHAR(100),
    Genero VARCHAR(50)
);

CREATE TABLE Pelicula (
    ID_Pelicula INT PRIMARY KEY,
    Titulo VARCHAR(255),
    Anio_Lanzamiento INT,
    Genero VARCHAR(100),
    Sinopsis TEXT,
    Director_ID INT,
    Pais_Origen VARCHAR(100),
    Duracion INT,
    Calificacion VARCHAR(10),
    Idioma VARCHAR(50),
    FOREIGN KEY (Director_ID) REFERENCES Director(ID_Director)
);

CREATE TABLE Actor (
    ID_Actor INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Fecha_Nacimiento DATE,
    Nacionalidad VARCHAR(100),
    Genero VARCHAR(50)
);

CREATE TABLE Estudio (
    ID_Estudio INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Pais VARCHAR(100),
    Anio_Fundacion INT,
    Tipo_Estudio VARCHAR(100)
);

CREATE TABLE Critico (
    ID_Critico INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Ocupacion VARCHAR(100),
    CONSTRAINT critico_chk CHECK (Ocupacion IN ('Crítico de cine', 'Periodista', 'Blogger', 'Cineasta', 'Estudiante'))
);

CREATE TABLE Critica (
    ID_Critica INT PRIMARY KEY,
    Texto_Critica TEXT,
    Puntuacion DECIMAL(3, 1),
    Fecha_Publicacion DATE,
    Fuente_Critica VARCHAR(255),
    Pelicula_ID INT,
    Critico_ID INT,
    FOREIGN KEY (Pelicula_ID) REFERENCES Pelicula(ID_Pelicula),
    FOREIGN KEY (Critico_ID) REFERENCES Critico(ID_Critico)
);

CREATE TABLE Actuacion (
    Pelicula_ID INT,
    Actor_ID INT,
    Personaje_Interpretado VARCHAR(255),
    Fecha_Inicio DATE,
    Fecha_Fin DATE,
    PRIMARY KEY (Pelicula_ID, Actor_ID),
    FOREIGN KEY (Pelicula_ID) REFERENCES Pelicula(ID_Pelicula),
    FOREIGN KEY (Actor_ID) REFERENCES Actor(ID_Actor)
);

CREATE TABLE Direccion (
    Pelicula_ID INT,
    Director_ID INT,
    Fecha_Inicio DATE,
    Fecha_Fin DATE,
    PRIMARY KEY (Pelicula_ID, Director_ID),
    FOREIGN KEY (Pelicula_ID) REFERENCES Pelicula(ID_Pelicula),
    FOREIGN KEY (Director_ID) REFERENCES Director(ID_Director)
);

CREATE TABLE RelacionPelicula (
    Pelicula_ID_1 INT,
    Pelicula_ID_2 INT,
    Tipo_Relacion VARCHAR(100),
    Descripcion TEXT,
    PRIMARY KEY (Pelicula_ID_1, Pelicula_ID_2),
    FOREIGN KEY (Pelicula_ID_1) REFERENCES Pelicula(ID_Pelicula),
    FOREIGN KEY (Pelicula_ID_2) REFERENCES Pelicula(ID_Pelicula)
);

INSERT INTO Director (ID_Director, Nombre, Fecha_Nacimiento, Nacionalidad, Genero) 
VALUES
(1, 'James Cameron', '1954-08-16', 'Canadá', 'Masculino'),
(2, 'Francis Ford Coppola', '1939-04-07', 'Estados Unidos', 'Masculino'),
(3, 'Damien Chazelle', '1985-01-19', 'Estados Unidos', 'Masculino'),
(4, 'Rob Minkoff', '1962-08-11', 'Estados Unidos', 'Masculino'),
(5, 'Peter Jackson', '1961-10-31', 'Nueva Zelanda', 'Masculino');

INSERT INTO Pelicula (ID_Pelicula, Titulo, Anio_Lanzamiento, Genero, Sinopsis, Director_ID, Pais_Origen, Duracion, Calificacion, Idioma) 
VALUES
(1, 'Titanic', 1997, 'Romance, Drama', 'Una joven aristócrata se enamora de un pobre artista a bordo del Titanic, mientras el barco se dirige hacia su destino trágico.', 1, 'Estados Unidos', 195, '8.5', 'Inglés'),
(2, 'El Padrino', 1972, 'Drama, Crimen', 'La historia de una poderosa familia de la mafia italiana en Estados Unidos.', 2, 'Estados Unidos', 175, '9.2', 'Inglés'),
(3, 'La La Land', 2016, 'Musical, Romance', 'Dos soñadores se enamoran mientras persiguen sus sueños en Los Ángeles.', 3, 'Estados Unidos', 128, '8.0', 'Inglés'),
(4, 'El Rey León', 1994, 'Animación, Aventura', 'La historia de Simba, un león que debe enfrentar su destino para reclamar su lugar como rey.', 4, 'Estados Unidos', 89, '8.5', 'Inglés'),
(5, 'El Señor de los Anillos: La Comunidad del Anillo', 2001, 'Aventura, Fantasía', 'Un hobbit y un grupo de compañeros se embarcan en una épica búsqueda para destruir un anillo maligno.', 5, 'Estados Unidos', 178, '8.8', 'Inglés');

INSERT INTO Actor (ID_Actor, Nombre, Fecha_Nacimiento, Nacionalidad, Genero) 
VALUES
(1, 'Leonardo DiCaprio', '1974-11-11', 'Estados Unidos', 'Masculino'),
(2, 'Marlon Brando', '1924-04-03', 'Estados Unidos', 'Masculino'),
(3, 'Emma Stone', '1988-11-06', 'Estados Unidos', 'Femenino'),
(4, 'Matthew Broderick', '1962-03-21', 'Estados Unidos', 'Masculino'),
(5, 'Elijah Wood', '1981-01-28', 'Estados Unidos', 'Masculino');

INSERT INTO Estudio (ID_Estudio, Nombre, Pais, Anio_Fundacion, Tipo_Estudio) 
VALUES
(1, '20th Century Studios', 'Estados Unidos', 1935, 'Estudio de cine'),
(2, 'Paramount Pictures', 'Estados Unidos', 1912, 'Estudio de cine'),
(3, 'Summit Entertainment', 'Estados Unidos', 1991, 'Estudio de cine'),
(4, 'Walt Disney Pictures', 'Estados Unidos', 1923, 'Estudio de cine'),
(5, 'New Line Cinema', 'Estados Unidos', 1967, 'Estudio de cine');

INSERT INTO Critico (ID_Critico, Nombre, Ocupacion) 
VALUES
(1, 'Juan Velasco', 'Crítico de cine'),
(2, 'Julian Burgos', 'Periodista'),
(3, 'Sebastian Silva', 'Crítico de cine'),
(4, 'Fernando Ramirez', 'Crítico de cine'),
(5, 'Esteban Arteaga', 'Periodista');

INSERT INTO Critica (ID_Critica, Texto_Critica, Puntuacion, Fecha_Publicacion, Fuente_Critica, Pelicula_ID, Critico_ID) 
VALUES
(1, 'Una obra maestra del cine moderno.', 9.0, '2023-03-15', 'IMDb', 1, 1),
(2, 'Una película épica que redefine el cine de gangsters.', 8.9, '2023-03-20', 'Rotten Tomatoes', 2, 2),
(3, 'Un espectáculo visual deslumbrante con música encantadora.', 8.2, '2023-04-05', 'Metacritic', 3, 3),
(4, 'Una de las películas animadas más queridas de todos los tiempos.', 8.7, '2023-04-10', 'IMDb', 4, 4),
(5, 'Una adaptación magistral de la obra literaria de Tolkien.', 9.0, '2023-04-15', 'Rotten Tomatoes', 5, 5);

INSERT INTO Actuacion (Pelicula_ID, Actor_ID, Personaje_Interpretado, Fecha_Inicio, Fecha_Fin) 
VALUES
(1, 1, 'Jack Dawson', '1996-01-01', '1997-12-19'),
(2, 2, 'Don Vito Corleone', '1971-06-01', NULL),
(3, 1, 'Sebastian Wilder', '2015-03-01', '2016-12-31'),
(4, 5, 'Simba (voz)', '1993-01-01', '1994-12-31'),
(5, 5, 'Frodo Bolsón', '1999-01-01', '2000-12-31');

INSERT INTO Direccion (Pelicula_ID, Director_ID, Fecha_Inicio, Fecha_Fin) 
VALUES
(1, 1, '1995-01-01', '1997-12-19'),
(2, 2, '1970-01-01', NULL),
(3, 3, '2015-01-01', '2016-12-31'),
(4, 4, '1992-01-01', '1994-12-31'),
(5, 5, '1998-01-01', '2000-12-31');

INSERT INTO RelacionPelicula (Pelicula_ID_1, Pelicula_ID_2, Tipo_Relacion, Descripcion) 
VALUES
(1, 2, 'Secuela', 'El Padrino II es la secuela de El Padrino'),
(2, 1, 'Precuela', 'El Padrino es la precuela de El Padrino II'),
(3, 5, 'Similar', 'Ambas películas tienen elementos de romance y música'),
(4, 5, 'Precuela', 'El Rey León es la precuela de El Señor de los Anillos: La Comunidad del Anillo'),
(5, 4, 'Secuela', 'El Señor de los Anillos: La Comunidad del Anillo es la secuela de El Rey León');

SELECT * FROM Director;
SELECT * FROM Pelicula;
SELECT * FROM Actor;
SELECT * FROM Estudio;
SELECT * FROM Critico;
SELECT * FROM Critica;
SELECT * FROM Actuacion;
SELECT * FROM Direccion;
SELECT * FROM RelacionPelicula;

DELETE FROM Actuacion WHERE Pelicula_ID = 3;
DELETE FROM Actuacion WHERE Pelicula_ID = 4;

INSERT INTO Actuacion (Pelicula_ID, Actor_ID, Personaje_Interpretado, Fecha_Inicio, Fecha_Fin) 
VALUES
(3, 3, 'Sebastian Wilder', '2015-03-01', '2016-12-31'),
(4, 4, 'Simba (voz)', '1993-01-01', '1994-12-31');

DELETE FROM RelacionPelicula WHERE Pelicula_ID_1 = 2 AND Pelicula_ID_2 = 1;
DELETE FROM RelacionPelicula WHERE Pelicula_ID_1 = 5 AND Pelicula_ID_2 = 4;

INSERT INTO RelacionPelicula (Pelicula_ID_1, Pelicula_ID_2, Tipo_Relacion, Descripcion) 
VALUES
(2, 1, 'Precuela', 'El Padrino es la precuela de El Padrino II'),
(5, 4, 'Secuela', 'El Señor de los Anillos: La Comunidad del Anillo es la secuela de El Rey León');

SELECT * FROM RelacionPelicula;
DROP TABLE RelacionPelicula;


CREATE TABLE RelacionPelicula (
    Pelicula_ID_1 INT,
    Pelicula_ID_2 INT,
    Tipo_Relacion VARCHAR(100),
    Descripcion TEXT,
    PRIMARY KEY (Pelicula_ID_1, Pelicula_ID_2),
    FOREIGN KEY (Pelicula_ID_1) REFERENCES Pelicula(ID_Pelicula),
    FOREIGN KEY (Pelicula_ID_2) REFERENCES Pelicula(ID_Pelicula)
);

INSERT INTO RelacionPelicula (Pelicula_ID_1, Pelicula_ID_2, Tipo_Relacion, Descripcion) 
VALUES
(1, 3, 'Similar', 'Ambas películas tienen un romance central'),
(2, 4, 'Similar', 'Ambas películas son del género de crimen y drama'),
(3, 5, 'Similar', 'Ambas películas tienen música como parte importante de la trama'),
(4, 1, 'Similar', 'Ambas películas tienen personajes que deben luchar contra sus destinos'),
(5, 2, 'Similar', 'Ambas películas presentan un viaje épico y de autodescubrimiento');
