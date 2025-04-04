DROP DATABASE IF EXISTS Tienda_Libros;
CREATE DATABASE IF NOT EXISTS Tienda_Libros;
USE Tienda_Libros;

CREATE TABLE IF NOT EXISTS LIBROS(
    ID_LIBRO INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    TITULO VARCHAR(50),
    AUTOR VARCHAR(50),
    ANIO_PUBLICACION DATE,
    CATEGORIA VARCHAR(50),  
    CHECK (CATEGORIA IN('FICCION','NO FICCION','CIENCIA')),
    PRECIO DECIMAL,
    CANTIDAD_STOCK INT 
);
INSERT INTO LIBROS (ID_LIBRO,TITULO,AUTOR,ANIO_PUBLICACION,CATEGORIA,PRECIO,CANTIDAD_STOCK)
VALUES 
        (1,'La sombra del viento','Carlos Ruiz Zafón','2001-01-01','Ficción',19.99,50),
        (2,'Breve historia de casi todo','Bill Bryson','2003-02-09','No Ficción',15.50,100),
        (3,'El origen de las especies','Charles Darwin','1859-02-12','Ciencia',12.99,30),
        (4,'Cien años de soledad','Gabriel García Márquez','1967-01-21','Ficción',22.50,20),
        (5,'El gran Gatsby','F. Scott Fitzgerald','1925-03-11','Ficción',10.99,200),
        (6,'Sapiens: De animales a dioses','Yuval Noah Harari','2011-05-15','No Ficción',18.75,75),
        (7,'1984','George Orwell','1949-07-22','Ficción',14.50,120),
        (8,'El código Da Vinci', 'Dan Brown','2003-07-24','Ficción',20.00,60);

    SELECT TITULO,AUTOR
    FROM LIBROS
    WHERE PRECIO > 15.00 AND CANTIDAD_STOCK > 50;

    SELECT TITULO,AUTOR,PRECIO
    FROM LIBROS
    WHERE CATEGORIA = 'FICCION' OR PRECIO < 15.00;
      
    SELECT TITULO, ( PRECIO * CANTIDAD_STOCK) AS VALOR_TOTAL
    FROM LIBROS;
             
            

    SELECT TITULO,AUTOR,PRECIO,CANTIDAD_STOCK,
        CASE
            WHEN CANTIDAD_STOCK = 0 THEN 'AGOTADO'
            WHEN CANTIDAD_STOCK < 20 THEN 'POCAS UNIDADES'
            ELSE 'EN STOCK'
        END AS ESTADO_STOCK
    FROM LIBROS;

    
    SELECT ANIO_PUBLICACION,CATEGORIA
    FROM LIBROS
    WHERE ANIO_PUBLICACION > '2000-01-01' AND CATEGORIA = 'NO FICCION';

    SELECT TITULO,PRECIO
    FROM LIBROS
    WHERE PRECIO > 15.00 AND CANTIDAD_STOCK < 50;

  SELECT CATEGORIA , SUM(CANTIDAD_STOCK) AS TOTAL_LIBROS
  FROM LIBROS
  GROUP BY CATEGORIA;