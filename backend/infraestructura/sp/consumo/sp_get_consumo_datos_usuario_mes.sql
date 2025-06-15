DELIMITER //
CREATE PROCEDURE sp_get_consumo_datos_usuario_mes(
    IN p_id_usuario INT,
    IN p_anio INT,
    IN p_mes INT
)
BEGIN
    SELECT *
    FROM Consumo_Datos
    WHERE id_usuario = p_id_usuario
      AND YEAR(fecha) = p_anio
      AND MONTH(fecha) = p_mes;
END //
DELIMITER ;
