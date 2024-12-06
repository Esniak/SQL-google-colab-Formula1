# Arquitectura del Proyecto Fórmula 1

## Descripción General

Este proyecto tiene como objetivo principal desarrollar una base de datos MySQL para almacenar y analizar datos históricos de la Fórmula 1. La base de datos está diseñada para integrarse con Google Colab, permitiendo realizar consultas avanzadas y generar visualizaciones informativas. 

La estructura del proyecto es modular y escalable, optimizada para entornos empresariales y colaboración en equipos.

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

## Componentes Principales

### 1. Base de Datos MySQL
- **Esquema:** El esquema incluye tablas relacionadas con circuitos, conductores, carreras, resultados y usuarios.
- **Triggers:** Automatizan operaciones como la actualización de puntos de los pilotos.
- **Procedimientos Almacenados:** Incluyen funciones como `update_driver_info` para actualizar datos de los pilotos.
- **Funciones SQL:** Ejemplo: `average_points_per_driverid` para calcular promedios de puntos.

### 2. Scripts y Notebooks
- **`main.py`:** Lógica principal del proyecto, incluyendo conexión a la base de datos y carga de datos.
- **Notebook:** Permite análisis y visualización en Google Colab con gráficos generados a partir de datos SQL.

### 3. Seguridad y Configuración
- **`config.yaml`:** Maneja configuraciones, sin incluir credenciales sensibles.
- **Archivo `.env`:** Almacena credenciales de forma segura, excluido del repositorio público con `.gitignore`.

## Flujo de Trabajo

1. **Configuración del Entorno:**
   - Ejecutar `setup.sh` para configurar dependencias en macOS.
   - Crear un archivo `.env` para las credenciales de base de datos.


2. **Carga y Análisis de Datos:**
   - Cargar datos desde archivos CSV en `data/raw/` hacia la base de datos.

     - Conectar Google Colab a MySQL Workbench utilizando la biblioteca `mysql-connector-python`:

       ```python
       import mysql.connector
       from dotenv import load_dotenv
       import os

       # Cargar las variables de entorno desde el archivo .env
       load_dotenv()

       # Configuración de la conexión
       config = {
           'user': os.getenv('DB_USER'),
           'password': os.getenv('DB_PASSWORD'),
           'host': os.getenv('DB_HOST'),
           'database': os.getenv('DB_NAME')
       }

       # Establecer la conexión
       conn = mysql.connector.connect(**config)
       cursor = conn.cursor()

       # Ejemplo de consulta
       query = "SELECT * FROM nombre_tabla"
       cursor.execute(query)

       # Obtener resultados
       results = cursor.fetchall()
       for row in results:
           print(row)

       # Cerrar la conexión
       cursor.close()
       conn.close()
       ```

     - Asegurarse de que MySQL Workbench esté configurado para aceptar conexiones remotas si se está ejecutando en una máquina diferente a Google Colab.

   - Utilizar el notebook `análisis_datos.ipynb` para consultas y visualizaciones.

3. **Pruebas:**
   - Ejecutar pruebas SQL en `tests/sql_tests/`.
   - Validar scripts Python con `tests/python_tests/`.

## Futuras Extensiones
- Añadir análisis predictivo basado en datos históricos.
- Integrar un dashboard interactivo para visualización avanzada.
- Optimizar consultas SQL para manejar grandes volúmenes de datos.
