DELIMITER //

CREATE PROCEDURE sp_obtener_usuario_por_id(
    IN p_id_usuario INT
)
BEGIN
    SELECT * FROM Usuarios WHERE id_usuario = p_id_usuario;
END //

DELIMITER ;
