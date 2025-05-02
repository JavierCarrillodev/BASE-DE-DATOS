DROP DATABASE IF EXISTS PUBS;
CREATE DATABASE PUBS;
USE PUBS;

CREATE TABLE empleado(
dni_empleado VARCHAR(20) PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
domicilio VARCHAR(50)
);

INSERT INTO empleado(dni_empleado,nombre,domicilio)
VALUES 
        ('22342A','javi','calle pena'),
        ('53454B','pepe','calle ana'),
        ('766757E','jose','calle rocio');

CREATE TABLE localidad(
cod_localidad INT AUTO_INCREMENT,
nombre VARCHAR(30) NOT NULL,
PRIMARY KEY(cod_localidad)
);

INSERT INTO localidad(nombre)
VALUES 
        ('cordoba'),
        ('sevilla'),
        ('madrid');


CREATE TABLE pub(
cod_pub VARCHAR(20),
nombre VARCHAR(50) NOT NULL,
licencia_fiscal VARCHAR(50) NOT NULL,
domicilio VARCHAR(50),
fecha_apertura DATE NOT NULL,
horario VARCHAR(20) CHECK (horario IN ('hor1','hor2','hor3')) NOT NULL,
cod_localidad INT NOT NULL,
PRIMARY KEY (cod_pub),
FOREIGN KEY (cod_localidad) REFERENCES localidad (cod_localidad)
);

INSERT INTO pub(cod_pub,nombre,licencia_fiscal,domicilio,fecha_apertura,horario,cod_localidad)
VALUES
        ('12345','casilla','licenciado','casa alberto','2025-12-12','hor1',1),
        ('213456','porteria','lincen','piso pedro','2026-01-12','hor2',2),
        ('312345','gol','certificado','casa ana','2026-12-12','hor3',3);

CREATE TABLE pub_empleado(
cod_pub VARCHAR(20),
dni_empleado VARCHAR(20),
funcion VARCHAR(50) CHECK (funcion IN('camarero','limpieza','seguridad')),
PRIMARY KEY(cod_pub,dni_empleado),
FOREIGN KEY (dni_empleado) REFERENCES empleado (dni_empleado)
);

INSERT INTO pub_empleado(cod_pub,dni_empleado,funcion)
VALUES 
        (1234,'22342A','camarero'),
        (3456,'53454B','limpieza'),
        (2345,'766757E','seguridad');

CREATE TABLE existencias(
cod_articulo VARCHAR(20),
nombre VARCHAR (50) NOT NULL,
cantidad INT NOT NULL,
precio INT CHECK (precio > 0),
cod_pub VARCHAR(20) NOT NULL,
PRIMARY KEY(cod_articulo),
FOREIGN KEY (cod_pub) REFERENCES pub (cod_pub)
);

INSERT INTO existencias(cod_articulo,nombre,cantidad,precio,cod_pub)
VALUES 
        ('shein','camiseta',2,20,'12345'),
        ('hm','pantalon',5,50,'213456'),
        ('zara','top',1,30,'12345');


CREATE TABLE titular(
dni_titular VARCHAR(20),
nombre VARCHAR(50) NOT NULL,
domicilio VARCHAR(50),
cod_pub VARCHAR(20) NOT NULL,
PRIMARY KEY(dni_titular),
FOREIGN KEY (cod_pub) REFERENCES pub (cod_pub)
);

INSERT INTO titular(dni_titular,nombre,domicilio,cod_pub)
VALUES 
        ('534534H','javi','avenida santa ana','12345'),
        ('342465Y','pedro','calle ciguela','12345'),
        ('234894J','carmen','casa alma','312345');


SELECT * FROM empleado;

SELECT * FROM localidad;

SELECT * FROM pub;

SELECT * FROM pub_empleado;

SELECT * FROM existencias;

SELECT * FROM titular;