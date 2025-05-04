DROP DATABASE IF EXISTS dbzCalculos;
CREATE DATABASE dbzCalculos;
USE dbzCalculos;

CREATE TABLE guerreros(
id_guerrero INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50),
raza VARCHAR(50),
nivel_poder INT,
cantidad_transformaciones INT
);

INSERT INTO guerreros(nombre,raza,nivel_poder,cantidad_transformaciones)
VALUES
        ( 'Goku', 'Saiyan', 9500, 6),
        ( 'Vegeta', 'Saiyan', 9200, 4),
        ( 'Gohan', 'Saiyan', 8700, 4),
        ( 'Piccolo', 'Namekiano', 7500, 1),
        ( 'Trunks', 'Saiyan', 8600, 2),
        ( 'Freezer', 'Emperador del Mal', 9400, 5),
        ( 'Cell', 'Bio-Androide', 9100, 3),
        ( 'Majin Buu', 'Majin', 9300, 3),
        ( 'Goten', 'Saiyan', 8200, 1),
        ( 'Krilin', 'Humano', 4000, 0);

SELECT * FROM guerreros;

SELECT nombre, nivel_poder 
FROM guerreros
WHERE nivel_poder > 9000;

SELECT nombre, cantidad_transformaciones
FROM guerreros
WHERE cantidad_transformaciones <= 3;


SELECT nivel_poder * cantidad_transformaciones AS PODER_TOTAL
FROM guerreros;

SELECT nombre, nivel_poder, cantidad_transformaciones,

CASE 

        WHEN cantidad_transformaciones > 0 AND raza = 'Saiyan' THEN '¡Super Saiyan!'
        WHEN cantidad_transformaciones = 0 THEN 'Sin Transformaciones'
        WHEN nombre = 'Piccolo' THEN 'Orange_Piccolo'
        WHEN nombre = 'Freezer' THEN 'Black_Freezer'
        WHEN length(nombre) > 4 THEN 'Grande'
        ELSE 'Transformado'
    END AS estado_transformacion
FROM guerreros;