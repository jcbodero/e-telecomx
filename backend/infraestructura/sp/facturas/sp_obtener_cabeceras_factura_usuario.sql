DELIMITER $$

DROP PROCEDURE IF EXISTS sp_obtener_cabeceras_factura_usuario $$

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
END $$

DELIMITER ;

