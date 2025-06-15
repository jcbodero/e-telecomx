DELIMITER //

CREATE PROCEDURE sp_crear_factura (
    IN p_id_usuario INT,
    IN p_fecha_emision DATETIME,
    IN p_fecha_vencimiento DATETIME,
    IN p_total DECIMAL(10,2),
    IN p_estado_pago VARCHAR(50)
)
BEGIN
    INSERT INTO Facturas (
        id_usuario, fecha_emision, fecha_vencimiento, total, estado_pago
    ) VALUES (
        p_id_usuario, p_fecha_emision, p_fecha_vencimiento, p_total, p_estado_pago
    );
END //

DELIMITER ;
