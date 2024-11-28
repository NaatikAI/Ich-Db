DELIMITER $$

CREATE TRIGGER actualizar_estado_suscripcion
AFTER INSERT ON Cancelaciones
FOR EACH ROW
BEGIN
    UPDATE Suscripciones
    SET estado = 'cancelada', fecha_fin = NEW.fecha_cancelacion
    WHERE suscripcion_id = NEW.suscripcion_id;
END$$

DELIMITER ;
