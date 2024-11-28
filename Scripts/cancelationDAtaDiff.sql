DELIMITER $$

CREATE TRIGGER validar_fecha_cancelacion
BEFORE INSERT ON Cancelaciones
FOR EACH ROW
BEGIN
    DECLARE fecha_inicio DATE;
    SELECT fecha_inicio INTO fecha_inicio
    FROM Suscripciones
    WHERE suscripcion_id = NEW.suscripcion_id;

    IF NEW.fecha_cancelacion < fecha_inicio THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La fecha de cancelación no puede ser anterior a la fecha de inicio de la suscripción.';
    END IF;
END$$

DELIMITER ;
