CREATE DATABASE PanaderiaDB;
USE PanaderiaDB;

CREATE TABLE Panaderos(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    ciudad VARCHAR(100) NOT NULL,
    telefono VARCHAR(15) NOT NULL
);

CREATE TABLE TiposPan(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT
);

CREATE TABLE Ingredientes(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    unidad_medida VARCHAR(50) NOT NULL,
    cantidad DECIMAL(10,2) NOT NULL,
    fecha_vencimiento DATE
);

CREATE TABLE Pedidos(
    id INT PRIMARY KEY AUTO_INCREMENT,
    panadero_id INT NOT NULL,
    cliente_id INT NOT NULL,
    direccion_entrega VARCHAR(255) NOT NULL,
    fecha_entrega DATE NOT NULL,
    hora_entrega TIME NOT NULL,
    FOREIGN KEY (panadero_id) REFERENCES Panaderos(id),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(id)
);

CREATE TABLE DetallePedido(
    id INT PRIMARY KEY AUTO_INCREMENT,
    pedido_id INT NOT NULL,
    pan_id INT NOT NULL,
    cantidad INT NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(id),
    FOREIGN KEY (pan_id) REFERENCES Pans(id)
);

CREATE TABLE Pans(
    id INT PRIMARY KEY AUTO_INCREMENT,
panadero_id INT NOT NULL,
tipo_pan_id INT NOT NULL,
nombre VARCHAR(100) NOT NULL,
descripcion TEXT,
precio DECIMAL(10,2) NOT NULL,
imagen_pan VARCHAR(255),
fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (panadero_id) REFERENCES Panaderos(id),
FOREIGN KEY (tipo_pan_id) REFERENCES TiposPan(id)
);