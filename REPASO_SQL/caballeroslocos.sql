DROP DATABASE IF EXISTS caballeroslocos;
CREATE DATABASE caballeroslocos;
USE caballeroslocos;

CREATE TABLE constelaciones(
    id INT AUTO_INCREMENT,
    nombre VARCHAR(50),
    descripcion VARCHAR(500),
    PRIMARY KEY(id)
);
INSERT INTO constelaciones (nombre,descripcion)
VALUES
       ('loco','si ves esta constelacion es que estas loco'), 
       ('mago','si ves esta constelacion es que eres un mago'), 
       ('normal','si ves esta constelacion es que eres normal'); 




CREATE TABLE caballerosZodiaco(
    id INT AUTO_INCREMENT,
    nombre VARCHAR(50),
    signozodiacal VARCHAR(50),
    constelacionesID INT,
    PRIMARY KEY(id),
    FOREIGN KEY (constelacionesID) REFERENCES constelaciones (id)
);

INSERT INTO caballerosZodiaco (nombre,signozodiacal,constelacionesID)
VALUES
        ('javi','acuario',1),
        ('pepe','tauro',2),
        ('fifi','aries',3);



ALTER TABLE caballerosZodiaco CHANGE COLUMN signozodiacal Zodiaco VARCHAR(50);

ALTER TABLE constelaciones ADD COLUMN Estrella_Principal VARCHAR(50);

RENAME TABLE caballerosZodiaco TO caballeros;

ALTER TABLE caballeros MODIFY nombre VARCHAR(50) NOT NULL;

UPDATE constelaciones
SET descripcion = 'Andrómeda es una constelación del hemisferio norte, 
cerca del Polo Norte Celeste, conocida por su vínculo con la mitología griega y la galaxia de Andrómeda 
(M31), una de las más grandes y brillantes observables desde la Tierra.'
WHERE nombre = 'normal';


SELECT * FROM constelaciones; 
SELECT * FROM caballeros;
