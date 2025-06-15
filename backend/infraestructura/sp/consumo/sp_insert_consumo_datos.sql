DROP PROCEDURE IF EXISTS sp_insert_consumo_datos;

DELIMITER //

CREATE PROCEDURE sp_insert_consumo_datos(
    IN p_id_usuario INT,
    IN p_id_servicio INT,
    IN p_id_paquete INT,
    IN p_fecha DATETIME,
    IN p_consumo_mb DECIMAL(10,2),
    IN p_limite_mb DECIMAL(10,2)
)
BEGIN
    DECLARE usuario_existe INT DEFAULT 0;
    DECLARE servicio_existe INT DEFAULT 0;
    DECLARE contrato_existe INT DEFAULT 0;
    DECLARE paquete_valido INT DEFAULT 0;

    -- Verificar existencia del usuario
    SELECT COUNT(*) INTO usuario_existe
    FROM Usuarios
    WHERE id_usuario = p_id_usuario;

    IF usuario_existe = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Usuario no existe';
    END IF;

    -- Verificar existencia del servicio
    SELECT COUNT(*) INTO servicio_existe
    FROM Servicios
    WHERE id_servicio = p_id_servicio;

    IF servicio_existe = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Servicio no existe';
    END IF;

    -- Verificar que el usuario tenga contratado ese servicio
    SELECT COUNT(*) INTO contrato_existe
    FROM Servicios_Contratados
    WHERE id_usuario = p_id_usuario
      AND id_servicio = p_id_servicio
      AND estado_contrato = 'Activo'
      AND (fecha_fin IS NULL OR fecha_fin > p_fecha);

    IF contrato_existe = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El usuario no tiene contratado ese servicio o contrato no vigente';
    END IF;

    -- Verificar que el servicio pertenece al paquete recibido
    SELECT COUNT(*) INTO paquete_valido
    FROM Paquete_Servicio
    WHERE id_paquete = p_id_paquete AND id_servicio = p_id_servicio;

    IF paquete_valido = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El servicio no pertenece al paquete indicado';
    END IF;

    -- Insertar el registro de consumo
    INSERT INTO Consumo_Datos (id_usuario, id_servicio, id_paquete, fecha, consumo_mb, limite_mb)
    VALUES (p_id_usuario, p_id_servicio, p_id_paquete, p_fecha, p_consumo_mb, p_limite_mb);
END //

DELIMITER ;
