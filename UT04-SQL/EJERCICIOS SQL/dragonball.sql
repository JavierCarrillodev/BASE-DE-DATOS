DROP DATABASE IF EXISTS dragonball;
CREATE DATABASE dragonball;
USE dragonball;

CREATE TABLE guerreros (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    raza VARCHAR(50),
    nivel_poder INT
);

CREATE TABLE tecnicas (
    id INT PRIMARY KEY,
    nombre_tecnica VARCHAR(50),
    descripcion TEXT
);

CREATE TABLE guerrero_tecnica (
    id INT PRIMARY KEY,
    id_guerrero INT,
    id_tecnica INT,
    FOREIGN KEY (id_guerrero) REFERENCES guerreros(id),
    FOREIGN KEY (id_tecnica) REFERENCES tecnicas(id)
);

-- Datos iniciales
INSERT INTO guerreros (id, nombre, raza, nivel_poder) VALUES
(1, 'Goku', 'Saiyan', 9000),
(2, 'Vegeta', 'Saiyan', 8500),
(3, 'Piccolo', 'Namekiano', 7000);

INSERT INTO tecnicas (id, nombre_tecnica, descripcion) VALUES
(1, 'Kamehameha', 'Onda de energía concentrada'),
(2, 'Final Flash', 'Explosión de energía de Vegeta'),
(3, 'Makankosappo', 'Ataque perforante de Piccolo');

INSERT INTO guerrero_tecnica (id, id_guerrero, id_tecnica) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

INSERT INTO guerreros VALUES (4,"Gohan","Saiyan-Humano",7500);

UPDATE guerreros
SET nivel_poder = 9500
WHERE nombre = "Vegeta";

INSERT INTO tecnicas VALUES(4, "Masenko","Onda de energía disparada por Gohan");

INSERT INTO guerrero_tecnica VALUES(4,4,4);