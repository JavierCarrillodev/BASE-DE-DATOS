DROP DATABASE IF EXISTS dragonConsultas;
CREATE DATABASE dragonConsultas;
USE dragonConsultas;

-- Crear la tabla Guerreros
CREATE TABLE IF NOT EXISTS Guerreros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    raza VARCHAR(20) NOT NULL,
    poder INT NOT NULL
);

-- Insertar datos en la tabla Guerreros
INSERT INTO Guerreros (nombre, raza, poder) VALUES
('Goku', 'Saiyajin', 9000),
('Vegeta', 'Saiyajin', 8500),
('Piccolo', 'Namekiano', 5000),
('Gohan', 'Saiyajin', 6000),
('Trunks', 'Saiyajin', 6000),
('Cell', 'Monstruo', 8000),
('Freezer', 'Monstruo', 10000),
('Majin Boo', 'Monstruo', 9000),
('Gotenks', 'Saiyajin', 7000),
('Yamcha', 'Humano', 5000);

-- Crear la tabla Tecnicas
CREATE TABLE IF NOT EXISTS Tecnicas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    poder INT NOT NULL,
    id_guerrero INT,
    FOREIGN KEY (id_guerrero) REFERENCES Guerreros(id)
);

-- Insertar datos en la tabla Tecnicas
INSERT INTO Tecnicas (nombre, tipo, poder, id_guerrero) VALUES
('Kamehameha', 'Ataque', 8000, 1),
('Solar Flare', 'Defensa', 6000, 1),
('Final Flash', 'Ataque', 9000, 2),
('Special Beam Cannon', 'Ataque', 7000, 3),
('Death Ball', 'Ataque', 8000, 3),
('Spirit Bomb', 'Ataque', 10000, 4),
('Big Bang Attack', 'Ataque', 7000, 5),
('Cell Jr.', 'Ataque', 5000, 6),
('Death Beam', 'Ataque', 8000, 7),
('Kamehameha', 'Ataque', 8000, 8),
('Death Ball', 'Ataque', 9000, 9),
('Kamehameha', 'Ataque', 7000, 10);

-- Mostrar las tablas creadas
SHOW TABLES;
SELECT * FROM Guerreros;
SELECT * FROM Tecnicas;


SELECT nombre,poder
FROM Guerreros
ORDER BY poder DESC
Limit 1;

/*Asi tambien vale
SELECT nombre, poder
FROM Guerreros
WHERE poder = (SELECT MAX(poder) FROM Guerreros); */

SELECT nombre, poder
FROM Guerreros
WHERE poder > (SELECT AVG(poder) FROM Guerreros);


-- Calcula el poder total de todos los guerreros Saiyajin.
SELECT raza, SUM(poder)
FROM Guerreros
GROUP BY raza
HAVING raza = 'Saiyajin';

SELECT raza, SUM(poder) AS TOTAL_PODER_RAZA
FROM Guerreros
GROUP BY raza;


SELECT raza, SUM(poder) AS TOTAL_PODER_RAZA
FROM Guerreros
GROUP BY raza
ORDER BY TOTAL_PODER_RAZA ASC;

SELECT nombre,raza, MAX(poder) AS TOTAL_PODER_RAZA
FROM Guerreros
GROUP BY nombre,raza
ORDER BY TOTAL_PODER_RAZA ASC;

SELECT g.nombre, COUNT(t.id) AS total_tecnicas
FROM Guerreros g
JOIN Tecnicas t ON g.id = t.id_guerrero
GROUP BY g.nombre
ORDER BY total_tecnicas DESC
LIMIT 1;

SELECT raza,AVG(poder)
FROM Guerreros
GROUP BY raza
HAVING raza = 'Namekiano';


SELECT g.nombre, t.nombre
FROM Guerreros g
JOIN Tecnicas t ON g.id = t.id_guerrero
where t.nombre LIKE '%Beam%';


Select UPPER(nombre)
from Guerreros
where Length(nombre) > 5 ;
