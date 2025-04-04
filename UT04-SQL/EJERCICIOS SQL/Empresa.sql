DROP DATABASE IF EXISTS Empresa;
CREATE DATABASE IF NOT EXISTS Empresa;
USE Empresa;

CREATE TABLE IF NOT EXISTS EMPLEADOS(
DNI VARCHAR(9) PRIMARY KEY,
NOMBRE VARCHAR(50),
PUESTO VARCHAR(30),
SALARIO DECIMAL(10,2) CHECK (SALARIO > 1000),
FECHA_INGRESO DATE CHECK (FECHA_INGRESO > '2000-01-01')
);

INSERT INTO EMPLEADOS(DNI,NOMBRE,PUESTO,SALARIO,FECHA_INGRESO)
VALUES 
('123456789', 'Juan Pérez', 'Gerente', 3500.00, '2015-06-01'),
('987654321', 'Ana Gómez', 'Secretaria', 2200.50, '2017-03-15'),
('111223344', 'Carlos Díaz', 'Vendedor', 1800.75, '2023-01-10');

CREATE TABLE IF NOT EXISTS DEPARTAMENTOS(
ID_DEPARTAMENTO INT PRIMARY KEY,
NOMBRE_DEPARTAMENTO VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS PROYECTOS(
ID_PROYECTOS INT PRIMARY KEY,
NOMBRE_PROYECTO VARCHAR(50),
FECHA_INICIO DATE,
FECHA_FIN DATE
);

SELECT DNI, NOMBRE, PUESTO, SALARIO
FROM EMPLEADOS
WHERE SALARIO > 2500;

SELECT DNI,NOMBRE,PUESTO,SALARIO
FROM EMPLEADOS
WHERE FECHA_INGRESO > '2022-01-01'
