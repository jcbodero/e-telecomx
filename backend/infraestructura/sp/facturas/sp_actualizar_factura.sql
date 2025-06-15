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

