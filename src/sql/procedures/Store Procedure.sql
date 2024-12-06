-- Eliminar el procedimiento si ya existe
DROP PROCEDURE IF EXISTS update_driver_info;

DELIMITER //

-- Crear el procedimiento almacenado update_driver_info
CREATE PROCEDURE update_driver_info(
    IN pDriverId INT,
    IN pNewNationality VARCHAR(255),
    IN pNewNumber INT,
    IN pNewForename VARCHAR(255),
    IN pNewSurname VARCHAR(255)
)
BEGIN
    -- Actualizar la nacionalidad si se proporciona un nuevo valor
    IF pNewNationality IS NOT NULL THEN
        UPDATE drivers SET nationality = pNewNationality WHERE driverId = pDriverId;
    END IF;

    -- Actualizar el número si se proporciona un nuevo valor
    IF pNewNumber IS NOT NULL THEN
        UPDATE drivers SET number = pNewNumber WHERE driverId = pDriverId;
    END IF;

    -- Actualizar el nombre si se proporciona un nuevo valor
    IF pNewForename IS NOT NULL THEN
        UPDATE drivers SET forename = pNewForename WHERE driverId = pDriverId;
    END IF;

    -- Actualizar el apellido si se proporciona un nuevo valor
    IF pNewSurname IS NOT NULL THEN
        UPDATE drivers SET surname = pNewSurname WHERE driverId = pDriverId;
    END IF;
END //

DELIMITER ;

-- Actualizar la nacionalidad del conductor con ID 123 a 'Belgian'
CALL update_driver_info(123, 'Belgian', NULL, NULL, NULL);

-- Actualizar el número del conductor con ID 123 a 123
CALL update_driver_info(123, NULL, 123, NULL, NULL);

-- Actualizar el nombre del conductor con ID 123 a 'Thierry'
CALL update_driver_info(123, NULL, NULL, 'Thierry', NULL);

-- Actualizar el apellido del conductor con ID 123 a 'Boutsen'
CALL update_driver_info(123, NULL, NULL, NULL, 'Boutsen');

-- Actualizar todos los campos (excepto la fecha de nacimiento y el enlace de Wikipedia.

-- Actualizar todos los campos del conductor con ID 123: nacionalidad, número, nombre y apellido
CALL update_driver_info(123, 'Belgian', 123, 'Thierry', 'Boutsen');














