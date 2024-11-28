DELIMITER $$

CREATE PROCEDURE calcular_churn_rate_periodo(
    IN p_fecha_inicio DATE,
    IN p_fecha_fin DATE
)
BEGIN
    DECLARE clientes_iniciales INT;
    DECLARE clientes_finales INT;
    DECLARE tasa_churn DECIMAL(5, 2);

    -- Calcular clientes iniciales
    SELECT COUNT(*) INTO clientes_iniciales
    FROM Suscripciones
    WHERE fecha_inicio <= p_fecha_inicio;

    -- Calcular clientes finales
    SELECT COUNT(*) INTO clientes_finales
    FROM Suscripciones
    WHERE fecha_fin > p_fecha_fin OR estado = 'activa';

    -- Calcular tasa de churn
    SET tasa_churn = (clientes_iniciales - clientes_finales) / clientes_iniciales * 100;

    -- Mostrar resultados
    SELECT p_fecha_inicio AS inicio_periodo, p_fecha_fin AS fin_periodo,
           clientes_iniciales, clientes_finales, tasa_churn AS tasa_de_churn;
END$$

DELIMITER ;
