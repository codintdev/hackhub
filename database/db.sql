-- Database
CREATE DATABASE hackhub;
USE hackhub;

-- Tables
CREATE TABLE productos (
    id (11) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(500) NOT NULL,
    precio int(10) NOT NULL,
    imagen VARCHAR(500) NOT NULL
);

-- Test User
INSERT INTO productos (id, nombre, descripcion, precio, imagen) VALUES (
    1, 'Test', 'test', 10, 'test'
);
