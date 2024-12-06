--  Esta tabla se crea para registrar los resultados de las carreras, almacenando la driverId, raceId, position, 
-- y un action_time que indica cuándo se registró el resultado.

CREATE TABLE IF NOT EXISTS results_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    driverId INT,
    raceId INT,
    position INT,
    log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Crear un procedimiento almacenado que inserte un registro en la tabla results y mantenga la tabla results_log actualizada
DELIMITER $$

CREATE PROCEDURE insert_result(
    IN p_driverId INT,
    IN p_raceId INT,
    IN p_position INT
)
BEGIN
    -- Insertar el nuevo resultado en la tabla results
    INSERT INTO results (driverId, raceId, position)
    VALUES (p_driverId, p_raceId, p_position);

    -- Insertar el nuevo registro en la tabla results_log
    INSERT INTO results_log (driverId, raceId, position)
    VALUES (p_driverId, p_raceId, p_position);
END$$

DELIMITER ;


USE Formula1DB;
-- Insertar datos de ejemplo en la tabla 'results_log'
INSERT INTO results_log (driverId, raceId, position, log_time, user_id) VALUES
(1, 101, 1, '2024-07-31 14:00:00', 1),  -- Ejemplo de registro con datos ficticios
(2, 102, 2, '2024-07-31 15:00:00', 2),  -- Otro ejemplo de registro
(3, 103, 3, '2024-07-31 16:00:00', 3);  -- Otro ejemplo de registro


-- Llamar al procedimiento almacenado para insertar un resultado y mantener la tabla de logs actualizada
CALL insert_result(1, 101, 1);