USE telcox_db;

-- Tabla: Usuarios
CREATE TABLE Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    email VARCHAR(150) UNIQUE,
    contrasena_hash VARCHAR(255),
    estado_cuenta VARCHAR(50),
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB 
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;

-- Tabla: Servicios
CREATE TABLE Servicios (
    id_servicio INT AUTO_INCREMENT PRIMARY KEY,
    nombre_servicio VARCHAR(100),
    tipo_servicio VARCHAR(50),
    estado_servicio VARCHAR(50)
) ENGINE=InnoDB;

-- Tabla: Servicios_Contratados
CREATE TABLE Servicios_Contratados (
    id_contrato INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_servicio INT,
    fecha_inicio DATETIME,
    fecha_fin DATETIME,
    estado_contrato VARCHAR(50),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_servicio) REFERENCES Servicios(id_servicio)
) ENGINE=InnoDB;

-- Tabla: Facturas
CREATE TABLE Facturas (
    id_factura INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    fecha_emision DATETIME,
    fecha_vencimiento DATETIME,
    total DECIMAL(10,2),
    estado_pago VARCHAR(50),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
) ENGINE=InnoDB;

-- Tabla: Factura_Detalle
CREATE TABLE Factura_Detalle (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_factura INT,
    descripcion VARCHAR(255),
    monto DECIMAL(10,2),
    tipo VARCHAR(50),
    FOREIGN KEY (id_factura) REFERENCES Facturas(id_factura)
) ENGINE=InnoDB;

-- Tabla: Soporte_Tickets
CREATE TABLE Soporte_Tickets (
    id_ticket INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    asunto VARCHAR(150),
    descripcion TEXT,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    estado_ticket VARCHAR(50),
    prioridad VARCHAR(50),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
) ENGINE=InnoDB;

-- Tabla: Paquetes
CREATE TABLE Paquetes (
    id_paquete INT AUTO_INCREMENT PRIMARY KEY,
    nombre_paquete VARCHAR(100),
    descripcion VARCHAR(255),
    precio DECIMAL(10,2),
    estado_paquete VARCHAR(50)
) ENGINE=InnoDB;

-- Tabla: Paquete_Servicio (relación N:M)
CREATE TABLE Paquete_Servicio (
    id_paquete INT,
    id_servicio INT,
    PRIMARY KEY (id_paquete, id_servicio),
    FOREIGN KEY (id_paquete) REFERENCES Paquetes(id_paquete),
    FOREIGN KEY (id_servicio) REFERENCES Servicios(id_servicio)
) ENGINE=InnoDB;

-- Tabla: Consumo_Datos
CREATE TABLE Consumo_Datos (
    id_consumo INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_servicio INT,
    id_paquete INT,
    fecha DATETIME,
    consumo_mb DECIMAL(10,2),
    limite_mb DECIMAL(10,2),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_servicio) REFERENCES Servicios(id_servicio),
    FOREIGN KEY (id_paquete, id_servicio) REFERENCES Paquete_Servicio(id_paquete, id_servicio)
) ENGINE=InnoDB;
-- Tabla: CRM_Integracion
CREATE TABLE CRM_Integracion (
    id_usuario INT PRIMARY KEY,
    id_cliente_crm VARCHAR(100),
    estado_sync VARCHAR(50),
    fecha_ultima_sync DATETIME,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
) ENGINE=InnoDB;

-- Tabla: BSS_Integracion
CREATE TABLE BSS_Integracion (
    id_servicio INT PRIMARY KEY,
    id_servicio_bss VARCHAR(100),
    estado_sync VARCHAR(50),
    fecha_ultima_sync DATETIME,
    FOREIGN KEY (id_servicio) REFERENCES Servicios(id_servicio)
) ENGINE=InnoDB;


ALTER TABLE Usuarios AUTO_INCREMENT = 1;
ALTER TABLE Servicios AUTO_INCREMENT = 1;
ALTER TABLE Paquetes AUTO_INCREMENT = 1;
ALTER TABLE Servicios_Contratados AUTO_INCREMENT = 1;

INSERT INTO Usuarios (nombre, apellido, email, contrasena_hash, estado_cuenta)
VALUES 
('Carlos', 'Mendoza', 'carlos.mendoza@example.com', 'hash1', 'activo'),
('Laura', 'Fernandez', 'laura.fernandez@example.com', 'hash2', 'activo'),
('Juan', 'Perez', 'juan.perez@example.com', 'hash3', 'inactivo'),
('Ana', 'Garcia', 'ana.garcia@example.com', 'hash4', 'activo'),
('Luis', 'Ramirez', 'luis.ramirez@example.com', 'hash5', 'suspendido'),
('Maria', 'Lopez', 'maria.lopez@example.com', 'hash6', 'activo'),
('Jose', 'Martinez', 'jose.martinez@example.com', 'hash7', 'activo'),
('Paula', 'Sanchez', 'paula.sanchez@example.com', 'hash8', 'inactivo'),
('Miguel', 'Torres', 'miguel.torres@example.com', 'hash9', 'activo'),
('Lucia', 'Reyes', 'lucia.reyes@example.com', 'hash10', 'activo'),
('Andres', 'Cabrera', 'andres.cabrera@example.com', 'hash11', 'activo'),
('Carmen', 'Rios', 'carmen.rios@example.com', 'hash12', 'suspendido'),
('Daniel', 'Castro', 'daniel.castro@example.com', 'hash13', 'activo'),
('Elena', 'Moreno', 'elena.moreno@example.com', 'hash14', 'activo'),
('Sergio', 'Vega', 'sergio.vega@example.com', 'hash15', 'inactivo'),
('Rosa', 'Navarro', 'rosa.navarro@example.com', 'hash16', 'activo'),
('David', 'Silva', 'david.silva@example.com', 'hash17', 'activo'),
('Isabel', 'Mora', 'isabel.mora@example.com', 'hash18', 'suspendido'),
('Hugo', 'Delgado', 'hugo.delgado@example.com', 'hash19', 'activo'),
('Natalia', 'Guzman', 'natalia.guzman@example.com', 'hash20', 'activo');

INSERT INTO Servicios (nombre_servicio, tipo_servicio, estado_servicio)
VALUES
('Internet Hogar 50Mbps', 'Internet', 'activo'),
('Internet Corporativo 200Mbps', 'Internet', 'activo'),
('TV Cable Basico', 'Television', 'activo'),
('TV HD Premium', 'Television', 'activo'),
('Telefonia Ilimitada', 'Telefonia', 'activo'),
('Soporte Tecnico 24/7', 'Soporte', 'activo'),
('Correo Corporativo', 'Correo', 'activo'),
('Firewall Empresarial', 'Seguridad', 'activo'),
('VPN Dedicada', 'Seguridad', 'activo'),
('Antivirus Avanzado', 'Seguridad', 'activo'),
('Monitoreo de Red', 'Infraestructura', 'activo'),
('Almacenamiento en la Nube', 'Nube', 'activo'),
('Respaldos Automaticos', 'Nube', 'activo'),
('Dominio Web', 'Web', 'activo'),
('Hosting Web', 'Web', 'activo'),
('Gestion de Dispositivos', 'Infraestructura', 'activo'),
('Servidor Virtual', 'Infraestructura', 'activo'),
('App Empresarial', 'Software', 'activo'),
('Streaming de Video', 'Multimedia', 'activo'),
('Paquete de Juegos', 'Multimedia', 'inactivo');

INSERT INTO Paquetes (nombre_paquete, descripcion, precio, estado_paquete)
VALUES
('Paquete Basico Hogar', 'Incluye Internet 50Mbps y TV basica', 29.99, 'activo'),
('Paquete Premium Hogar', 'Internet 100Mbps + TV HD + Telefonia', 49.99, 'activo'),
('Paquete Empresarial 1', 'Internet 200Mbps + Soporte 24/7', 79.99, 'activo'),
('Paquete Empresarial 2', 'Internet + VPN + Firewall', 99.99, 'activo'),
('Paquete Familiar', 'TV HD + Telefonia ilimitada', 39.99, 'activo'),
('Paquete Nube Pro', 'Almacenamiento y respaldos', 19.99, 'activo'),
('Paquete Web Start', 'Dominio y hosting web', 24.99, 'activo'),
('Paquete Seguridad', 'Antivirus + Firewall', 14.99, 'activo'),
('Paquete Gamer', 'Internet rapido + Juegos', 59.99, 'activo'),
('Paquete Streaming', 'TV HD + Streaming de Video', 44.99, 'activo'),
('Plan Emprendedor', 'Correo + Dominio + Hosting', 34.99, 'activo'),
('Plan Corporativo', 'VPN + Soporte + Antivirus', 89.99, 'activo'),
('Plan Data Center', 'Servidor + Respaldos', 129.99, 'activo'),
('Plan Basico PyME', 'Internet + Soporte', 54.99, 'activo'),
('Plan Multiservicio', 'Internet + TV + Antivirus', 64.99, 'activo'),
('Plan Avanzado', 'Todos los servicios empresariales', 149.99, 'activo'),
('Combo Cloud', 'Nube + Seguridad + Soporte', 74.99, 'activo'),
('Combo Hogar+', 'Internet + TV + Telefono', 39.99, 'inactivo'),
('Pack Office+', 'Correo + App Empresarial', 27.99, 'activo'),
('Pack Streaming+', 'TV + Internet + Streaming', 69.99, 'activo');


INSERT INTO Servicios_Contratados (id_usuario, id_servicio, fecha_inicio, fecha_fin, estado_contrato) VALUES
(1, 3, '2023-03-15 09:00:00', NULL, 'activo'),
(2, 5, '2023-04-10 10:30:00', NULL, 'activo'),
(3, 7, '2023-06-01 14:00:00', NULL, 'activo'),
(4, 2, '2023-08-05 08:45:00', '2024-05-30 12:00:00', 'vencido'),
(5, 1, '2023-09-12 16:30:00', NULL, 'activo'),
(6, 4, '2023-10-22 17:15:00', '2024-04-22 17:15:00', 'inactivo'),
(7, 6, '2023-11-01 11:00:00', NULL, 'activo'),
(8, 8, '2023-12-11 09:15:00', NULL, 'activo'),
(9, 10, '2024-01-01 00:00:00', NULL, 'activo'),
(10, 9, '2024-01-15 13:45:00', NULL, 'activo'),
(11, 11, '2024-02-20 10:10:00', NULL, 'activo'),
(12, 12, '2024-03-05 08:00:00', NULL, 'activo'),
(13, 13, '2024-04-01 14:20:00', NULL, 'activo'),
(14, 14, '2024-04-15 09:00:00', '2025-04-14 23:59:59', 'suspendido'),
(15, 15, '2024-05-01 10:00:00', NULL, 'activo'),
(16, 16, '2024-05-20 12:00:00', NULL, 'activo'),
(17, 17, '2024-06-01 15:00:00', NULL, 'activo'),
(18, 18, '2024-06-10 16:00:00', NULL, 'activo'),
(19, 19, '2024-06-14 08:00:00', NULL, 'activo'),
(20, 20, '2024-06-14 09:00:00', NULL, 'activo'),
(1, 2, '2023-01-10 10:00:00', '2023-12-31 23:59:59', 'vencido'),
(2, 3, '2023-02-15 11:00:00', NULL, 'activo'),
(3, 4, '2023-03-20 12:00:00', NULL, 'activo'),
(4, 5, '2023-04-25 13:00:00', NULL, 'activo'),
(5, 6, '2023-05-30 14:00:00', '2024-05-30 14:00:00', 'inactivo'),
(6, 7, '2023-06-15 15:00:00', NULL, 'activo'),
(7, 8, '2023-07-10 16:00:00', NULL, 'activo'),
(8, 9, '2023-08-05 17:00:00', NULL, 'activo'),
(9, 10, '2023-09-01 18:00:00', NULL, 'activo'),
(10, 11, '2023-09-15 19:00:00', NULL, 'activo'),
(11, 12, '2023-10-10 20:00:00', NULL, 'activo'),
(12, 13, '2023-11-05 21:00:00', NULL, 'activo'),
(13, 14, '2023-12-01 08:00:00', '2024-06-01 08:00:00', 'inactivo'),
(14, 15, '2024-01-01 09:00:00', NULL, 'activo'),
(15, 16, '2024-01-10 10:00:00', NULL, 'activo'),
(16, 17, '2024-01-20 11:00:00', NULL, 'activo'),
(17, 18, '2024-02-01 12:00:00', NULL, 'activo'),
(18, 19, '2024-02-10 13:00:00', NULL, 'activo'),
(19, 20, '2024-03-01 14:00:00', NULL, 'activo'),
(20, 1, '2024-03-10 15:00:00', NULL, 'activo'),
(1, 3, '2024-03-15 08:00:00', NULL, 'activo'),
(2, 5, '2024-03-20 09:00:00', NULL, 'activo'),
(3, 7, '2024-03-25 10:00:00', NULL, 'activo'),
(4, 9, '2024-04-01 11:00:00', NULL, 'activo'),
(5, 11, '2024-04-05 12:00:00', NULL, 'activo'),
(6, 13, '2024-04-10 13:00:00', NULL, 'activo'),
(7, 15, '2024-04-15 14:00:00', NULL, 'activo'),
(8, 17, '2024-04-20 15:00:00', NULL, 'activo'),
(9, 19, '2024-04-25 16:00:00', NULL, 'activo'),
(10, 2, '2024-05-01 17:00:00', NULL, 'activo'),
(11, 4, '2024-05-05 18:00:00', NULL, 'activo'),
(12, 6, '2024-05-10 19:00:00', NULL, 'activo'),
(13, 8, '2024-05-15 20:00:00', NULL, 'activo'),
(14, 10, '2024-05-20 21:00:00', NULL, 'activo'),
(15, 12, '2024-05-25 22:00:00', NULL, 'activo'),
(16, 14, '2024-06-01 08:00:00', NULL, 'activo'),
(17, 16, '2024-06-05 09:00:00', NULL, 'activo'),
(18, 18, '2024-06-10 10:00:00', NULL, 'activo'),
(19, 20, '2024-06-14 11:00:00', NULL, 'activo'),
(20, 1, '2024-06-14 12:00:00', NULL, 'activo'),
(5, 13, '2024-06-01 13:00:00', NULL, 'activo'),
(10, 17, '2024-06-03 15:00:00', NULL, 'activo'),
(15, 3, '2024-06-05 09:00:00', NULL, 'activo'),
(18, 5, '2024-06-06 14:00:00', NULL, 'activo'),
(19, 7, '2024-06-07 08:00:00', NULL, 'activo'),
(1, 9, '2024-06-08 13:00:00', NULL, 'activo'),
(2, 11, '2024-06-09 10:00:00', NULL, 'activo'),
(3, 13, '2024-06-10 11:00:00', NULL, 'activo'),
(4, 15, '2024-06-11 09:00:00', NULL, 'activo'),
(6, 20, '2024-06-12 12:00:00', NULL, 'activo');


-- Paquete Basico Hogar: Internet 50Mbps y TV basica
INSERT INTO Paquete_Servicio VALUES
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Paquete Basico Hogar'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'Internet Hogar 50Mbps')),
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Paquete Basico Hogar'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'TV Cable Basico'));

-- Paquete Premium Hogar: Internet 100Mbps, TV HD, Telefonia
-- Nota: Internet 100Mbps no esta creado, solo TV HD y Telefonia
INSERT INTO Paquete_Servicio VALUES
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Paquete Premium Hogar'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'TV HD Premium')),
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Paquete Premium Hogar'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'Telefonia Ilimitada'));

-- Paquete Empresarial 1: Internet 200Mbps y Soporte 24/7
INSERT INTO Paquete_Servicio VALUES
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Paquete Empresarial 1'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'Internet Corporativo 200Mbps')),
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Paquete Empresarial 1'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'Soporte Tecnico 24/7'));

-- Paquete Empresarial 2: Internet, VPN y Firewall
INSERT INTO Paquete_Servicio VALUES
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Paquete Empresarial 2'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'Internet Corporativo 200Mbps')),
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Paquete Empresarial 2'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'VPN Dedicada')),
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Paquete Empresarial 2'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'Firewall Empresarial'));

-- Paquete Familiar: TV HD y Telefonia
INSERT INTO Paquete_Servicio VALUES
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Paquete Familiar'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'TV HD Premium')),
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Paquete Familiar'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'Telefonia Ilimitada'));

-- Paquete Nube Pro: Almacenamiento y respaldos
INSERT INTO Paquete_Servicio VALUES
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Paquete Nube Pro'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'Almacenamiento en la Nube')),
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Paquete Nube Pro'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'Respaldos Automaticos'));

-- Paquete Web Start: Dominio y hosting web
INSERT INTO Paquete_Servicio VALUES
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Paquete Web Start'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'Dominio Web')),
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Paquete Web Start'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'Hosting Web'));

-- Paquete Seguridad: Antivirus y Firewall
INSERT INTO Paquete_Servicio VALUES
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Paquete Seguridad'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'Antivirus Avanzado')),
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Paquete Seguridad'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'Firewall Empresarial'));

-- Paquete Gamer: Internet rapido y Juegos
INSERT INTO Paquete_Servicio VALUES
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Paquete Gamer'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'Internet Corporativo 200Mbps')),
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Paquete Gamer'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'Paquete de Juegos'));

-- Paquete Streaming: TV HD y Streaming
INSERT INTO Paquete_Servicio VALUES
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Paquete Streaming'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'TV HD Premium')),
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Paquete Streaming'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'Streaming de Video'));

-- Plan Emprendedor: Correo, Dominio y Hosting
INSERT INTO Paquete_Servicio VALUES
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Plan Emprendedor'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'Correo Corporativo')),
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Plan Emprendedor'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'Dominio Web')),
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Plan Emprendedor'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'Hosting Web'));

-- Plan Corporativo: VPN, Soporte y Antivirus
INSERT INTO Paquete_Servicio VALUES
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Plan Corporativo'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'VPN Dedicada')),
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Plan Corporativo'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'Soporte Tecnico 24/7')),
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Plan Corporativo'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'Antivirus Avanzado'));

-- Plan Data Center: Servidor y Respaldos
INSERT INTO Paquete_Servicio VALUES
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Plan Data Center'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'Servidor Virtual')),
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Plan Data Center'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'Respaldos Automaticos'));


DELIMITER //

DROP PROCEDURE IF EXISTS sp_generar_factura_mensual //

CREATE PROCEDURE sp_generar_factura_mensual(IN p_id_usuario INT)
BEGIN
    DECLARE v_fecha_emision DATETIME;
    DECLARE v_fecha_vencimiento DATETIME;
    DECLARE v_total DECIMAL(10,2) DEFAULT 0;
    DECLARE v_id_factura INT;
    DECLARE v_factura_existente INT DEFAULT 0;

    -- Establecer fecha de corte al 14 del mes actual
    SET v_fecha_emision = DATE_FORMAT(CURRENT_DATE(), '%Y-%m-14');
    SET v_fecha_vencimiento = DATE_ADD(v_fecha_emision, INTERVAL 15 DAY);

    -- Verificar si ya existe una factura para el usuario en la fecha de emisión actual
    SELECT COUNT(*)
    INTO v_factura_existente
    FROM Facturas
    WHERE id_usuario = p_id_usuario
      AND fecha_emision = v_fecha_emision;

    IF v_factura_existente = 0 THEN
        -- Calcular el total de consumo por paquetes contratados por el usuario
        SELECT 
            IFNULL(SUM(p.precio), 0)
        INTO v_total
        FROM 
            Servicios_Contratados sc
        JOIN Servicios s ON sc.id_servicio = s.id_servicio
        JOIN Paquete_Servicio ps ON s.id_servicio = ps.id_servicio
        JOIN Paquetes p ON ps.id_paquete = p.id_paquete AND p.estado_paquete = 'Activo'
        WHERE 
            sc.id_usuario = p_id_usuario;

        -- Insertar la factura principal
        INSERT INTO Facturas (id_usuario, fecha_emision, fecha_vencimiento, total, estado_pago)
        VALUES (p_id_usuario, v_fecha_emision, v_fecha_vencimiento, v_total, 'Pendiente');

        SET v_id_factura = LAST_INSERT_ID();

        -- Insertar detalles: paquetes contratados
        INSERT INTO Factura_Detalle (id_factura, descripcion, monto, tipo)
        SELECT 
            v_id_factura,
            CONCAT('Paquete: ', p.nombre_paquete, ' - Servicio: ', s.nombre_servicio),
            p.precio,
            'Paquete'
        FROM 
            Servicios_Contratados sc
        JOIN Servicios s ON sc.id_servicio = s.id_servicio
        JOIN Paquete_Servicio ps ON s.id_servicio = ps.id_servicio
        JOIN Paquetes p ON ps.id_paquete = p.id_paquete AND p.estado_paquete = 'Activo'
        WHERE 
            sc.id_usuario = p_id_usuario;

        -- Insertar detalles: consumo de datos hasta el 14 del mes actual
        INSERT INTO Factura_Detalle (id_factura, descripcion, monto, tipo)
        SELECT 
            v_id_factura,
            CONCAT('Consumo de datos - Servicio: ', s.nombre_servicio),
            0, -- Aquí no se cobra por MB, solo se detalla (puedes cambiar si es necesario)
            'Consumo'
        FROM 
            Consumo_Datos cd
        JOIN Servicios s ON cd.id_servicio = s.id_servicio
        WHERE 
            cd.id_usuario = p_id_usuario
            AND cd.fecha <= v_fecha_emision
        GROUP BY cd.id_servicio;
    END IF;

END //

DELIMITER ;



DELIMITER //

CREATE PROCEDURE sp_consultar_valores_a_pagar_usuario(IN p_id_usuario INT)
BEGIN
    SELECT 
        u.id_usuario,
        CONCAT(u.nombre, ' ', u.apellido) AS nombre_completo,
        SUM(DISTINCT p.precio) AS total_a_pagar
    FROM 
        Usuarios u
    JOIN 
        Servicios_Contratados sc ON u.id_usuario = sc.id_usuario
    JOIN 
        Servicios s ON sc.id_servicio = s.id_servicio
    JOIN 
        Paquete_Servicio ps ON s.id_servicio = ps.id_servicio
    JOIN 
        Paquetes p ON ps.id_paquete = p.id_paquete
    WHERE
        p.estado_paquete = 'Activo'
        AND u.id_usuario = p_id_usuario
    GROUP BY 
        u.id_usuario, u.nombre, u.apellido
    ORDER BY 
        u.id_usuario;
END//

DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_consultar_servicios_usuario(IN p_id_usuario INT)
BEGIN
    SELECT 
        u.id_usuario,
        CONCAT(u.nombre, ' ', u.apellido) AS nombre_completo,
        u.email,
        JSON_ARRAYAGG(
            JSON_OBJECT(
                'id_servicio', s.id_servicio,
                'nombre_servicio', s.nombre_servicio
            )
        ) AS servicios_json
    FROM 
        Usuarios u
    JOIN 
        Servicios_Contratados sc ON u.id_usuario = sc.id_usuario
    JOIN 
        Servicios s ON sc.id_servicio = s.id_servicio
    WHERE
        u.id_usuario = p_id_usuario
    GROUP BY 
        u.id_usuario, u.nombre, u.apellido, u.email;
END//

DELIMITER ;

DELIMITER //
DROP PROCEDURE IF EXISTS sp_consultar_consumo_paquetes_usuario//
CREATE PROCEDURE sp_consultar_consumo_paquetes_usuario(IN p_id_usuario INT)
BEGIN
    SELECT 
        u.id_usuario,
        CONCAT(u.nombre, ' ', u.apellido) AS nombre_completo,
        
        -- Datos del paquete
        p.id_paquete,
        p.nombre_paquete,
        p.precio AS precio_paquete,

        -- Datos del servicio
        s.id_servicio,
        s.nombre_servicio,

        -- Consumo por servicio dentro del paquete
        IFNULL(SUM(cd.consumo_mb), 0) AS consumo_mb
    FROM 
        Usuarios u
    JOIN 
        Servicios_Contratados sc ON u.id_usuario = sc.id_usuario
    JOIN 
        Servicios s ON sc.id_servicio = s.id_servicio
    JOIN 
        Paquete_Servicio ps ON s.id_servicio = ps.id_servicio
    JOIN 
        Paquetes p ON ps.id_paquete = p.id_paquete AND p.estado_paquete = 'Activo'
    LEFT JOIN 
        Consumo_Datos cd ON cd.id_usuario = u.id_usuario 
                         AND cd.id_servicio = s.id_servicio 
                         AND cd.id_paquete = p.id_paquete
    WHERE
        u.id_usuario = p_id_usuario
    GROUP BY 
        u.id_usuario, u.nombre, u.apellido,
        p.id_paquete, p.nombre_paquete, p.precio,
        s.id_servicio, s.nombre_servicio
    ORDER BY
        p.id_paquete, s.id_servicio;
END//

DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_obtener_todos_usuarios()
BEGIN
    SELECT * FROM Usuarios;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_obtener_usuario_por_id(
    IN p_id_usuario INT
)
BEGIN
    SELECT * FROM Usuarios WHERE id_usuario = p_id_usuario;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE sp_login_usuario(IN p_email VARCHAR(150))
BEGIN
    SELECT 
        id_usuario,
        nombre,
        apellido,
        email,
        contrasena_hash,
        estado_cuenta,
        fecha_registro
    FROM Usuarios
    WHERE email = p_email;
END//

DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_eliminar_usuario(
    IN p_id_usuario INT
)
BEGIN
    DELETE FROM Usuarios WHERE id_usuario = p_id_usuario;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_crear_usuario(
    IN p_nombre VARCHAR(100),
    IN p_apellido VARCHAR(100),
    IN p_email VARCHAR(150),
    IN p_contrasena_hash VARCHAR(255),
    IN p_estado_cuenta VARCHAR(50),
    OUT p_nuevo_id INT
)
BEGIN
    INSERT INTO Usuarios (nombre, apellido, email, contrasena_hash, estado_cuenta)
    VALUES (p_nombre, p_apellido, p_email, p_contrasena_hash, p_estado_cuenta);

    SET p_nuevo_id = LAST_INSERT_ID();
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_actualizar_usuario(
    IN p_id_usuario INT,
    IN p_nombre VARCHAR(100),
    IN p_apellido VARCHAR(100),
    IN p_email VARCHAR(150),
    IN p_estado_cuenta VARCHAR(50)
)
BEGIN
    UPDATE Usuarios
    SET nombre = p_nombre,
        apellido = p_apellido,
        email = p_email,
        estado_cuenta = p_estado_cuenta
    WHERE id_usuario = p_id_usuario;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_obtener_factura_id (
    IN p_id_factura INT
)
BEGIN
    SELECT * FROM Facturas WHERE id_factura = p_id_factura;
END //

DELIMITER ;

DELIMITER //

DROP PROCEDURE IF EXISTS sp_obtener_detalle_factura //

CREATE PROCEDURE sp_obtener_detalle_factura(IN p_id_factura INT)
BEGIN
    SELECT 
        fd.id_detalle,
        fd.id_factura,
        fd.descripcion,
        fd.monto,
        fd.tipo
    FROM 
        Factura_Detalle fd
    WHERE 
        fd.id_factura = p_id_factura
    ORDER BY 
        fd.id_detalle;
END //

DELIMITER ;

DELIMITER //

DROP PROCEDURE IF EXISTS sp_obtener_cabeceras_factura_usuario //

CREATE PROCEDURE sp_obtener_cabeceras_factura_usuario(IN p_id_usuario INT)
BEGIN
    SELECT 
        f.id_factura,
        f.id_usuario,
        CONCAT(u.nombre, ' ', u.apellido) AS nombre_usuario,
        f.fecha_emision,
        f.fecha_vencimiento,
        f.total,
        f.estado_pago
    FROM 
        Facturas f
    JOIN 
        Usuarios u ON f.id_usuario = u.id_usuario
    WHERE 
        f.id_usuario = p_id_usuario
    ORDER BY 
        f.fecha_emision DESC;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_facturas_todas()
BEGIN
    SELECT * FROM Facturas;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_eliminar_factura (
    IN p_id_factura INT
)
BEGIN
    DELETE FROM Facturas WHERE id_factura = p_id_factura;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_crear_factura (
    IN p_id_usuario INT,
    IN p_fecha_emision DATETIME,
    IN p_fecha_vencimiento DATETIME,
    IN p_total DECIMAL(10,2),
    IN p_estado_pago VARCHAR(50)
)
BEGIN
    INSERT INTO Facturas (
        id_usuario, fecha_emision, fecha_vencimiento, total, estado_pago
    ) VALUES (
        p_id_usuario, p_fecha_emision, p_fecha_vencimiento, p_total, p_estado_pago
    );
END //

DELIMITER ;

DELIMITER //


CREATE PROCEDURE sp_actualizar_factura (
    IN p_id_factura INT,
    IN p_id_usuario INT,
    IN p_fecha_emision DATETIME,
    IN p_fecha_vencimiento DATETIME,
    IN p_total DECIMAL(10,2),
    IN p_estado_pago VARCHAR(50)
)
BEGIN
    UPDATE Facturas
    SET
        id_usuario = p_id_usuario,
        fecha_emision = p_fecha_emision,
        fecha_vencimiento = p_fecha_vencimiento,
        total = p_total,
        estado_pago = p_estado_pago
    WHERE id_factura = p_id_factura;
END //

DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_get_consumo_datos_usuario_mes(
    IN p_id_usuario INT,
    IN p_anio INT,
    IN p_mes INT
)
BEGIN
    SELECT *
    FROM Consumo_Datos
    WHERE id_usuario = p_id_usuario
      AND YEAR(fecha) = p_anio
      AND MONTH(fecha) = p_mes;
END //
DELIMITER ;




DELIMITER //
DROP PROCEDURE IF EXISTS sp_insert_consumo_datos//
CREATE PROCEDURE sp_insert_consumo_datos(
    IN p_id_usuario INT,
    IN p_id_servicio INT,
    IN p_id_paquete INT,
    IN p_fecha DATETIME,
    IN p_consumo_mb DECIMAL(10,2),
    IN p_limite_mb DECIMAL(10,2)
)
BEGIN
    DECLARE usuario_existe INT DEFAULT 0;
    DECLARE servicio_existe INT DEFAULT 0;
    DECLARE contrato_existe INT DEFAULT 0;
    DECLARE paquete_valido INT DEFAULT 0;

    -- Verificar existencia del usuario
    SELECT COUNT(*) INTO usuario_existe
    FROM Usuarios
    WHERE id_usuario = p_id_usuario;

    IF usuario_existe = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Usuario no existe';
    END IF;

    -- Verificar existencia del servicio
    SELECT COUNT(*) INTO servicio_existe
    FROM Servicios
    WHERE id_servicio = p_id_servicio;

    IF servicio_existe = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Servicio no existe';
    END IF;

    -- Verificar que el usuario tenga contratado ese servicio
    SELECT COUNT(*) INTO contrato_existe
    FROM Servicios_Contratados
    WHERE id_usuario = p_id_usuario
      AND id_servicio = p_id_servicio
      AND estado_contrato = 'Activo'
      AND (fecha_fin IS NULL OR fecha_fin > p_fecha);

    IF contrato_existe = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El usuario no tiene contratado ese servicio o contrato no vigente';
    END IF;

    -- Verificar que el servicio pertenece al paquete recibido
    SELECT COUNT(*) INTO paquete_valido
    FROM Paquete_Servicio
    WHERE id_paquete = p_id_paquete AND id_servicio = p_id_servicio;

    IF paquete_valido = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El servicio no pertenece al paquete indicado';
    END IF;

    -- Insertar el registro de consumo
    INSERT INTO Consumo_Datos (id_usuario, id_servicio, id_paquete, fecha, consumo_mb, limite_mb)
    VALUES (p_id_usuario, p_id_servicio, p_id_paquete, p_fecha, p_consumo_mb, p_limite_mb);
END //

DELIMITER ;
