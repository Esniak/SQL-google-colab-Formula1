ALTER TABLE results DROP FOREIGN KEY fk_results_users;

SHOW CREATE TABLE results_log;
ALTER TABLE results_log DROP FOREIGN KEY fk_results_log_users;

SHOW CREATE TABLE results;

--  Vamos a crear una tabla llamada users que contendrá los usuarios ficticios con sus roles y contraseñas.

-- Asegúrate de estar utilizando la base de datos Formula1DB
USE Formula1DB;

-- Eliminar la tabla
DROP TABLE IF EXISTS users;

-- Crear la tabla 'users' con las columnas necesarias
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('manager', 'employee', 'analyst')  NOT NULL
);

-- Insertar usuarios ficticios en la tabla users
-- Cada usuario tiene un rol específico para demostrar diferentes niveles de acceso
INSERT INTO users (username, password, role) VALUES
('manager_user', 'manager_pass', 'manager'), -- Usuario con rol de manager
('employee_user', 'employee_pass', 'employee'), -- Usuario con rol de empleado
('analyst_user', 'analyst_pass', 'employee'); -- usuario con rol de empleado (analista)

SELECT User, Host FROM mysql.user WHERE User = 'manager_user' AND Host = 'localhost';
DROP USER 'analyst_user'@'localhost';

-- Crear usuario 'manager_user' 
CREATE USER 'manager_user'@'localhost' IDENTIFIED BY 'manager_pass';

-- Crear usuario employee_user en MySQL y asignar permisos
CREATE USER 'employee_user'@'localhost' IDENTIFIED BY 'employee_pass';

-- Crear usuario analyst_user en MySQL y asignar permisos
CREATE USER 'analyst_user'@'localhost' IDENTIFIED BY 'analyst_pass';

-- Añadir permiso de INSERT al usuario employee_user
GRANT INSERT ON Formula1DB.* TO 'employee_user'@'localhost';

-- Añadir permisos de INSERT y CREATE TEMPORARY TABLES al usuario analyst_user
GRANT INSERT, CREATE TEMPORARY TABLES ON Formula1DB.* TO 'analyst_user'@'localhost';



-- Crear la clave foránea 'fk_results_users' en la columna 'user_id' de la tabla 'results'
ALTER TABLE results
ADD CONSTRAINT `fk_results_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

-- Crear la clave foránea 'fk_results_log_users' en la columna 'user_id' de la tabla 'results_log'
ALTER TABLE results_log
ADD CONSTRAINT `fk_results_log_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);




















