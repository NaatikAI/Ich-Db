DELIMITER $$

CREATE PROCEDURE obtener_suscripciones_canceladas()
BEGIN
    SELECT
        c.cliente_id, c.nombre, p.nombre_plan, r.descripcion AS razon_cancelacion, canc.fecha_cancelacion
    FROM Cancelaciones canc
    INNER JOIN Suscripciones s ON canc.suscripcion_id = s.suscripcion_id
    INNER JOIN Clientes c ON s.cliente_id = c.cliente_id
    INNER JOIN Planes p ON s.plan_id = p.plan_id
    INNER JOIN Razones_Cancelacion r ON canc.razon_id = r.razon_id
    ORDER BY canc.fecha_cancelacion DESC;
END$$

DELIMITER ;
