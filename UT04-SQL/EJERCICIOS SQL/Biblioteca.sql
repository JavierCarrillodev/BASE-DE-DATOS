DROP DATABASE IF EXISTS Biblioteca;
CREATE DATABASE IF NOT EXISTS Biblioteca;
USE Biblioteca;

CREATE TABLE IF NOT EXISTS AUTORES(
ID_AUTOR INT AUTO_INCREMENT PRIMARY KEY,
NOMBRE VARCHAR(100) NOT NULL,
NACIONALIDAD VARCHAR(100),
FECHA_NACIMIENTO DATE
);

INSERT INTO AUTORES (NOMBRE,NACIONALIDAD,FECHA_NACIMIENTO)
VALUES   
        ('JAVIER', 'ESPANOL', '2020-02-12'),
        ('VICTORIA', 'FINLANDESA', '2006-01-25'),
        ('NEVADO', 'INGLES', '2024-02-10'),
        ('CORA', 'FRANCESA', '2021-07-05'),  
        ('FIFI', 'RUSA', '2022-07-05');    


CREATE TABLE IF NOT EXISTS LIBROS(
ID_LIBROS INT AUTO_INCREMENT PRIMARY KEY,
TITULO VARCHAR(100) NOT NULL,
GENERO VARCHAR(100),
CHECK (GENERO IN ('AMOR','TERROR','AVENTURA')),
FECHA_PUBLICACION DATE,
ID_AUTOR INT,
FOREIGN KEY (ID_AUTOR) REFERENCES AUTORES (ID_AUTOR)
);

INSERT INTO LIBROS (TITULO, GENERO, FECHA_PUBLICACION, ID_AUTOR)
VALUES 
        ('LAS AVENTURAS DE FIFI, CORA Y NEVADO', 'AVENTURA', '2025-11-12',1),
        ('LAS AVENTURAS DE JAVI Y VICTORIA', 'AMOR', '2021-11-12', 2),
        ('EL AMOR INVENCIBLE DE VICTORIA Y JAVI', 'AMOR', '2024-09-13', 3),
        ('LAS AVENTURAS DE LOLA Y VICTOR', 'TERROR', '2026-10-10', 4),
        ('LAS AVENTURAS DE JAVI, VICTORIA, NEVADO, CORA Y FIFI', 'TERROR', '2025-06-04', 5);

UPDATE AUTORES
SET 
    NACIONALIDAD = 'ALEMAN',
    NOMBRE = 'PEPE',
    FECHA_NACIMIENTO = '2022-02-01'
WHERE ID_AUTOR = 1;

SELECT TITULO, FECHA_PUBLICACION
FROM LIBROS
JOIN AUTORES ON LIBROS.ID_AUTOR = AUTORES.ID_AUTOR
WHERE FECHA_NACIMIENTO > '2021-01-01'
ORDER BY FECHA_PUBLICACION;