-- Eliminar la base de datos si ya existe y crearla nuevamente
DROP DATABASE IF EXISTS DBZ;
CREATE DATABASE DBZ;
USE DBZ;

-- Crear la tabla guerreros_z
CREATE TABLE guerreros_z (
    id_guerrero INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    raza VARCHAR(50) NOT NULL,
    nivel_poder INT NULL -- Permitir NULL en nivel_poder para Yamcha
);

-- Insertar datos en guerreros_z
INSERT INTO guerreros_z (id_guerrero, nombre, raza, nivel_poder) VALUES
(1, 'Goku', 'Saiyan', 9500),
(2, 'Vegeta', 'Saiyan', 9200),
(3, 'Gohan', 'Saiyan-mestizo', 8700),
(4, 'Piccolo', 'Namek', 7500),
(5, 'Krilin', 'Humano', 4000),
(6, 'Yamcha', 'Humano', NULL);

-- Crear la tabla tecnicas con clave foránea hacia guerreros_z
CREATE TABLE tecnicas (
    id_tecnica INT PRIMARY KEY,
    nombre_tecnica VARCHAR(50) NOT NULL,
    id_guerrero INT,
    FOREIGN KEY (id_guerrero) REFERENCES guerreros_z(id_guerrero) ON DELETE CASCADE
);

-- Insertar datos en tecnicas
INSERT INTO tecnicas (id_tecnica, nombre_tecnica, id_guerrero) VALUES
(1, 'Kamehameha', 1),
(2, 'Genki-Dama', 1),
(3, 'Final Flash', 2),
(4, 'Big Bang Attack', 2),
(5, 'Masenko', 3),
(6, 'Makankosappo', 4),
(7, 'Destructo Disc', 5);

-- Mostrar datos insertados
SELECT * FROM guerreros_z;
SELECT * FROM tecnicas;


-- Si hacemos esto, es similar a un cross join
SELECT *
FROM guerreros_z, tecnicas;

-- Ahora le decimos que lo muestre solo si coincide con id_guerrero
SELECT *
FROM guerreros_z, tecnicas
WHERE guerreros_z.id_guerrero = tecnicas.id_guerrero;

-- Esta sería la forma elegante
SELECT *
FROM guerreros_z
JOIN tecnicas 
ON guerreros_z.id_guerrero = tecnicas.id_guerrero;

-- Si se nos olvida el on, sería como hacer un cross join
SELECT *
FROM guerreros_z
JOIN tecnicas;


-- Left Join
SELECT *
FROM guerreros_z
LEFT JOIN tecnicas
ON guerreros_z.id_guerrero = tecnicas.id_guerrero;

-- Left Join, solo me quedo con los null
SELECT *
FROM guerreros_z
LEFT JOIN tecnicas
ON guerreros_z.id_guerrero = tecnicas.id_guerrero;

-- Right Join
SELECT *
FROM guerreros_z
RIGHT JOIN tecnicas
ON guerreros_z.id_guerrero = tecnicas.id_guerrero;

-- Insertamos datos
INSERT INTO tecnicas (id_tecnica, nombre_tecnica, id_guerrero)
VALUES (8, 'Kaio-Ken Fantasma', NULL);

-- Right Join para comprobar que todo sale null
SELECT *
FROM guerreros_z
RIGHT JOIN tecnicas
ON guerreros_z.id_guerrero = tecnicas.id_guerrero;

SELECT *
FROM guerreros_z
LEFT JOIN tecnicas ON guerreros_z.id_guerrero = tecnicas.id_guerrero
UNION
SELECT *
FROM guerreros_z
RIGHT JOIN tecnicas ON guerreros_z.id_guerrero = tecnicas.id_guerrero;
