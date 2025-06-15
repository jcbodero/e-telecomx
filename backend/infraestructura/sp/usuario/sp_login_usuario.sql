DELIMITER $$

CREATE PROCEDURE sp_login_usuario(IN p_email VARCHAR(150))
BEGIN
    SELECT 
        id_usuario,
        nombre,
        apellido,
        email,
        contrasena_hash,
        estado_cuenta,
        fecha_registro
    FROM Usuarios
    WHERE email = p_email;
END$$

DELIMITER ;
