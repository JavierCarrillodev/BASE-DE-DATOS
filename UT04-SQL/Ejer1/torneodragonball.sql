DROP DATABASE IF EXISTS TorneosDragonBall;
CREATE DATABASE IF NOT EXISTS TorneosDragonBall;
USE TorneosDragonBall;

CREATE TABLE IF NOT EXISTS Torneos(
id_torneo INT AUTO_INCREMENT,
nombre VARCHAR (100)NOT NULL,
ubicacion VARCHAR(100),
fecha_inicio DATE,
fecha_fin DATE NULL,
PRIMARY KEY (id_torneo)
);

CREATE TABLE IF NOT EXISTS Participante(
id_participante INT AUTO_INCREMENT,
nombre VARCHAR(100),
edad INT CHECK (edad > 18 AND edad < 150),
raza VARCHAR(30),
id_torneo INT, 
FOREIGN KEY (id_torneo)REFERENCES Torneos(id_torneo)
ON DELETE CASCADE
ON UPDATE CASCADE,
PRIMARY KEY (id_participante)
);

INSERT INTO Torneos (nombre, ubicacion, fecha_inicio)
VALUES
    ('Torneo de la Fuerza', 'Mi casa', '2025-05-12'),
    ('Torneo de la caca', 'Instituto', '2025-07-12'),
    ('Torneo Supremo', 'Casa de mi novia', '2025-09-05');

INSERT INTO Participante (nombre, edad,raza,id_torneo)
VALUES
    ('Vegeta', '21', 'Humano',1),
    ('Gohan', '27', 'Humanoide', 2),
    ('Javi', '28', 'Extraterrestre', 3);


