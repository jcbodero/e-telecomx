DELIMITER $$

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
END$$

DELIMITER ;
