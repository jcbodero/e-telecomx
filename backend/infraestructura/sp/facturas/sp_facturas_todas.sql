DELIMITER //

CREATE PROCEDURE sp_facturas_todas()
BEGIN
    SELECT * FROM Facturas;
END //

DELIMITER ;
