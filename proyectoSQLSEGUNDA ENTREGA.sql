CREATE SCHEMA proyecto_lautaro_cruz;
use proyecto_lautaro_cruz;


-- creación de tablas
CREATE TABLE Personal 
( 
    id_trabajador INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre_trabajador VARCHAR(30) NOT NULL,
    apellido_trabajador VARCHAR(30) NOT NULL,
    nombre_servicio VARCHAR(30),
    telefono_trabajador VARCHAR(25),
    email_trabajador VARCHAR(100),
    area VARCHAR(50)
);

CREATE TABLE Proveedores
(	
    fecha DATE NOT NULL,
    id_trabajador INT NOT NULL,
    nombre_servicio VARCHAR(30) NOT NULL,
    nombre_proveedor VARCHAR(100) NOT NULL,
    item VARCHAR(100) NOT NULL,
    cantidad INT NOT NULL,
    costo INT NOT NULL,
    numero_factura INT,
    PRIMARY KEY (fecha, id_trabajador),
    FOREIGN KEY (id_trabajador) REFERENCES Personal(id_trabajador)
);

CREATE TABLE Servicios 
( 	
    id_venta INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    fecha DATE NOT NULL,
    id_trabajador INT NOT NULL,
    nombre_servicio VARCHAR(30) NOT NULL,
    nombre_cliente VARCHAR(30) NOT NULL,
    presupuesto INT,
    observaciones VARCHAR(100),
    FOREIGN KEY (id_trabajador) REFERENCES Personal(id_trabajador)
);

CREATE TABLE Clientes
(	
    nombre_cliente VARCHAR(30) NOT NULL,	
    apellido_cliente VARCHAR(40) NOT NULL,
    mail_cliente VARCHAR(100) NOT NULL,
    telefono_cliente VARCHAR(30),
    nombre_servicio VARCHAR(30) NOT NULL,
    PRIMARY KEY (nombre_cliente, nombre_servicio)
);

-- índices a las columnas referenciadas
ALTER TABLE Servicios ADD INDEX idx_nombre_servicio (nombre_servicio);
ALTER TABLE Clientes ADD INDEX idx_nombre_cliente (nombre_cliente);

-- tabla puente
CREATE TABLE Puente_Servicios_clientes (
    nombre_servicio VARCHAR(30) NOT NULL,
    nombre_cliente VARCHAR(30) NOT NULL,
    FOREIGN KEY (nombre_servicio) REFERENCES Servicios (nombre_servicio),
    FOREIGN KEY (nombre_cliente) REFERENCES Clientes (nombre_cliente)
);


-- poblacion de tablas 

-- registros en la tabla Personal
INSERT INTO Personal (nombre_trabajador, apellido_trabajador, nombre_servicio, telefono_trabajador, email_trabajador, area) 
VALUES 
('Juan', 'Pérez', 'incendios', '123456789', 'juan@example.com', 'Servicios'),
('María', 'González', 'incendios', '987654321', 'maria@example.com', 'Servicios'),
('Pedro', 'Martínez', 'CCTV', '555444333', 'pedro@example.com', 'Servicios'),
('Ana', 'López', 'electricidad', '777888999', 'ana@example.com', 'Servicios'),
('Carlos', 'Sánchez', 'electricidad', '111222333', 'carlos@example.com', 'Servicios'),
('Laura', 'Rodríguez', 'electricidad', '333444555', 'laura@example.com', 'Servicios'),
('David', 'García', 'CCTV', '666777888', 'david@example.com', 'Servicios'),
('Sofía', 'Fernández',"gestion", '222333444', 'sofia@example.com', 'Logística'),
('Diego', 'Hernández',"gestion", '888999000', 'diego@example.com', 'CEO'),
('Valeria', 'Pérez',"gestion", '444555666', 'valeria@example.com', 'Soporte'),
('Lautaro', 'Cruz', "gestion",'444558990', 'lauti@example.com', 'Programación');

-- registros en la tabla Proveedores
INSERT INTO Proveedores (fecha, id_trabajador, nombre_servicio, nombre_proveedor, item, cantidad, costo, numero_factura) 
VALUES 
('2023-11-21', 1, 'incendios', 'Proveedor A', 'Extintor', 3, 30, 1034),
('2023-12-03', 1, 'CCTV', 'Proveedor A', 'Extintor', 2, 20, 1126),
('2023-12-21', 1, 'incendios', 'Proveedor A', 'Extintor', 10, 100, 1234),
('2024-01-04', 3, 'CCTV', 'Proveedor B', 'Cámara de vigilancia', 5, 200, 5678),
('2024-01-03', 4, 'electricidad', 'Proveedor C', 'Cables eléctricos', 100, 50, 91011),
('2024-01-21', 3, 'CCTV', 'Proveedor D', 'DVR', 2, 300, 1213),
('2024-01-30', 2, 'incendios', 'Proveedor E', 'Detector de humo', 8, 80, 1415),
('2024-02-12', 4, 'electricidad', 'Proveedor F', 'Bombillas', 50, 10, 1617),
('2024-02-19', 7, 'CCTV', 'Proveedor G', 'Monitor de seguridad', 3, 400, 1819);


-- registros en la tabla Clientes
INSERT INTO Clientes (nombre_cliente, apellido_cliente, mail_cliente, telefono_cliente, nombre_servicio) 
VALUES 
('Juan', 'Gómez', 'juan.gomez@example.com', '123456789', 'incendios'),
('María', 'López', 'maria.lopez@example.com', '987654321', 'CCTV'),
('Pedro', 'Martínez', 'pedro.martinez@example.com', '555444333', 'electricidad'),
('Ana', 'Sánchez', 'ana.sanchez@example.com', '777888999', 'CCTV'),
('Carlos', 'Hernández', 'carlos.hernandez@example.com', '111222333', 'incendios'),
('Laura', 'Fernández', 'laura.fernandez@example.com', '333444555', 'electricidad'),
('David', 'González', 'david.gonzalez@example.com', '666777888', 'CCTV');

-- registros en la tabla Servicios
INSERT INTO Servicios (fecha, id_trabajador, nombre_servicio, nombre_cliente, presupuesto, observaciones) 
VALUES 
('2024-01-02', 1, 'incendios', 'Juan Gómez', 500, 'Instalación de extintores en la oficina'),
('2024-01-04', 3, 'CCTV', 'María López', 1000, 'Instalación de cámaras de vigilancia en el almacén'),
('2024-01-10', 4, 'electricidad', 'Pedro Martínez', 700, 'Reparación del sistema eléctrico en la fábrica'),
('2024-01-27', 3, 'CCTV', 'Ana Sánchez', 1200, 'Instalación de sistema de seguridad CCTV en el hogar'),
('2024-02-01', 1, 'incendios', 'Carlos Hernández', 600, 'Mantenimiento de equipos contra incendios en el edificio'),
('2024-02-08', 5, 'electricidad', 'Laura Fernández', 800, 'Instalación de iluminación LED en el garaje'),
('2024-02-18', 3, 'CCTV', 'David González', 1500, 'Actualización del sistema de cámaras de vigilancia en el negocio');




-- VISTAS

-- vista del personal a cargo de prestar servicios, junto con su información para contactar
CREATE VIEW Vista_Personal_Servicios AS
SELECT id_trabajador, nombre_trabajador, nombre_servicio, telefono_trabajador
FROM Personal
WHERE area = 'Servicios';

-- vista del personal a cargo de la gestion, también junto con la información
CREATE VIEW Vista_Personal_Gestion AS
SELECT id_trabajador, nombre_trabajador, nombre_servicio, telefono_trabajador
FROM Personal
WHERE nombre_servicio = 'gestion';

-- vista de la mercadería ingresada dentro del año corriente (2024)
CREATE VIEW Vista_Proveedores_2024 AS
SELECT *
FROM Proveedores
WHERE YEAR(fecha) = 2024;

-- vista de los servicios prestados (sistema contra incendios)
CREATE VIEW Vista_Servicios_incendios AS
SELECT *
FROM Servicios
WHERE nombre_servicio = "incendios";

-- vista de los servicios prestados (sistema electrico)
CREATE VIEW Vista_Servicios_electricidad AS
SELECT *
FROM Servicios
WHERE nombre_servicio = "electricidad";

-- vista de los servicios prestados (circuito cerrado de television CCTV)
CREATE VIEW Vista_Servicios_CCTV AS
SELECT *
FROM Servicios
WHERE nombre_servicio = "CCTV";
$$






-- FUNCIONES 

-- Función para calcular el total de gastos por año
DELIMITER $$
CREATE FUNCTION TotalGastosPorAño(año INT) RETURNS INT
NO SQL
BEGIN
    DECLARE total_gastos INT;
    SELECT SUM(costo) INTO total_gastos
    FROM Proveedores
    WHERE YEAR(fecha) = año;
    RETURN total_gastos;
END;
$$

-- SELECT TotalGastosPorAño (2024);

-- función con formula para calcular presupuestos (cantidad a utiliar * costo unitario)
CREATE FUNCTION CalcularPresupuesto(

    cantidad INT,
    costo_unitario INT
)  RETURNS INT	
NO SQL
BEGIN
    DECLARE presupuesto_total INT;
    
    SET presupuesto_total = cantidad * costo_unitario;
    
    RETURN presupuesto_total;
END;

-- SELECT CalcularPresupuesto (3, 9);
DELIMITER ;




-- STORED PROCEDURES

-- procedimiento para obtener el total de ventas en el año corriente  (no necesita parametro)
DELIMITER $$

CREATE PROCEDURE CalcularCantidadVentas()
BEGIN
    DECLARE total_ventas INT;
    
    SELECT COUNT(*) INTO total_ventas
    FROM Servicios
    WHERE YEAR(fecha) = 2024;
    
    SELECT total_ventas AS cantidad_ventas;
END $$

-- CALL CalcularCantidadVentas();


-- procedimiento para obtener un empleado por su ID interno
DELIMITER $$
CREATE PROCEDURE ObtenerEmpleadoPorID(
    IN empleado_id INT
)
BEGIN
    SELECT * FROM Personal WHERE id_trabajador = empleado_id;
END
$$

-- CALL ObtenerEmpleadoPorID(11);



-- TRIGGERS

-- trigger para actualizar el área en la tabla Personal:
DELIMITER $$
CREATE TRIGGER Actualizar_Area_Trigger
AFTER INSERT ON Servicios
FOR EACH ROW
BEGIN
    UPDATE Personal
    SET area = NEW.nombre_servicio
    WHERE id_trabajador = NEW.id_trabajador;
END;
$$


-- trigger de registro de auditoría para la gestión de base de datos
DELIMITER $$
CREATE TRIGGER Registro_Auditoria_Personal
AFTER INSERT ON Personal
FOR EACH ROW
BEGIN
    INSERT INTO Registro_Auditoria (accion, tabla_afectada, fecha)
    VALUES ('INSERT', 'Personal', NOW());
END; 
$$



