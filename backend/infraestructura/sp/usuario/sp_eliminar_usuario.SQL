DELIMITER //

CREATE PROCEDURE sp_eliminar_usuario(
    IN p_id_usuario INT
)
BEGIN
    DELETE FROM Usuarios WHERE id_usuario = p_id_usuario;
END //

DELIMITER ;
