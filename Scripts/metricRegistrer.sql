DELIMITER $$

CREATE TRIGGER calcular_metrica_churn_rate
AFTER INSERT ON Cancelaciones
FOR EACH ROW
BEGIN
    DECLARE clientes_iniciales INT;
    DECLARE clientes_finales INT;

    -- Calcular clientes iniciales
    SELECT COUNT(*) INTO clientes_iniciales
    FROM Clientes
    WHERE estado = 'activo';

    -- Calcular clientes finales
    SELECT COUNT(*) INTO clientes_finales
    FROM Clientes
    WHERE cliente_id NOT IN (
        SELECT cliente_id FROM Suscripciones WHERE estado = 'cancelada'
    );

    -- Insertar métrica en la tabla
    INSERT INTO Churn_Rate_Metricas (fecha_inicio_periodo, fecha_fin_periodo, clientes_iniciales, clientes_finales)
    VALUES (DATE_SUB(NOW(), INTERVAL 1 MONTH), NOW(), clientes_iniciales, clientes_finales);
END$$

DELIMITER ;
