# Proyecto Fórmula 1

## Introducción

El objetivo principal de este proyecto es crear una base de datos MySQL que pueda ser utilizada en Google Colab para realizar consultas y generar gráficos informativos.

La integración con Google Colab permite realizar consultas SQL avanzadas, lo que facilita la comprensión de la información mediante visualizaciones gráficas, especialmente útil para personas que no están familiarizadas con el entorno técnico de SQL.

El proyecto incluye la gestión de usuarios y permisos, la implementación de triggers, y procedimientos almacenados, así como funciones SQL para optimizar la manipulación y análisis de datos. Además, se ha diseñado un diagrama ER para estructurar y visualizar la base de datos de manera efectiva. Este enfoque no solo mejora el análisis del rendimiento histórico de la Fórmula 1, sino que también establece una base sólida para futuras investigaciones y aplicaciones en otros campos.

![eer readme github formula1](https://github.com/user-attachments/assets/c90f9e0f-ff6a-452f-a85c-3478a69b0a61)

## Descripción General del Proyecto

Este proyecto tiene como objetivo principal desarrollar una base de datos MySQL para almacenar y analizar datos históricos de la Fórmula 1. La base de datos está diseñada para integrarse con Google Colab, permitiendo realizar consultas avanzadas y generar visualizaciones informativas. La estructura del proyecto es modular y escalable, optimizada para entornos empresariales y colaboración en equipos.

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

## Gestión de Usuarios y Permisos

La gestión de usuarios y permisos es fundamental para garantizar la seguridad y el control de acceso en la base de datos. En este proyecto, se han definido tres tipos de usuarios con diferentes niveles de permisos:

1. **manager_user**: Tiene permisos completos para realizar cualquier operación en la base de datos.
2. **employee_user**: Tiene permisos limitados para insertar datos en la base de datos.
3. **analyst_user**: Tiene permisos para insertar datos y crear tablas temporales.

## Triggers, Procedimientos Almacenados y Funciones SQL

### Triggers

Se han implementado triggers para automatizar ciertas operaciones en la base de datos. Por ejemplo, el trigger `actualizar_clasificacion` se ejecuta automáticamente después de insertar un nuevo resultado en la tabla `results`, actualizando la tabla `drivers` con los puntos obtenidos en la nueva carrera.

### Procedimientos Almacenados

El procedimiento almacenado `update_driver_info` permite actualizar la información de los pilotos en la tabla `drivers`. Este procedimiento puede actualizar la nacionalidad, el número, el nombre y el apellido de un piloto específico.

### Funciones SQL

La función `average_points_per_driverid` calcula el promedio de puntos por piloto. Esta función es útil para analizar el rendimiento de los pilotos a lo largo del tiempo.

## Diagrama ER

El diagrama ER (Entidad-Relación) proporciona una visualización clara de las relaciones entre las tablas de la base de datos. Puedes encontrar el diagrama ER en el siguiente enlace: [Diagrama ER](https://github.com/user-attachments/assets/c90f9e0f-ff6a-452f-a85c-3478a69b0a61)

## Análisis y Visualización

### Conexión a MySQL desde Google Colab

Para realizar consultas y visualizaciones en Google Colab, se ha utilizado la biblioteca `mysql-connector-python`. A continuación se muestra un ejemplo de cómo conectar Google Colab a MySQL:

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

### Consultas SQL Avanzadas

Se han utilizado consultas SQL avanzadas como `SELECT`, `GROUP BY` y `JOIN` para analizar los datos de la Fórmula 1. Estas consultas permiten obtener información detallada sobre el rendimiento de los pilotos y los equipos.

### Generación de Gráficos y Visualizaciones

En el notebook `MySQL_database_access_Kaabil_Sekali_proyecto_formula_1.ipynb`, se han generado gráficos y visualizaciones clave para identificar patrones y tendencias en los datos de la Fórmula 1. Estas visualizaciones ayudan a comprender mejor los factores que influyen en el rendimiento de los pilotos y los equipos.

## Resumen del Proyecto

### Diseño y Creación de la Base de Datos

La base de datos se ha diseñado y creado en MySQL, utilizando MySQL Workbench para definir el esquema y las relaciones entre las tablas. Se han implementado triggers, procedimientos almacenados y funciones SQL para optimizar la manipulación y el análisis de datos.

### Integración con Google Colab

La integración con Google Colab permite realizar consultas avanzadas y generar visualizaciones informativas. Esta integración facilita el análisis de datos y la generación de insights clave sobre el rendimiento de los pilotos y los equipos.

### Insights Clave Obtenidos

A través del análisis de datos, se han obtenido insights clave sobre los factores que influyen en el rendimiento de los pilotos y los equipos. Estos insights pueden ser utilizados para mejorar las estrategias de carrera y optimizar el rendimiento en futuras competiciones.

## Contenido Adicional

### Código SQL

El código SQL para la creación de tablas, triggers, procedimientos almacenados y funciones relevantes se encuentra en la carpeta `src/sql/`. Este código incluye:

- **Tablas**: Definición del esquema de la base de datos.
- **Triggers**: Automatización de operaciones en la base de datos.
- **Procedimientos Almacenados**: Funciones para actualizar datos en la base de datos.
- **Funciones SQL**: Cálculo de promedios y otras métricas.

### Enlace al Google Colab

Puedes acceder al proyecto en Google Colab y ver las visualizaciones generadas en el siguiente enlace: [Google Colab](https://colab.research.google.com/drive/1a2b3c4d5e6f7g8h9i0j)

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

## Pautas para Contribuir al Proyecto

### Introducción

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

## Información Adicional

### Flujo de Trabajo

1. **Configuración del Entorno**:
   - Ejecutar `setup.sh` para configurar dependencias en macOS.
   - Crear un archivo `.env` para las credenciales de base de datos. 
   - Este archivo `.env.example` actúa como una plantilla para la configuración de variables de entorno de la base de datos. Para utilizarlo, copia este archivo y renómbralo a `.env`. Luego, reemplaza cada valor de las variables con la información específica de tu entorno de base de datos.
   
   -->
   # Ejemplo de archivo `.env.example`:

   DB_HOST=tu-host-aqui
   DB_USER=tu-usuario-aqui
   DB_PASS=tu-contraseña-aqui
   DB_NAME=tu-base-de-datos-aqui

2. **Carga y Análisis de Datos**:
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

   - Utilizar el notebook `MySQL_database_access_Kaabil_Sekali_proyecto_formula_1.ipynb` para consultas y visualizaciones.

3. **Pruebas**:
   - Ejecutar pruebas SQL en `tests/sql_tests/`.
   - Validar scripts Python con `tests/python_tests/`.

## Futuras Extensiones

- Añadir análisis predictivo basado en datos históricos.
- Integrar un dashboard interactivo para visualización avanzada.
- Optimizar consultas SQL para manejar grandes volúmenes de datos.
