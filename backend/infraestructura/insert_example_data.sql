ALTER TABLE Usuarios AUTO_INCREMENT = 1;
ALTER TABLE Servicios AUTO_INCREMENT = 1;
ALTER TABLE Paquetes AUTO_INCREMENT = 1;
ALTER TABLE Servicios_Contratados AUTO_INCREMENT = 1;

INSERT INTO Usuarios (nombre, apellido, email, contraseña_hash, estado_cuenta)
VALUES 
('Carlos', 'Mendoza', 'carlos.mendoza@example.com', 'hash1', 'activo'),
('Laura', 'Fernández', 'laura.fernandez@example.com', 'hash2', 'activo'),
('Juan', 'Pérez', 'juan.perez@example.com', 'hash3', 'inactivo'),
('Ana', 'García', 'ana.garcia@example.com', 'hash4', 'activo'),
('Luis', 'Ramírez', 'luis.ramirez@example.com', 'hash5', 'suspendido'),
('María', 'López', 'maria.lopez@example.com', 'hash6', 'activo'),
('José', 'Martínez', 'jose.martinez@example.com', 'hash7', 'activo'),
('Paula', 'Sánchez', 'paula.sanchez@example.com', 'hash8', 'inactivo'),
('Miguel', 'Torres', 'miguel.torres@example.com', 'hash9', 'activo'),
('Lucía', 'Reyes', 'lucia.reyes@example.com', 'hash10', 'activo'),
('Andrés', 'Cabrera', 'andres.cabrera@example.com', 'hash11', 'activo'),
('Carmen', 'Ríos', 'carmen.rios@example.com', 'hash12', 'suspendido'),
('Daniel', 'Castro', 'daniel.castro@example.com', 'hash13', 'activo'),
('Elena', 'Moreno', 'elena.moreno@example.com', 'hash14', 'activo'),
('Sergio', 'Vega', 'sergio.vega@example.com', 'hash15', 'inactivo'),
('Rosa', 'Navarro', 'rosa.navarro@example.com', 'hash16', 'activo'),
('David', 'Silva', 'david.silva@example.com', 'hash17', 'activo'),
('Isabel', 'Mora', 'isabel.mora@example.com', 'hash18', 'suspendido'),
('Hugo', 'Delgado', 'hugo.delgado@example.com', 'hash19', 'activo'),
('Natalia', 'Guzmán', 'natalia.guzman@example.com', 'hash20', 'activo');
INSERT INTO Servicios (nombre_servicio, tipo_servicio, estado_servicio)
VALUES
('Internet Hogar 50Mbps', 'Internet', 'activo'),
('Internet Corporativo 200Mbps', 'Internet', 'activo'),
('TV Cable Básico', 'Televisión', 'activo'),
('TV HD Premium', 'Televisión', 'activo'),
('Telefonía Ilimitada', 'Telefonía', 'activo'),
('Soporte Técnico 24/7', 'Soporte', 'activo'),
('Correo Corporativo', 'Correo', 'activo'),
('Firewall Empresarial', 'Seguridad', 'activo'),
('VPN Dedicada', 'Seguridad', 'activo'),
('Antivirus Avanzado', 'Seguridad', 'activo'),
('Monitoreo de Red', 'Infraestructura', 'activo'),
('Almacenamiento en la Nube', 'Nube', 'activo'),
('Respaldos Automáticos', 'Nube', 'activo'),
('Dominio Web', 'Web', 'activo'),
('Hosting Web', 'Web', 'activo'),
('Gestión de Dispositivos', 'Infraestructura', 'activo'),
('Servidor Virtual', 'Infraestructura', 'activo'),
('App Empresarial', 'Software', 'activo'),
('Streaming de Video', 'Multimedia', 'activo'),
('Paquete de Juegos', 'Multimedia', 'inactivo');
INSERT INTO Paquetes (nombre_paquete, descripcion, precio, estado_paquete)
VALUES
('Paquete Básico Hogar', 'Incluye Internet 50Mbps y TV básica', 29.99, 'activo'),
('Paquete Premium Hogar', 'Internet 100Mbps + TV HD + Telefonía', 49.99, 'activo'),
('Paquete Empresarial 1', 'Internet 200Mbps + Soporte 24/7', 79.99, 'activo'),
('Paquete Empresarial 2', 'Internet + VPN + Firewall', 99.99, 'activo'),
('Paquete Familiar', 'TV HD + Telefonía ilimitada', 39.99, 'activo'),
('Paquete Nube Pro', 'Almacenamiento y respaldos', 19.99, 'activo'),
('Paquete Web Start', 'Dominio y hosting web', 24.99, 'activo'),
('Paquete Seguridad', 'Antivirus + Firewall', 14.99, 'activo'),
('Paquete Gamer', 'Internet rápido + Juegos', 59.99, 'activo'),
('Paquete Streaming', 'TV HD + Streaming de Video', 44.99, 'activo'),
('Plan Emprendedor', 'Correo + Dominio + Hosting', 34.99, 'activo'),
('Plan Corporativo', 'VPN + Soporte + Antivirus', 89.99, 'activo'),
('Plan Data Center', 'Servidor + Respaldos', 129.99, 'activo'),
('Plan Básico PyME', 'Internet + Soporte', 54.99, 'activo'),
('Plan Multiservicio', 'Internet + TV + Antivirus', 64.99, 'activo'),
('Plan Avanzado', 'Todos los servicios empresariales', 149.99, 'activo'),
('Combo Cloud', 'Nube + Seguridad + Soporte', 74.99, 'activo'),
('Combo Hogar+', 'Internet + TV + Teléfono', 39.99, 'inactivo'),
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


-- Paquete Básico Hogar: Internet 50Mbps y TV básica
INSERT INTO Paquete_Servicio VALUES
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Paquete Básico Hogar'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'Internet Hogar 50Mbps')),
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Paquete Básico Hogar'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'TV Cable Básico'));

-- Paquete Premium Hogar: Internet 100Mbps + TV HD + Telefonía
-- Nota: Internet 100Mbps no está creado, supondré solo HD y Telefonía
INSERT INTO Paquete_Servicio VALUES
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Paquete Premium Hogar'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'TV HD Premium')),
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Paquete Premium Hogar'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'Telefonía Ilimitada'));

-- Paquete Empresarial 1: Internet 200Mbps + Soporte 24/7
INSERT INTO Paquete_Servicio VALUES
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Paquete Empresarial 1'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'Internet Corporativo 200Mbps')),
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Paquete Empresarial 1'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'Soporte Técnico 24/7'));

-- Paquete Empresarial 2: Internet + VPN + Firewall
INSERT INTO Paquete_Servicio VALUES
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Paquete Empresarial 2'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'Internet Corporativo 200Mbps')),
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Paquete Empresarial 2'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'VPN Dedicada')),
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Paquete Empresarial 2'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'Firewall Empresarial'));

-- Paquete Familiar: TV HD + Telefonía
INSERT INTO Paquete_Servicio VALUES
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Paquete Familiar'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'TV HD Premium')),
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Paquete Familiar'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'Telefonía Ilimitada'));

-- Paquete Nube Pro: Almacenamiento y respaldos
INSERT INTO Paquete_Servicio VALUES
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Paquete Nube Pro'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'Almacenamiento en la Nube')),
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Paquete Nube Pro'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'Respaldos Automáticos'));

-- Paquete Web Start: Dominio y hosting web
INSERT INTO Paquete_Servicio VALUES
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Paquete Web Start'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'Dominio Web')),
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Paquete Web Start'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'Hosting Web'));

-- Paquete Seguridad: Antivirus + Firewall
INSERT INTO Paquete_Servicio VALUES
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Paquete Seguridad'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'Antivirus Avanzado')),
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Paquete Seguridad'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'Firewall Empresarial'));

-- Paquete Gamer: Internet rápido + Juegos
INSERT INTO Paquete_Servicio VALUES
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Paquete Gamer'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'Internet Corporativo 200Mbps')),
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Paquete Gamer'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'Paquete de Juegos'));

-- Paquete Streaming: TV HD + Streaming
INSERT INTO Paquete_Servicio VALUES
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Paquete Streaming'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'TV HD Premium')),
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Paquete Streaming'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'Streaming de Video'));

-- Plan Emprendedor: Correo + Dominio + Hosting
INSERT INTO Paquete_Servicio VALUES
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Plan Emprendedor'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'Correo Corporativo')),
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Plan Emprendedor'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'Dominio Web')),
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Plan Emprendedor'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'Hosting Web'));

-- Plan Corporativo: VPN + Soporte + Antivirus
INSERT INTO Paquete_Servicio VALUES
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Plan Corporativo'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'VPN Dedicada')),
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Plan Corporativo'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'Soporte Técnico 24/7')),
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Plan Corporativo'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'Antivirus Avanzado'));

-- Plan Data Center: Servidor + Respaldos
INSERT INTO Paquete_Servicio VALUES
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Plan Data Center'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'Servidor Virtual')),
((SELECT id_paquete FROM Paquetes WHERE nombre_paquete = 'Plan Data Center'),
 (SELECT id_servicio FROM Servicios WHERE nombre_servicio = 'Respaldos Automáticos'));

-- ... Y puedes continuar igual con los demás paquetes
