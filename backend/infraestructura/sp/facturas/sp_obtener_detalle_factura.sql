DELIMITER $$

DROP PROCEDURE IF EXISTS sp_obtener_detalle_factura $$

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
END $$

DELIMITER ;
