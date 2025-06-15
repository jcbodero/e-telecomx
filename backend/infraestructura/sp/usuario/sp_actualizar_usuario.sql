DELIMITER //

CREATE PROCEDURE sp_actualizar_usuario(
    IN p_id_usuario INT,
    IN p_nombre VARCHAR(100),
    IN p_apellido VARCHAR(100),
    IN p_email VARCHAR(150),
    IN p_estado_cuenta VARCHAR(50)
)
BEGIN
    UPDATE Usuarios
    SET nombre = p_nombre,
        apellido = p_apellido,
        email = p_email,
        estado_cuenta = p_estado_cuenta
    WHERE id_usuario = p_id_usuario;
END //

DELIMITER ;
