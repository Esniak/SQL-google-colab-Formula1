-- -- Trigger 1: Actualizar la Clasificación de Pilotos (Drivers)

-- Descripción: Este trigger se ejecuta automáticamente después de insertar un nuevo resultado en la tabla results. Su propósito 
-- es actualizar la tabla drivers sumando los puntos obtenidos en la nueva carrera al total de puntos del piloto correspondiente.

-- Trigger para actualizar la clasificación de pilotos
DELIMITER //

CREATE TRIGGER actualizar_clasificacion
AFTER INSERT ON results
FOR EACH ROW
BEGIN
    UPDATE drivers
    SET points = points + NEW.points
    WHERE driverId = NEW.driverId;
END;

DELIMITER ;
-- Automatiza la actualización de la clasificación de los pilotos cada vez que se inserta un nuevo resultado, manteniendo los puntos siempre actualizados sin intervención manual.

--
--
--


-- Trigger 2: Mantener el Log de Resultados (Results Log)

-- Descripción: Estos triggers se encargan de registrar cada operación (INSERT, UPDATE, DELETE) que se realiza en la tabla results 
-- en una tabla de log llamada result_log. Esto nos permite llevar un historial de todas las modificaciones realizadas en los resultados de las carreras.
DELIMITER //

CREATE TRIGGER log_insert
AFTER INSERT ON results
FOR EACH ROW
BEGIN
    INSERT INTO result_log (operation, timestamp, result_id, new_data)
    VALUES ('INSERT', NOW(), NEW.resultId, NEW.points);
END//

CREATE TRIGGER log_update
AFTER UPDATE ON results
FOR EACH ROW
BEGIN
    INSERT INTO result_log (operation, timestamp, result_id, old_data, new_data)
    VALUES ('UPDATE', NOW(), OLD.resultId, OLD.points, NEW.points);
END//

CREATE TRIGGER log_delete
AFTER DELETE ON results
FOR EACH ROW
BEGIN
    INSERT INTO result_log (operation, timestamp, result_id, old_data)
    VALUES ('DELETE', NOW(), OLD.resultId, OLD.points);
END//

DELIMITER ;
--  Mantiene un registro detallado de todas las modificaciones en los resultados para auditoría, análisis histórico y recuperación en caso de errores.

