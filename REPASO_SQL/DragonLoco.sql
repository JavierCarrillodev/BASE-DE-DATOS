DROP DATABASE IF EXISTS DragonLoco;
CREATE DATABASE DragonLoco;
USE DragonLoco;

CREATE TABLE IF NOT EXISTS Personajes (
id INT AUTO_INCREMENT,
nombre VARCHAR (50) NOT NULL,
raza VARCHAR(50),
nivel_poder INT DEFAULT,
PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Guerreros (
id INT AUTO_INCREMENT,
nombre VARCHAR(50) NOT NULL,
raza VARCHAR(50),
poder INT,
PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Peleas(
id INT AUTO_INCREMENT,
fecha DATE NOT NULL,
lugar VARCHAR(100),
id_guerrero INT,
resultado VARCHAR(20),
PRIMARY KEY(id),
FOREIGN KEY(id_guerrero) REFERENCES Guerreros (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

ALTER TABLE Guerreros
ADD nivel INT DEFAULT 1;

ALTER TABLE Personajes
MODIFY COLUMN nivel_poder DECIMAL(10,2);

ALTER TABLE Personajes
CHANGE COLUMN raza especie VARCHAR(50);

ALTER TABLE Guerreros 
DROP COLUMN nivel;

INSERT INTO Guerreros(nombre,raza,poder)
VALUES
    ('Goku','Saiyan',9000),
    ('Vegeta','Saiyan',8500),
    ('Piccolo','Namekiano',6000),
    ('Gohan','Saiyajin',6000),
    ('Frieza','Mutante',10000);

    INSERT INTO Guerreros(nombre,raza)
    VALUES
            ('Krilin','Humano');
        

-- Se le pone un alias que es (g) y luego en FROM hay que 
-- llamar al nombre de la tabla y al alias
Select g.nombre AS guerrero, g.raza AS especie
FROM Guerreros AS g;


UPDATE Guerreros
SET poder = 9800
WHERE nombre = 'Goku';


UPDATE Guerreros
SET raza = 'Saiyan Mestizo', poder = 8500
WHERE nombre = 'Gohan';

UPDATE Guerreros
SET poder = poder + 100
WHERE raza = 'Saiyan';


UPDATE Guerreros
SET nombre = UPPER(nombre)
WHERE LENGTH(nombre) < 6;

UPDATE Guerreros
SET raza = LOWER(raza);


-- DELETE FROM Guerreros
-- WHERE poder < 9000; 

BEGIN;
UPDATE Guerreros 
SET poder = poder + 500
WHERE nombre = 'Vegeta';
INSERT INTO Guerreros (poder) VALUES ('Aumentado poder de Vegeta');
COMMIT;




select * from Guerreros;




