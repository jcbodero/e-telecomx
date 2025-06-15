DELIMITER $$

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
END$$

DELIMITER ;
