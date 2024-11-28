DELIMITER $$

CREATE PROCEDURE registrar_cancelacion(
    IN p_suscripcion_id INT,
    IN p_razon_id INT,
    IN p_fecha_cancelacion DATE,
    IN p_comentarios VARCHAR(255)
)
BEGIN
    -- Insertar la cancelación
    INSERT INTO Cancelaciones (suscripcion_id, razon_id, fecha_cancelacion, comentarios)
    VALUES (p_suscripcion_id, p_razon_id, p_fecha_cancelacion, p_comentarios);

    -- Actualizar el estado de la suscripción
    UPDATE Suscripciones
    SET estado = 'cancelada', fecha_fin = p_fecha_cancelacion
    WHERE suscripcion_id = p_suscripcion_id;
END$$

DELIMITER ;
