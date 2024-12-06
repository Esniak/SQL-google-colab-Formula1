USE Formula1DB;
DROP FUNCTION IF EXISTS average_points;

DELIMITER //

CREATE FUNCTION average_points(p_driverId INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE avg_points DECIMAL(10,2);
    
    -- Calcular el promedio de puntos
    SELECT AVG(points) INTO avg_points
    FROM results
    WHERE driverId = p_driverId;
    
    RETURN avg_points;
END //

DELIMITER ;

-- Probar la función average_points con un driverId específico
SELECT driverId, average_points(driverId) AS avg_points
FROM drivers
WHERE driverId = 1;  -- Puedes cambiar el driverId para probar con diferentes pilotos

-- Seleccionar el driverId y el promedio de puntos para los primeros 10 pilotos
SELECT driverId, average_points(driverId)
FROM drivers
LIMIT 10;

-- Seleccionar el driverId y el promedio de puntos para pilotos específicos con IDs 1, 2, 3, 4 y 5
SELECT driverId, average_points(driverId)
FROM drivers
WHERE driverId IN (1, 12, 39, 48, 127);

-- Seleccionar el driverId y el promedio de puntos para los pilotos de nacionalidad 'British', limitando a 10 resultados
SELECT driverId, average_points(driverId)
FROM drivers
WHERE nationality = 'British'
LIMIT 10;

-- Seleccionar el driverId y el promedio de puntos, ordenar por promedio de puntos en orden descendente, y mostrar los 10 mejores pilotos
SELECT driverId, average_points(driverId) AS avg_points
FROM drivers
ORDER BY avg_points DESC
LIMIT 10;
