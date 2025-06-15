DELIMITER //

CREATE PROCEDURE sp_obtener_factura_id (
    IN p_id_factura INT
)
BEGIN
    SELECT * FROM Facturas WHERE id_factura = p_id_factura;
END //

DELIMITER ;
