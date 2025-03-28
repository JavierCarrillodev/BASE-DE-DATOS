DROP DATABASE IF EXISTS Gestion_Inventario;
CREATE DATABASE Gestion_Inventario;
USE Gestion_Inventario;

CREATE TABLE PRODUCTO(
ID_PRODUCTO INT PRIMARY KEY NOT NULL,
NOMBRE_PRODUCTO VARCHAR(50),
CATEGORIA ENUM('ELECTRONICA','ROPA','ALIMENTOS','HERRAMIENTAS'),
STOCK INT,
PRECIO_UNITARIO DECIMAL
);

INSERT INTO PRODUCTO(ID_PRODUCTO,NOMBRE_PRODUCTO,CATEGORIA,STOCK,PRECIO_UNITARIO) 
VALUES
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

        -- 1.Encuentra todos los productos cuyo stock es menor a 10 unidades.-
        SELECT NOMBRE_PRODUCTO,STOCK
        FROM PRODUCTO
        WHERE STOCK < 10;

        -- 2.Encuentra todos los productos cuya categoría es Electrónica o Ropa.-
        SELECT NOMBRE_PRODUCTO,CATEGORIA
        FROM PRODUCTO
        WHERE CATEGORIA IN('ELECTRONICA','ROPA');

        -- 3.Encuentra todos los productos cuyo precio unitario es mayor a 100 euros.-
        SELECT NOMBRE_PRODUCTO,STOCK
        FROM PRODUCTO
        WHERE PRECIO_UNITARIO > 100;

       -- 4.Encuentra el producto con el precio unitario más alto.-
        SELECT * 
        FROM PRODUCTO
        WHERE PRECIO_UNITARIO = (SELECT MAX(PRECIO_UNITARIO) FROM PRODUCTO);

        -- 5.Encuentra la categoría con el mayor valor total de stock.-
        SELECT CATEGORIA, SUM(STOCK * PRECIO_UNITARIO) AS VALOR_TOTAL_STOCK 
        FROM PRODUCTO
        GROUP BY CATEGORIA
        LIMIT 1;

        -- 6.Encuentra el promedio del precio unitario de todos los productos.-
        SELECT AVG(PRECIO_UNITARIO) AS PROMERIO_PRECIO
        FROM PRODUCTO;

        -- 7.Encuentra todos los productos cuyo nombre comienza con “A” y su stock es mayor a 0.-
        SELECT NOMBRE_PRODUCTO,STOCK
        FROM PRODUCTO
        WHERE NOMBRE_PRODUCTO LIKE 'A%' AND STOCK > 0;

        -- 8.Encuentra todos los productos que no pertenecen a la categoría Alimentos y su precio unitario es inferior a 50 euros.-
        SELECT NOMBRE_PRODUCTO,PRECIO_UNITARIO
        FROM PRODUCTO
        WHERE CATEGORIA IN ('ELECTRONICA','ROPA','HERRAMIENTAS') AND PRECIO_UNITARIO < 50;

        -- 9.Encuentra todos los productos cuya cantidad en stock es un número par.-
        SELECT *
        FROM PRODUCTO
        WHERE STOCK % 2 = 0;

        -- 10.Encuentra todos los productos cuya categoría no contiene la palabra “Herramientas”.. -
        SELECT *
        FROM PRODUCTO
        WHERE CATEGORIA IN ('ELECTRONICA','ROPA','ALIMENTOS');

        -- 11.Encuentra todos los productos cuyo precio unitario está dentro del rango de 50 a 100 euros. -
        SELECT *
        FROM PRODUCTO
        WHERE PRECIO_UNITARIO BETWEEN 50 AND 100;

        -- 12.Encuentra el producto con la cantidad de stock más baja. -
        SELECT *
        FROM PRODUCTO
        ORDER BY STOCK ASC 
        LIMIT 1;

        -- 13.Encuentra la categoría con el menor valor total de stock.-
        SELECT *
        FROM PRODUCTO
        ORDER BY STOCK, CATEGORIA ASC 
        LIMIT 1;

        -- 14.Encuentra el número total de productos en cada categoría.-
       SELECT CATEGORIA, SUM(STOCK) AS TOTAL_STOCK
       FROM PRODUCTO
       GROUP BY CATEGORIA
       ORDER BY TOTAL_STOCK 
       LIMIT 1;

        SELECT CATEGORIA, COUNT(*) AS TOTAL_PRODUCTO
        FROM PRODUCTO
        GROUP BY CATEGORIA;

       -- 15.Encuentra todos los productos que tienen el mismo precio unitario que otro producto.-
        SELECT *
        FROM PRODUCTO
        WHERE PRECIO_UNITARIO IN (
                SELECT PRECIO_UNITARIO
                FROM PRODUCTO
                GROUP BY PRECIO_UNITARIO
                HAVING COUNT(*) > 1
                
                );


        -- 16.Encuentra todos los productos cuyo nombre contiene al menos tres vocales.-
        SELECT * FROM PRODUCTO
        WHERE NOMBRE_PRODUCTO REGEXP '[aeiou].*[aeiou].*[aeiou]';

        -- 17.Encuentra todos los productos que tienen el mismo nombre de categoría que otro producto.-
        SELECT *
        FROM PRODUCTO
        WHERE CATEGORIA IN (
                SELECT CATEGORIA
                FROM PRODUCTO
                GROUP BY CATEGORIA
                HAVING COUNT(*) > 1
        );

        -- 18.Encuentra todos los productos cuyo nombre es más largo que su categoría.-
        SELECT *
        FROM PRODUCTOS
        WHERE LENGTH(NOMBRE_PRODUCTO) > LENGTH(CATEGORIA);

        -- 19.Encuentra todos los productos cuyo precio unitario es un número entero.-
        SELECT *
        FROM PRODUCTO
        WHERE MOD(PRECIO_UNITARIO, 1) = 0;

        -- 20Encuentra el producto con el mayor valor total (stock * precio_unitario)-
        SELECT *
        FROM PRODUCTO
        ORDER BY (STOCK * PRECIO_UNITARIO) DESC 
        LIMIT 1;
