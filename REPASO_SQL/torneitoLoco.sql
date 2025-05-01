DROP DATABASE IF EXISTS torneitoLoco;
CREATE DATABASE torneitoLoco;
USE torneitoLoco;

CREATE TABLE TORNEOS(
    id_torneo INT AUTO_INCREMENT,
    nombre VARCHAR (100) UNIQUE,
    ubicacion VARCHAR (100),
    fecha_inicio DATE,
    fecha_fin DATE NULL,
    PRIMARY KEY (id_torneo) 
);

CREATE TABLE PARTICIPANTES(
    id_participantes INT AUTO_INCREMENT,
    nombre VARCHAR (100),
    edad INT CHECK (edad > 18 AND edad < 150),
    raza VARCHAR (30),
    id_torneo INT,
    PRIMARY KEY (id_participantes),
    FOREIGN KEY (id_torneo) REFERENCES TORNEOS (id_torneo)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

INSERT INTO TORNEOS (nombre,ubicacion,fecha_inicio,fecha_fin)
VALUES  
        ('Tenis','Casa de Victoria','2024-05-12','2024-06-12'),
        ('Futbol','Mi casa','2024-06-13','2024-07-13'),
        ('Baloncesto','Casa Oscar','2024-07-14','2024-08-14');

INSERT INTO PARTICIPANTES(nombre,edad,raza,id_torneo)
VALUES
        ('Juan',19,'Humano',1),
        ('Maria',21,'Reptil',2),
        ('Carlos',24,'Humano',3);
    



UPDATE TORNEOS
SET ubicacion = UPPER(ubicacion)
WHERE ubicacion = 'Mi casa';

UPDATE TORNEOS
SET nombre = UPPER(nombre);

UPDATE TORNEOS
SET nombre = 'Sexo'
WHERE id_torneo = 1;

ALTER TABLE TORNEOS ADD COLUMN GANADOR VARCHAR(50);

DELETE FROM TORNEOS WHERE id_torneo = 1;



SELECT * FROM TORNEOS;
SELECT * FROM PARTICIPANTES;