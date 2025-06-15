DELIMITER //

CREATE PROCEDURE sp_eliminar_factura (
    IN p_id_factura INT
)
BEGIN
    DELETE FROM Facturas WHERE id_factura = p_id_factura;
END //

DELIMITER ;
