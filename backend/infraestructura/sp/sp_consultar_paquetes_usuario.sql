DELIMITER $$
DROP PROCEDURE IF EXISTS sp_consultar_consumo_paquetes_usuario;
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
END$$

DELIMITER ;
