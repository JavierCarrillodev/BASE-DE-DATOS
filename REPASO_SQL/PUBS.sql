DROP DATABASE IF EXISTS PUBS;
CREATE DATABASE PUBS;
USE PUBS;

CREATE TABLE empleado(
dni_empleado VARCHAR(20) PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
domicilio VARCHAR(50)

);

CREATE TABLE localidad(
cod_localidad INT AUTO_INCREMENT,
nombre VARCHAR(30) NOT NULL,
PRIMARY KEY(cod_localidad)
);

CREATE TABLE pub(
cod_pub INT AUTO_INCREMENT,
nombre VARCHAR(50) NOT NULL,
licencia_fiscal VARCHAR(50) NOT NULL,
domicilio VARCHAR(50),
fecha_apertura DATE NOT NULL,
horario VARCHAR(20) CHECK (horario IN ('hor1','hor2','hor3')) NOT NULL,
cod_localidad INT NOT NULL,
PRIMARY KEY (cod_pub),
FOREIGN KEY (cod_localidad) REFERENCES localidad (cod_localidad)
);

CREATE TABLE pub_empleado(
cod_pub INT AUTO_INCREMENT,
dni_empleado VARCHAR(20) NOT NULL,
funcion VARCHAR(50) CHECK (funcion IN('camarero','limpieza','seguridad')) NOT NULL,
PRIMARY KEY(cod_pub,dni_empleado),
FOREIGN KEY (dni_empleado) REFERENCES empleado (dni_empleado)
);

CREATE TABLE existencias(
cod_articulo INT AUTO_INCREMENT,
nombre VARCHAR (50) NOT NULL,
cantidad INT NOT NULL,
precio INT CHECK (precio = 0)NOT NULL,
cod_pub INT NOT NULL,
PRIMARY KEY(cod_articulo),
FOREIGN KEY (cod_pub) REFERENCES pub (cod_pub)
);

CREATE TABLE titular(
dni_titular VARCHAR(20),
nombre VARCHAR(50) NOT NULL,
domicilio VARCHAR(50),
cod_pub INT NOT NULL,
PRIMARY KEY(dni_titular),
FOREIGN KEY (cod_pub) REFERENCES pub (cod_pub)
);


