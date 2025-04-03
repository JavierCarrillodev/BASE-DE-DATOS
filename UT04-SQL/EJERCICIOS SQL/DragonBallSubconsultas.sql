DROP DATABASE IF EXISTS DragonBallSubconsultas;
CREATE DATABASE DragonBallSubconsultas;
USE DragonBallSubconsultas;

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

-- 1.Encuentra el nombre y el poder del guerrero más poderoso.-
SELECT nombre,poder 
FROM Guerreros
WHERE poder = (
    SELECT MAX(poder)
    FROM Guerreros
);

-- 2. Muestra el nombre de todos los guerreros que tienen un poder superior al promedio de todos los guerreros.-
SELECT nombre, poder 
FROM Guerreros
WHERE poder > (
    SELECT AVG(poder)
    FROM Guerreros
);

-- 3.Calcula el poder total de todos los guerreros Saiyajin.-
SELECT SUM(poder) AS poder_total
FROM Guerreros
WHERE raza = 'Saiyajin';

-- 4.Calcula el poder total de cada raza de guerreros.-
SELECT raza, SUM(poder) AS poder_total
FROM Guerreros
GROUP BY raza;

-- 5.Calcula el poder total de cada raza y ordena el resultado de mayor a menor.-
SELECT raza, SUM(poder) AS poder_total
FROM Guerreros
GROUP BY raza
ORDER BY poder_total DESC;

-- 6.Muestra el poder del guerrero más poderoso de cada raza.-
SELECT G.raza, G.nombre, G.poder
FROM Guerreros G
WHERE G.poder = (
    SELECT MAX(G2.poder)
    FROM Guerreros G2
    WHERE G2.raza = G.raza
);

-- 7.Muestra el poder del guerrero más poderoso de cada raza, ordenado de mayor a menor.-
SELECT G.raza, G.nombre, G.poder
FROM Guerreros G
WHERE G.poder = (
    SELECT MAX(G2.poder)
    FROM Guerreros G2
    WHERE G2.raza = G.raza
)
    ORDER BY G.poder DESC;


-- 8.Encuentra el nombre del guerrero con mayor número de técnicas.-
SELECT NOMBRE 
FROM Guerreros
WHERE ID = (
    SELECT ID_GUERRERO
    FROM Tecnicas
    GROUP BY ID_GUERRERO
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

-- 9.Calcula el promedio de poder de los guerreros Namekianos.
SELECT AVG(PODER) AS PROMEDIO_PODER
FROM Guerreros
WHERE RAZA = 'NAMEKIANO';

-- 10.Encuentra los guerreros que tienen una técnica de ataque con “Beam” en el nombre.
SELECT NOMBRE
FROM Guerreros
WHERE id IN (
    SELECT ID_GUERRERO
    FROM Tecnicas
    WHERE tipo = 'Ataque' and nombre LIKE '%Beam%'
);

SELECT *
FROM Guerreros, Tecnicas;

SELECT * 
FROM Guerreros AS G, Tecnicas AS T
WHERE G.id = T.id_guerrero;

SELECT *
FROM Guerreros
JOIN Tecnicas 
ON Guerreros.id = Tecnicas.id_guerrero;


