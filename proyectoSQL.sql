CREATE SCHEMA proyecto_coderhouse;
USE proyecto_coderhouse;

-- Creación de tablas
CREATE TABLE personal 
( 	id_trabajador INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(15) NOT NULL,
    apellido VARCHAR(15) NOT NULL,
    telefono INT NOT NULL,
    nombre_servicio VARCHAR(30) NOT NULL 
);

CREATE TABLE servicios 
( 	fecha DATE NOT NULL,
    nombre_servicio VARCHAR(30) NOT NULL,
    nombre_cliente VARCHAR(30) NOT NULL,
    presupuesto INT NOT NULL,
    detalle VARCHAR(100),
    PRIMARY KEY (nombre_servicio, nombre_cliente)
);

CREATE TABLE clientes 
(	nombre_cliente VARCHAR(30) NOT NULL,	
    apellido_cliente VARCHAR(40) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefono INT NOT NULL,
    nombre_servicio VARCHAR(30) NOT NULL,
    PRIMARY KEY (nombre_servicio, nombre_cliente),
    CONSTRAINT unique_cliente_servicio UNIQUE (nombre_cliente)
);


CREATE TABLE proveedores
(	fecha DATE NOT NULL,
    nombre_servicio VARCHAR(30) PRIMARY KEY NOT NULL,
    item VARCHAR(100) NOT NULL,
    cantidad INT NOT NULL,
    costo INT NOT NULL,
    numero_factura INT NOT NULL
);

CREATE TABLE puente_servicios 
(	nombre_servicio VARCHAR(30) NOT NULL,
    nombre_cliente VARCHAR(30) NOT NULL,
    PRIMARY KEY (nombre_servicio, nombre_cliente),
    FOREIGN KEY (nombre_servicio) REFERENCES servicios (nombre_servicio),
    FOREIGN KEY (nombre_cliente) REFERENCES clientes (nombre_cliente)
);



-- Creación de relaciones 
ALTER TABLE personal
ADD CONSTRAINT fk_proveedores_personal
FOREIGN KEY (nombre_servicio) REFERENCES proveedores (nombre_servicio);

ALTER TABLE servicios
ADD CONSTRAINT fk_personal_servicios
FOREIGN KEY (nombre_servicio) REFERENCES personal (nombre_servicio);

ALTER TABLE puente_servicios
ADD CONSTRAINT fk_servicios_puente_servicios
FOREIGN KEY (nombre_servicio) REFERENCES servicios (nombre_servicio);

ALTER TABLE servicios
ADD CONSTRAINT fk_servicios_puente_clientes
FOREIGN KEY (nombre_cliente) REFERENCES puente_servicios (nombre_cliente);

ALTER TABLE puente_servicios
ADD CONSTRAINT fk_clientes_puente_servicios
FOREIGN KEY (nombre_cliente) REFERENCES clientes (nombre_cliente);









