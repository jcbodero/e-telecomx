DELIMITER //

CREATE PROCEDURE sp_obtener_todos_usuarios()
BEGIN
    SELECT * FROM Usuarios;
END //

DELIMITER ;
