# Proyecto Fórmula 1
![Resumen del proyecto](https://drive.google.com/uc?export=view&id=1NjT6rSiszViQozX85aNBhXVKHaHCfA-a)

![Descripción de la imagen](https://drive.google.com/uc?export=view&id=1vsStXdwZCNa4WJsrm3-ifOIvt0Q99Oj2)


## Estructura del Proyecto

```
Proyecto_Formula1/
├── README.md               # Introducción al proyecto
├── LICENSE                 # Licencia del proyecto
├── src/
│   ├── config/
│   │   └── config.yaml      # Configuración segura del entorno
│   ├── sql/                 # Scripts SQL
│   │   ├── schema/          # Definición del esquema de la base de datos
│   │   ├── procedures/      # Procedimientos almacenados
│   │   ├── triggers/        # Triggers definidos
│   │   ├── functions/       # Funciones SQL
│   │   ├── logs/            # Registro de cambios y operaciones
│   │   └── users/           # Gestión de usuarios
│   └── main.py              # Script principal del proyecto
├── notebooks/
│   └── análisis_datos.ipynb # Notebook para análisis y visualización
├── tests/
│   ├── sql_tests/           # Pruebas para consultas SQL
│   └── python_tests/        # Pruebas unitarias para scripts Python
├── docs/
│   ├── arquitectura.md      # Documentación de la arquitectura del proyecto
│   ├── uso.md               # Instrucciones de uso del proyecto
│   └── contribución.md      # Guía para contribuidores
├── scripts/
│   ├── setup.sh             # Script de configuración del entorno
│   └── deploy.sh            # Script de despliegue
├── data/
│   ├── raw/                 # Datos originales en formato CSV
│   │   ├── Circuits.csv
│   │   ├── Constructors.csv
│   │   ├── Drivers.csv
│   │   ├── Races.csv
│   │   ├── Results.csv
└── .gitignore               # Exclusiones para el repositorio Git
```

## Explicación de los Archivos de Datos en el Repositorio

Los archivos de datos se encuentran en la carpeta `data/raw/` y están en formato CSV. Estos archivos contienen información histórica de la Fórmula 1, incluyendo circuitos, constructores, conductores, carreras y resultados.

- **circuits.csv**: Contiene información sobre los circuitos de carreras.
- **constructors.csv**: Contiene información sobre los constructores de los vehículos.
- **drivers.csv**: Contiene información sobre los conductores.
- **races.csv**: Contiene información sobre las carreras.
- **results.csv**: Contiene información sobre los resultados de las carreras.

## Detalles sobre los Scripts Principales y sus Funcionalidades

### 1. Base de Datos MySQL
- **Esquema**: El esquema incluye tablas relacionadas con circuitos, conductores, carreras, resultados y usuarios.
- **Triggers**: Automatizan operaciones como la actualización de puntos de los pilotos.
- **Procedimientos Almacenados**: Incluyen funciones como `update_driver_info` para actualizar datos de los pilotos.
- **Funciones SQL**: Ejemplo: `average_points_per_driverid` para calcular promedios de puntos.

### 2. Scripts y Notebooks
- **`main.py`**: Lógica principal del proyecto, incluyendo conexión a la base de datos y carga de datos.
- **Notebook**: Permite análisis y visualización en Google Colab con gráficos generados a partir de datos SQL.

### 3. Seguridad y Configuración
- **`config.yaml`**: Maneja configuraciones, sin incluir credenciales sensibles.
- **Archivo `.env`**: Almacena credenciales de forma segura, excluido del repositorio público con `.gitignore`.

### 1. Diseño y Creación - Base de Datos MySQL
- Descripción del diseño y estructuración de una base de datos MySQL optimizada para almacenar y gestionar eficientemente la información necesaria para el análisis.
  
## Tablas del Proyecto

### circuits
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
- Filas insertadas: 73

### constructors
```sql
CREATE TABLE constructors (
    constructorId int AUTO_INCREMENT NOT NULL,
    constructorRef varchar(50) NOT NULL,
    name varchar(100) NOT NULL,
    nationality varchar(50) NOT NULL,
    url varchar(255) NOT NULL,
    PRIMARY KEY (`constructorId`)
);
```
- Filas insertadas: 208

### drivers
```sql
CREATE TABLE drivers (
    driverId int AUTO_INCREMENT NOT NULL,
    driverRef varchar(50) NOT NULL,
    number int NULL,
    code varchar(3) NULL,
    forename varchar(50) NOT NULL,
    surname varchar(50) NOT NULL,
    dob date NOT NULL,
    nationality varchar(50) NOT NULL,
    url varchar(255) NOT NULL,
    PRIMARY KEY (`driverId`)
);
```
- Filas insertadas: 842

### races
```sql
CREATE TABLE races (
    raceId int AUTO_INCREMENT NOT NULL,
    year int NOT NULL,
    round int NOT NULL,
    circuitId int NOT NULL,
    name varchar(255) NOT NULL,
    date date NOT NULL,
    time time NULL,
    url varchar(255) NOT NULL,
    PRIMARY KEY (`raceId`),
    FOREIGN KEY (`circuitId`) REFERENCES `circuits`(`circuitId`)
);
```
- Filas insertadas: 997

### results
```sql
CREATE TABLE results (
    resultId int AUTO_INCREMENT NOT NULL,
    raceId int NOT NULL,
    driverId int NOT NULL,
    constructorId int NOT NULL,
    number int NOT NULL,
    grid int NOT NULL,
    position int NULL,
    positionText varchar(10) NOT NULL,
    positionOrder int NOT NULL,
    points float NOT NULL,
    laps int NOT NULL,
    time varchar(255) NULL,
    milliseconds int NULL,
    fastestLap int NULL,
    rank int NULL,
    fastestLapTime varchar(255) NULL,
    fastestLapSpeed float NULL,
    statusId int NOT NULL,
    PRIMARY KEY (`resultId`),
    FOREIGN KEY (`raceId`) REFERENCES `races`(`raceId`),
    FOREIGN KEY (`driverId`) REFERENCES `drivers`(`driverId`),
    FOREIGN KEY (`constructorId`) REFERENCES `constructors`(`constructorId`)
);
```
- Filas insertadas: 23,727

### results_log
```sql
CREATE TABLE results_log (
    logId int AUTO_INCREMENT NOT NULL,
    resultId int NOT NULL,
    operation varchar(10) NOT NULL,
    timestamp datetime NOT NULL,
    old_data text NULL,
    new_data text NULL,
    PRIMARY KEY (`logId`),
    FOREIGN KEY (`resultId`) REFERENCES `results`(`resultId`)
);
```
- Filas insertadas: 4

### users
```sql
CREATE TABLE users (
    user_id int AUTO_INCREMENT PRIMARY KEY,
    username varchar(50) UNIQUE NOT NULL,
    password varchar(255) NOT NULL,
    role enum('manager', 'employee', 'analyst') NOT NULL
);
```
- Filas insertadas: 3

## Diagrama de Entidad-Relación (ERD)

El diagrama ER muestra las relaciones entre las tablas de la base de datos. Incluye las tablas `circuits`, `constructors`, `drivers`, `races`, `results`, `results_log`, y `users`.

![eer readme github formula1](https://github.com/user-attachments/assets/c90f9e0f-ff6a-452f-a85c-3478a69b0a61)

## Gestión de Usuarios y Permisos

La gestión de usuarios y permisos es fundamental para garantizar la seguridad y el control de acceso en la base de datos. En este proyecto, se han definido tres tipos de usuarios con diferentes niveles de permisos:

### Usuarios
- `manager_user`: Tiene permisos completos para realizar cualquier operación en la base de datos.
- `employee_user`: Tiene permisos limitados para insertar datos en la base de datos.
- `analyst_user`: Tiene permisos para insertar datos y crear tablas temporales.
  
Link SQL Completo:https://github.com/Esniak/SQL-google-colab-Formula1/blob/main/src/sql/users/user.sql

## Triggers y Procedimientos Almacenados

### Triggers
- **actualizar_clasificacion: Actualiza automáticamente la clasificación de los pilotos**.Se han implementado triggers para automatizar ciertas operaciones en la base de datos. Por ejemplo, el trigger `actualizar_clasificacion` se ejecuta automáticamente después de insertar un nuevo resultado en la tabla `results`, actualizando la tabla `drivers` con los puntos obtenidos en la nueva carrera.
  
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
```

- **log_insert, log_update, log_delete**: Registra operaciones en la tabla `results_log`.
```sql
DELIMITER //

CREATE TRIGGER log_insert
AFTER INSERT ON results
FOR EACH ROW
BEGIN
    INSERT INTO results_log (operation, timestamp, result_id, new_data)
    VALUES ('INSERT', NOW(), NEW.resultId, NEW.points);
END//

CREATE TRIGGER log_update
AFTER UPDATE ON results
FOR EACH ROW
BEGIN
    INSERT INTO results_log (operation, timestamp, result_id, old_data, new_data)
    VALUES ('UPDATE', NOW(), OLD.resultId, OLD.points, NEW.points);
END//

CREATE TRIGGER log_delete
AFTER DELETE ON results
FOR EACH ROW
BEGIN
    INSERT INTO results_log (operation, timestamp, result_id, old_data)
    VALUES ('DELETE', NOW(), OLD.resultId, OLD.points);
END//

DELIMITER ;
```

### Procedimientos Almacenados
- **update_driver_info: Actualiza la información de los pilotos**. El procedimiento almacenado `update_driver_info` permite actualizar la información de los pilotos en la tabla `drivers`. Este procedimiento puede actualizar la nacionalidad, el número, el nombre y el apellido de un piloto específico.
```sql
DROP PROCEDURE IF EXISTS update_driver_info;

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
END//

DELIMITER ;
```

Link SQL Completo:https://github.com/Esniak/SQL-google-colab-Formula1/blob/main/src/sql/procedures/Store%20Procedure.sql

## Funciones SQL

La función `average_points_per_driverid` calcula el promedio de puntos por piloto. Esta función es útil para analizar el rendimiento de los pilotos a lo largo del tiempo.

### average_points_per_driverid
```sql
USE Formula1DB;
DROP FUNCTION IF EXISTS average_points;

DELIMITER //

CREATE FUNCTION average_points(p_driverId INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE avg_points DECIMAL(10,2);
    
    SELECT AVG(points) INTO avg_points
    FROM results
    WHERE driverId = p_driverId;
    
    RETURN avg_points;
END //

DELIMITER ;
```
Link SQL Completo:https://github.com/Esniak/SQL-google-colab-Formula1/blob/main/src/sql/functions/Function.sql

## Conexión a la Base de Datos MySQL desde Google Colab

Para realizar consultas y visualizaciones en Google Colab, se ha utilizado la biblioteca `mysql-connector-python`. A continuación se muestra un ejemplo de cómo conectar Google Colab a MySQL:

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
### Ejemplos Prácticos

```sql
# Obtener constructores que no han ganado ninguna carrera, limitado a 20 resultados

SELECT constructorId, name
FROM constructors
EXCEPT
SELECT DISTINCT constructors.constructorId, constructors.name
FROM constructors
JOIN results ON constructors.constructorId = results.constructorId
WHERE results.positionOrder = 1
LIMIT 20;

cursor.execute(query1)
constructors_no_wins = cursor.fetchall()
print("Constructores sin victorias (limitado a 20 resultados):")
for row in constructors_no_wins:
    print(row)

# contar el número de circuitos en los que participaron pilotos en el año 2009, agrupados y ordenados por nombre del piloto.

SELECT d.forename, COUNT(c.circuitId) as number_of_circuits
FROM drivers d
JOIN results r ON d.driverId = r.driverId
JOIN races ra ON r.raceId = ra.raceId
JOIN circuits c ON ra.circuitId = c.circuitId
WHERE ra.year = 2009
GROUP BY d.forename
ORDER BY d.forename;

driver_circuits_df = pd.read_sql(query, conn)

# Verificar los resultados
print(driver_circuits_df)

# Consulta SQL ajustada para obtener el rendimiento de los pilotos  desde el año 2010 al 2017

SELECT d.forename, d.surname, ra.year, SUM(r.points) AS total_points
FROM results r
JOIN drivers d ON r.driverId = d.driverId
JOIN races ra ON r.raceId = ra.raceId
GROUP BY d.driverId, d.forename, d.surname, ra.year
ORDER BY total_points DESC, ra.year
LIMIT 20;

# Ejecutar la consulta y cargar los resultados en un DataFrame
cursor.execute(query_yearly_performance)
rows_yearly_performance = cursor.fetchall()

# Convertir los resultados a un DataFrame de pandas
yearly_performance_df = pd.DataFrame(rows_yearly_performance, columns=['forename', 'surname', 'year', 'total_points'])

# Mantener solo un registro por año en orden cronológico y de puntos
yearly_performance_df = yearly_performance_df.sort_values(by=['year', 'total_points'], ascending=[True, False])
yearly_performance_df = yearly_performance_df.drop_duplicates(subset=['year'], keep='first').head(10)

# Gráfico de barras
plt.figure(figsize=(10, 6))
plt.barh(yearly_performance_df['forename'] + ' ' + yearly_performance_df['surname'] + ' (' + yearly_performance_df['year'].astype(str) + ')', yearly_performance_df['total_points'], color='skyblue')
plt.xlabel('Total Points')
plt.ylabel('Driver (Year)')
plt.title('Top 8 Driver Performances by Year 2010--2017')
plt.gca().invert_yaxis()
plt.show()

Consulta SQL para obtener el total de carreras por país.

# Consulta SQL para obtener el número de victorias por equipo

SELECT constructors.name, COUNT(results.positionOrder) as wins
FROM results
JOIN constructors ON results.constructorId = constructors.constructorId
WHERE results.positionOrder = 1
GROUP BY constructors.name
ORDER BY wins DESC

df = pd.read_sql(query, conn)

# Crear un gráfico de barras
plt.figure(figsize=(12, 6))
plt.bar(df['name'], df['wins'], color='skyblue')
plt.xlabel('Equipo')
plt.ylabel('Número de Victorias')
plt.title('Número de Victorias por Equipo')
plt.xticks(rotation=45, ha='right')
plt.grid(True)
plt.show()

Consulta SQL para obtener puntos de constructores por temporada.

# Consulta SQL para obtener el número de victorias por equipo

SELECT constructors.name, COUNT(results.positionOrder) as wins
FROM results
JOIN constructors ON results.constructorId = constructors.constructorId
WHERE results.positionOrder = 1
GROUP BY constructors.name
ORDER BY wins DESC

df = pd.read_sql(query, conn)

# Crear un gráfico de barras
plt.figure(figsize=(12, 6))
plt.bar(df['name'], df['wins'], color='skyblue')
plt.xlabel('Equipo')
plt.ylabel('Número de Victorias')
plt.title('Número de Victorias por Equipo')
plt.xticks(rotation=45, ha='right')
plt.grid(True)
plt.show()
```

### Generación de Gráficos y Visualizaciones

En el notebook `MySQL_database_access_Kaabil_Sekali_proyecto_formula_1.ipynb`, se han generado gráficos y visualizaciones clave para identificar patrones y tendencias en los datos de la Fórmula 1. Estas visualizaciones ayudan a comprender mejor los factores que influyen en el rendimiento de los pilotos y los equipos.

Link del Notebook: https://github.com/Esniak/SQL-google-colab-Formula1/blob/main/notebooks/MySQL_database_access_Kaabil_Sekali_proyecto_formula_1.ipynb

A continuación, se muestran algunas de las visualizaciones destacadas:

![numero drivers nacionalidades](https://drive.google.com/uc?export=view&id=1p7BYtj12d8kxQv5HctXdkLM4HO99YnWO)

![mapa tarta](https://drive.google.com/uc?export=view&id=1q4IGUlL2WhdhCenL7N-z2sk3MzvpkIck)

![Correlacion](https://drive.google.com/uc?export=view&id=1ptWdCI0b2sjTqGG5LT32ze12B41S7qRN)


## Consideraciones Finales

Este proyecto resalta cómo la combinación de herramientas como MySQL y Google Colab puede proporcionar insights profundos, demostrando su utilidad para investigaciones futuras y aplicaciones en otros dominios. La estructura modular y escalable del proyecto permite su adaptación a diferentes contextos y necesidades, facilitando la colaboración en equipos y la integración en entornos empresariales.

## Instrucciones para Configurar y Ejecutar el Proyecto Localmente

### Requisitos Previos

1. **Sistemas Operativos Compatibles**: macOS, Linux, Windows
2. **Software Necesario**:
   - [Python 3.9+](https://www.python.org/downloads/)
   - [MySQL Server](https://dev.mysql.com/downloads/mysql/)
   - [Visual Studio Code](https://code.visualstudio.com/)
   - Extensiones de VS Code: Python, SQL
   - [Pandas](https://pandas.pydata.org/) y otras dependencias de Python (detalladas en `requirements.txt`).
3. **Archivos CSV**: Los datos necesarios están en la carpeta `data/raw/`.

### Configuración del Proyecto

1. **Clona el Repositorio**:
   ```bash
   git clone https://github.com/Esniak/SQL-google-colab-Formula1.git
   cd Proyecto_Formula1
   ```
2. **Crea un Entorno Virtual**:
   ```bash
   python3 -m venv venv
   source venv/bin/activate  # macOS/Linux
   ```
3. **Instala las Dependencias**:
   ```bash
   pip install -r requirements.txt
   ```
4. **Configura las Credenciales**:
   - Crea un archivo `.env` en la raíz del proyecto:
     ```env
     DB_HOST=localhost
     DB_USER=root
     DB_PASSWORD=secure_password
     DB_NAME=formula1db
     ```
   - Excluye este archivo del repositorio con `.gitignore`.

5. **Crea la Base de Datos**:
   - Ejecuta el script SQL en `src/sql/schema/formula1db.sql` para crear las tablas necesarias.

6. **Carga los Datos**:
   - Usa `src/main.py` para cargar los archivos CSV en la base de datos.

### Ejecución

1. **Inicia el Proyecto**:
   ```bash
   python src/main.py
   ```
   
2. **Análisis de Datos**:
   - Abre el notebook `notebooks/análisis_datos.ipynb` en Google Colab para realizar consultas y visualizaciones.
     
3. **Pruebas**:
   - Ejecuta las pruebas SQL y Python:
     ```bash
     pytest tests/
     ```

## Pautas para Contribuir al Proyecto

Gracias por tu interés en contribuir a este proyecto. Este documento describe cómo puedes participar en su desarrollo, reportar problemas y proponer mejoras.

### Cómo Contribuir

1. **Clona el Repositorio**:
   ```bash
   git clone https://github.com/Esniak/SQL-google-colab-Formula1.git
   cd Proyecto_Formula1
   ```

2. **Configura el Entorno**:
   - Sigue las instrucciones en `uso.md` para configurar el proyecto.

3. **Crea una Rama**:
   ```bash
   git checkout -b feature/nueva-funcionalidad
   ```

4. **Haz Cambios**:
   - Asegúrate de seguir las buenas prácticas de codificación.
   - Documenta tus cambios en el código.

5. **Ejecuta las Pruebas**:
   ```bash
   pytest tests/
   ```

6. **Envía un Pull Request**:
   - Asegúrate de que tu rama esté actualizada con la rama principal:
     ```bash
     git pull origin main
     ```
   - Envía tus cambios para revisión:
     ```bash
     git push origin feature/nueva-funcionalidad
     ```

### Reporte de Problemas

Si encuentras un problema, abre un [Issue](https://github.com/<usuario>/<repositorio>/issues) en el repositorio. Proporciona información detallada sobre el problema, incluyendo:

- Descripción del problema.
- Pasos para reproducirlo.
- Resultados esperados y actuales.

### Propuesta y Discusión de Soluciones

#### Proponer Soluciones

1. **Identificación del Problema**:
   - Describe claramente el problema identificado.
   - Proporciona ejemplos o casos de uso que ilustren el problema.

2. **Opciones de Solución**:
   - Proporciona múltiples opciones de solución para el problema identificado.
   - Explica cada opción en detalle, incluyendo sus ventajas y desventajas.

3. **Justificación de la Solución**:
   - Justifica por qué una opción es preferible sobre las otras.
   - Proporciona evidencia o argumentos que respalden tu elección.

#### Documentar Soluciones Propuestas

1. **Descripción Detallada**:
   - Documenta la solución propuesta de manera detallada.
   - Incluye diagramas, ejemplos de código y cualquier otra información relevante.

2. **Guía de Implementación**:
   - Proporciona una guía paso a paso para implementar la solución propuesta.
   - Incluye cualquier configuración adicional o cambios necesarios en el entorno.

3. **Pruebas y Validación**:
   - Describe cómo se pueden probar y validar los cambios propuestos.
   - Proporciona ejemplos de pruebas y resultados esperados.

#### Colaboración y Discusión

1. **Abrir un Issue o Pull Request**:
   - Abre un [Issue](https://github.com/<usuario>/<repositorio>/issues) o un [Pull Request](https://github.com/<usuario>/<repositorio>/pulls) para discutir la solución propuesta.
   - Proporciona un enlace a la documentación de la solución propuesta.

2. **Feedback y Revisión**:
   - Participa en la discusión proporcionando feedback constructivo.
   - Revisa las soluciones propuestas por otros contribuidores y proporciona tus comentarios.

3. **Iteración y Mejora**:
   - Itera sobre la solución propuesta basándote en el feedback recibido.
   - Mejora la documentación y la guía de implementación según sea necesario.

### Código de Conducta

Todos los contribuidores deben adherirse a una conducta profesionalmente ética y moral.

## Futuras Extensiones

- Añadir análisis predictivo basado en datos históricos.
- Integrar un dashboard interactivo para visualización avanzada.
- Optimizar consultas SQL para manejar grandes volúmenes de datos.
