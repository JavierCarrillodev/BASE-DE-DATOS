DROP DATABASE IF EXISTS Caballeros_del_Zodiaco;
CREATE DATABASE IF NOT EXISTS Caballeros_del_Zodiaco;
USE Caballeros_del_Zodiaco;

CREATE TABLE IF NOT EXISTS Constelaciones (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Descripcion TEXT
);

CREATE TABLE IF NOT EXISTS Caballeros_del_Zodiaco(
ID INT AUTO_INCREMENT,
Nombre VARCHAR (100) NOT NULL,
SignoZodiacal VARCHAR (50) NOT NULL,
ConstelacionID INT,
PRIMARY KEY (ID),
FOREIGN KEY (ConstelacionID) REFERENCES Constelaciones(ID)
);

INSERT Constelaciones(Nombre,Descripcion)
VALUES
('Sagitario', 'Son malos'),
('Dragón', 'Son buenos'),
('Cisne', 'cacas'),
('Andromeda', 'Son regular'),
('Fenix', 'Locura');

INSERT INTO Caballeros_del_Zodiaco (Nombre, SignoZodiacal, ConstelacionID)
VALUES 
    ('Seiya', 'Sagitario', 1),
    ('Shiryu', 'Dragón', 2),
    ('Hyoga', 'Cisne', 3),
    ('Shun', 'Andrómeda', 4),
    ('Ikki', 'Fénix', 5);

UPDATE Constelaciones
SET Descripcion = 'Andrómeda es una constelación del hemisferio norte, cerca del Polo Norte Celeste, conocida por su vínculo con la mitología griega y la galaxia de Andrómeda (M31),
 una de las más grandes y brillantes observables desde la Tierra.'
WHERE Nombre = 'Andrómeda';


