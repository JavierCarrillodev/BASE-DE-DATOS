CREATE DATABASE crud_demo;
USE crud_demo;

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

INSERT INTO usuarios (nombre, email) VALUES 
('Ana García', 'ana.garcia@example.com'),
('Luis Pérez', 'luis.perez@example.com'),
('María López', 'maria.lopez@example.com'),
('Carlos Ramírez', 'carlos.ramirez@example.com');
