DROP DATABASE IF EXISTS custonSantos;
CREATE DATABASE custonSantos;
USE custonSantos;

CREATE TABLE coches(
mat VARCHAR(8) PRIMARY KEY,
marca VARCHAR(15),
an_fab INT CHECK ( an_fab BETWEEN 1000 AND 9999)
);


CREATE TABLE mecanicos(
dni VARCHAR(19) PRIMARY KEY,
nombre VARCHAR(15),
puesto VARCHAR(15),
parcial CHAR(1)
);


CREATE TABLE trabajos(
mat VARCHAR(8),
dni VARCHAR(19),
horas DECIMAL CHECK ( horas > 0.5),
fecha_rep DATE,
FOREIGN KEY (mat) REFERENCES coches (mat),
FOREIGN KEY (dni) REFERENCES mecanicos (dni)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE clientes(
id_cliente VARCHAR(10) PRIMARY KEY,
nombre VARCHAR(50),
telefono VARCHAR (15)
);

CREATE TABLE piezas(
id_pieza VARCHAR(10) PRIMARY KEY,
nombre VARCHAR(50),
precio DECIMAL (10,2)
);

CREATE TABLE factura(
id_factura VARCHAR(10) PRIMARY KEY,
id_cliente VARCHAR(10),
fecha_emision DATE,
total DECIMAL
);

ALTER TABLE coches ADD COLUMN modelo VARCHAR(15);

ALTER TABLE trabajos ADD CONSTRAINT PK_trabajos PRIMARY KEY (mat,dni);

ALTER TABLE trabajos ADD CONSTRAINT FK_trabajos_mecanicos FOREIGN KEY (dni) REFERENCES mecanicos (dni) 
ON DELETE CASCADE
ON UPDATE CASCADE;

-- Se puede añadir un check asi 
-- ALTER TABLE coches MODIFY COLUMN an_fab INT, ADD CONSTRAINT chk_an_fab CHECK (an_fab BETWEEN 10 AND 99);

-- O tambien asi se pude anadir el check
ALTER TABLE coches MODIFY an_fab INT CHECK ( an_fab BETWEEN 10 AND 99);

ALTER TABLE coches DROP CHECK coches_chk_1;

ALTER TABLE trabajos DROP FOREIGN KEY trabajos_ibfk_2;


SHOW CREATE TABLE coches;

-- Ver como se llaman los nombres de todos los check
SELECT CONSTRAINT_NAME
FROM information_schema.check_constraints
WHERE CONSTRAINT_SCHEMA = 'custonSantos';

ALTER TABLE coches CHANGE COLUMN marca marca_coche VARCHAR(15);

INSERT INTO coches ( mat,marca_coche,an_fab,modelo)
VALUES
       ('3424ff','nissan',25,'pepe'),
       ('4235r','BUGATTI',24,'quepasabala'),
       ('5646g','ford', 23,'wtf');

INSERT INTO mecanicos (dni, nombre, puesto, parcial)
VALUES
        ('12345678A', 'Carlos', 'Jefe', 'N'),
        ('87654321B', 'Lucía', 'Ayudante', 'S'),
        ('11223344C', 'Raúl', 'Técnico', 'N');

INSERT INTO trabajos (mat, dni, horas, fecha_rep)
VALUES
  ('3424ff', '12345678A', 2.5, '2024-06-01'),
  ('4235r', '87654321B', 1.0, '2024-06-10'),
  ('5646g', '11223344C', 3.0, '2024-07-15');


UPDATE coches
SET marca_coche = UPPER(marca_coche)
WHERE LENGTH (marca_coche) > 4;

UPDATE coches 
SET marca_coche = 'lambo'
WHERE marca_coche = 'NISSAN';


UPDATE coches
SET modelo = 'SUPER'
WHERE modelo = 'pepe';

SELECT * FROM coches;

SELECT * FROM mecanicos;


UPDATE mecanicos
SET dni = '3333333ZZZ'
WHERE dni = '11223344C';

UPDATE mecanicos
SET nombre = 'Victoria'
WHERE nombre = 'Carlos';

SELECT * FROM mecanicos;
SELECT * FROM trabajos;

SELECT COUNT(nombre) AS Nombre_Mecanico FROM mecanicos;



