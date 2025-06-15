DELIMITER $$

DROP PROCEDURE IF EXISTS sp_generar_factura_mensual $$

CREATE PROCEDURE sp_generar_factura_mensual(IN p_id_usuario INT)
BEGIN
    DECLARE v_fecha_emision DATETIME;
    DECLARE v_fecha_vencimiento DATETIME;
    DECLARE v_total DECIMAL(10,2) DEFAULT 0;
    DECLARE v_id_factura INT;

    -- Establecer fecha de corte al 14 del mes actual
    SET v_fecha_emision = DATE_FORMAT(CURRENT_DATE(), '%Y-%m-14');
    SET v_fecha_vencimiento = DATE_ADD(v_fecha_emision, INTERVAL 15 DAY);

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

END $$

DELIMITER ;
