# Proyecto Fórmula 1

![eer readme github formula1](https://github.com/user-attachments/assets/c90f9e0f-ff6a-452f-a85c-3478a69b0a61)

## Resumen del Proyecto

### 1. Diseño y Creación - Base de Datos MySQL
- Descripción del diseño y estructuración de una base de datos MySQL optimizada para almacenar y gestionar eficientemente la información necesaria para el análisis.

### 2. MySQL Workbench
- Gestión de usuarios y permisos, implementación de triggers, procedimientos almacenados y funciones SQL, así como la creación de un diagrama ER para visualizar la estructura de la base de datos.

### 3. Análisis de Datos - Google Colab
- Uso de Google Colab para realizar consultas SQL avanzadas, como `SELECT`, `GROUP BY`, `JOIN`, `EXCEPT`, `WHERE`, `INSERT`, `UPDATE`, `DELETE` y `ORDER BY`.

### 4. Google Colab - Visualización
- Generación de gráficos y visualizaciones clave para comprender mejor los patrones y tendencias en los datos.

### 5. Principales Conclusiones
- Identificación de los factores clave que influyen en el rendimiento de los pilotos, equipos y carreras de Fórmula 1.

## Estructura y Creación de Tablas en MySQL

```sql
CREATE TABLE circuits (
    circuitId int AUTO_INCREMENT NOT NULL,
    circuitRef varchar(50) NOT NULL,
    name varchar(100) NOT NULL,
    location varchar(50) NOT NULL,
    country varchar(50) NOT NULL,
    lat float NOT NULL,
    lng float NOT NULL,
    alt int NULL,
    url varchar(255) NOT NULL,
    PRIMARY KEY (`circuitId`)
);
```

- `circuits`: 73
- `constructors`: 208
- `drivers`: 842
- `races`: 997
- `results`: 23,727
- `results_log`: 4
- `users`: 3

## Gestión de Usuarios y Permisos

```sql
CREATE USER 'manager_user'@'localhost' IDENTIFIED BY 'manager_pass';
CREATE USER 'employee_user'@'localhost' IDENTIFIED BY 'employee_pass';
CREATE USER 'analyst_user'@'localhost' IDENTIFIED BY 'analyst_pass';

GRANT INSERT ON Formula1DB.* TO 'employee_user'@'localhost';
GRANT INSERT, CREATE TEMPORARY TABLES ON Formula1DB.* TO 'analyst_user'@'localhost';
```

## Implementación de Triggers y Procedimientos Almacenados

```sql
DELIMITER //

CREATE TRIGGER actualizar_clasificacion
AFTER INSERT ON results
FOR EACH ROW
BEGIN
    UPDATE drivers
    SET points = points + NEW.points
    WHERE driverId = NEW.driverId;
END//

DELIMITER ;

DELIMITER //

CREATE PROCEDURE update_driver_info(
    IN pDriverId INT,
    IN pNewNationality VARCHAR(255),
    IN pNewNumber INT,
    IN pNewForename VARCHAR(255),
    IN pNewSurname VARCHAR(255)
)
BEGIN
    IF pNewNationality IS NOT NULL THEN
        UPDATE drivers 
        SET nationality = pNewNationality 
        WHERE driverId = pDriverId;
    END IF;

    IF pNewNumber IS NOT NULL THEN
        UPDATE drivers 
        SET number = pNewNumber 
        WHERE driverId = pDriverId;
    END IF;

    IF pNewForename IS NOT NULL THEN
        UPDATE drivers 
        SET forename = pNewForename 
        WHERE driverId = pDriverId;
    END IF;

    IF pNewSurname IS NOT NULL THEN
        UPDATE drivers 
        SET surname = pNewSurname 
        WHERE driverId = pDriverId;
    END IF;
END //

DELIMITER ;
```

## Análisis y Visualización en Google Colab

```python
import mysql.connector
from dotenv import load_dotenv
import os

load_dotenv()

config = {
    'user': os.getenv('DB_USER'),
    'password': os.getenv('DB_PASSWORD'),
    'host': os.getenv('DB_HOST'),
    'database': os.getenv('DB_NAME')
}

conn = mysql.connector.connect(**config)
cursor = conn.cursor()

query = "SELECT * FROM nombre_tabla"
cursor.execute(query)

results = cursor.fetchall()
for row in results:
    print(row)

cursor.close()
conn.close()
```

## Insights y Conclusiones

- Identificación de los factores clave que influyen en el rendimiento de los pilotos, equipos y carreras de Fórmula 1.

## Imágenes y Visualizaciones

![Graph Placeholder](image_path_here)
