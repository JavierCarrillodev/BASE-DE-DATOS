DROP DATABASE IF EXISTS DBZ_Ejercicio_Calculos;
CREATE DATABASE IF NOT EXISTS DBZ_Ejercicio_Calculos;
USE DBZ_Ejercicio_Calculos;

CREATE TABLE IF NOT EXISTS GUERRERO(
ID_GUERRERO INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
NOMBRE VARCHAR(50),
RAZA VARCHAR(20),
NIVEL_PODER INT,
CANTIDAD_TRANSFORMACIONES INT
);

INSERT INTO GUERRERO(NOMBRE,RAZA,NIVEL_PODER,CANTIDAD_TRANSFORMACIONES)
VALUES 
('GOKU','SAIYAN',9000,6),
('VEGETA','SAIYAN',8500,4),
('GOHAN','SAIYAN-MESTIZO',8000,4),
('PICCOLO','NAMEKIANO',7000,1),
('TRUNKS','SAIYAN',7500,2),
('FREEZER','EMPERADOR DEL MAL',10000,5),
('CELL','BIO-ANDROIDE',8500,3),
('MAJIN BUU','MAJIN',8000,3),
('GOTEN','SAIYAN',600,1),
('KRILLIN','HUMANO',500,0);

SELECT NOMBRE,NIVEL_PODER
FROM GUERRERO
WHERE NIVEL_PODER > 9000;

SELECT NOMBRE,CANTIDAD_TRANSFORMACIONES
FROM GUERRERO
WHERE CANTIDAD_TRANSFORMACIONES <= 3;


SELECT NIVEL_PODER * CANTIDAD_TRANSFORMACIONES
FROM GUERRERO;

SELECT NOMBRE,NIVEL_PODER,CANTIDAD_TRANSFORMACIONES,
    CASE
         WHEN nombre = 'Piccolo' THEN 'Orange_Piccolo'
           WHEN nombre = 'Freezer' THEN 'Black_Freezer'
           WHEN raza = 'Saiyan' AND cantidad_transformaciones > 0 THEN '¡Super Saiyan!'
           WHEN cantidad_transformaciones = 0 THEN 'Sin transformaciones'
           ELSE 'Transformado'
        END AS estado_transformacion
    FROM GUERRERO;    

    SELECT COUNT(*) AS total_guerreros
    FROM GUERRERO;

    SELECT COUNT(NIVEL_PODER) AS guerreros_con_poder
    FROM GUERRERO;

    SELECT SUM(NIVEL_PODER) AS guerreros_con_poder
    FROM GUERRERO;

    SELECT MAX(nivel_poder) AS poder_maximo
    FROM GUERRERO;

    SELECT RAZA, AVG(NIVEL_PODER) AS poder_maximo
    FROM GUERRERO
    GROUP BY RAZA;

    SELECT raza, AVG(nivel_poder) AS poder_medio
    FROM GUERRERO
    GROUP BY RAZA
    HAVING AVG(nivel_poder) > 8000;

    SELECT RAZA, COUNT(*) AS total
    FROM GUERRERO
    GROUP BY RAZA
    HAVING COUNT(*) >= 2;


    SELECT NOMBRE, NIVEL_PODER
    FROM GUERRERO
    WHERE NIVEL_PODER >= ALL (
      SELECT NIVEL_PODER
      FROM GUERRERO
      WHERE NIVEL_PODER IS NOT NULL
  );


  SELECT RAZA, poder_medio
FROM (
    SELECT RAZA, AVG(NIVEL_PODER) AS poder_medio
    FROM GUERRERO
    WHERE NIVEL_PODER IS NOT NULL
    GROUP BY RAZA
) AS promedio_por_raza
WHERE poder_medio > 8000;

SELECT nombre, nivel_poder - 
       (SELECT AVG(nivel_poder) FROM GUERRERO WHERE nivel_poder IS NOT NULL) AS poder_vs_media
FROM GUERRERO;

SELECT raza, COUNT(*) AS total
FROM GUERRERO
GROUP BY raza
HAVING COUNT(*) >= (
    SELECT COUNT(*)
    FROM GUERRERO
    WHERE raza = 'Humano'
);

SELECT nombre
FROM GUERRERO
WHERE nivel_poder > (
    SELECT MAX(poder_medio)
    FROM (
        SELECT AVG(nivel_poder) AS poder_medio
        FROM GUERRERO
        WHERE nivel_poder IS NOT NULL
        GROUP BY raza
    ) AS medias_por_raza

SELECT *
FROM Guerreros
LEFT JOIN Tecnicas
ON Guerreros.id_guerrero = tecnicas.id_guerrero;
);