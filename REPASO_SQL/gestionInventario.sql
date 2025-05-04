DROP DATABASE IF EXISTS gestionInventario;
CREATE DATABASE gestionInventario;
USE gestionInventario;

CREATE TABLE producto(
id_producto INT PRIMARY KEY,
nombre_producto VARCHAR(50),
categoria VARCHAR(50) CHECK (categoria IN ('Electronica','Ropa','Alimentos','Herramientas')),
stock INT,
precio_unitario DECIMAL
);

INSERT INTO producto VALUES
(1, 'Smartphone', 'Electrónica', 25, 399.99),
(2, 'Camiseta', 'Ropa', 50, 19.99),
(3, 'Leche', 'Alimentos', 100, 1.50),
(4, 'Destornillador', 'Herramientas', 15, 9.99),
(5, 'Portátil', 'Electrónica', 10, 899.99),
(6, 'Pantalones', 'Ropa', 30, 29.99),
(7, 'Manzanas', 'Alimentos', 75, 0.50),
(8, 'Martillo', 'Herramientas', 20, 12.99),
(9, 'Tablet', 'Electrónica', 8, 299.99),
(10, 'Chaqueta', 'Ropa', 20, 49.99),
(11, 'Queso', 'Alimentos', 50, 2.99),
(12, 'Taladro', 'Herramientas', 12, 39.99),
(13, 'Altavoces', 'Electrónica', 18, 149.99),
(14, 'Bufanda', 'Ropa', 40, 14.99),
(15, 'Arroz', 'Alimentos', 90, 1.20),
(16, 'Destapacañerías', 'Herramientas', 5, 7.99),
(17, 'Televisor', 'Electrónica', 6, 699.99),
(18, 'Zapatos', 'Ropa', 35, 39.99),
(19, 'Pan', 'Alimentos', 120, 0.80),
(20, 'Cinta métrica', 'Herramientas', 10, 5.99),
(21, 'Auriculares', 'Electrónica', 22, 79.99),
(22, 'Vestido', 'Ropa', 15, 59.99),
(23, 'Cerveza', 'Alimentos', 65, 1.99),
(24, 'Llave inglesa', 'Herramientas', 8, 8.99),
(25, 'Monitor', 'Electrónica', 9, 199.99),
(26, 'Jersey', 'Ropa', 25, 34.99),
(27, 'Pasta', 'Alimentos', 80, 1.30),
(28, 'Destornillador eléctrico', 'Herramientas', 18, 24.99),
(29, 'Cámara', 'Electrónica', 7, 449.99),
(30, 'Gorra', 'Ropa', 50, 9.99);

SELECT * from producto;