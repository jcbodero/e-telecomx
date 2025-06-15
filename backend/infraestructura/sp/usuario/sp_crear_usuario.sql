DELIMITER //

CREATE PROCEDURE sp_crear_usuario(
    IN p_nombre VARCHAR(100),
    IN p_apellido VARCHAR(100),
    IN p_email VARCHAR(150),
    IN p_contraseña_hash VARCHAR(255),
    IN p_estado_cuenta VARCHAR(50),
    OUT p_nuevo_id INT
)
BEGIN
    INSERT INTO Usuarios (nombre, apellido, email, contraseña_hash, estado_cuenta)
    VALUES (p_nombre, p_apellido, p_email, p_contraseña_hash, p_estado_cuenta);

    SET p_nuevo_id = LAST_INSERT_ID();
END //

DELIMITER ;
