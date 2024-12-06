# Uso del Proyecto Fórmula 1

## Introducción

Este documento describe cómo configurar, ejecutar y utilizar este proyecto, que analiza datos históricos de Fórmula 1 utilizando una base de datos MySQL y herramientas como Google Colab.

## Requisitos Previos

1. **Sistema Operativo**: macOS (desarrollado y probado en un MacBook Pro 2023).
2. **Software Necesario**:
   - [Python 3.9+](https://www.python.org/downloads/)
   - [MySQL Server](https://dev.mysql.com/downloads/mysql/)
   - [Visual Studio Code](https://code.visualstudio.com/)
   - Extensiones de VS Code: Python. SQL
   - [Pandas](https://pandas.pydata.org/) y otras dependencias de Python (detalladas en `requirements.txt`).
3. **Archivos CSV**: Los datos necesarios están en la carpeta `data/raw/`.

## Configuración del Proyecto

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

## Ejecución

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

## Solución de Problemas

### Problema 1: Conexión a MySQL Fallida
**Opciones de Solución:**
1. **Verificar Credenciales:** Asegúrate de que las credenciales en el archivo `.env` sean correctas.
2. **Revisar el Servidor MySQL:** Verifica que el servidor MySQL esté en funcionamiento y accesible.
3. **Comprobar la Configuración del Firewall:** Asegúrate de que el firewall no esté bloqueando la conexión a MySQL.

### Problema 2: Problemas de Instalación de Dependencias
**Opciones de Solución:**
1. **Verificar la Versión de Python:** Asegúrate de estar utilizando la versión correcta de Python (3.9+).
2. **Reinstalar Dependencias:** Ejecuta `pip install -r requirements.txt` nuevamente para asegurarte de que todas las dependencias estén instaladas.
3. **Revisar el Entorno Virtual:** Asegúrate de que el entorno virtual esté activado antes de instalar las dependencias.

### Problema 3: Errores en los Scripts SQL
**Opciones de Solución:**
1. **Revisión Manual:** Revisa manualmente los scripts SQL para identificar y corregir errores de sintaxis.
2. **Herramientas de Validación:** Utiliza herramientas de validación de SQL para automatizar la detección de errores de sintaxis.
3. **Pruebas Automatizadas:** Implementa pruebas automatizadas que ejecuten los scripts SQL y verifiquen su correcta ejecución.

### Problema 4: Inconsistencias en los Datos
**Opciones de Solución:**
1. **Normalización de Datos:** Aplica técnicas de normalización para asegurar la consistencia de los datos en todas las tablas.
2. **Validaciones de Integridad:** Implementa validaciones de integridad referencial para evitar inconsistencias en los datos.
3. **Auditorías de Datos:** Realiza auditorías periódicas de los datos para identificar y corregir inconsistencias.

### Problema 5: Falta de Documentación
**Opciones de Solución:**
1. **Documentación Detallada:** Crea documentación detallada para cada componente del proyecto, incluyendo scripts SQL, procedimientos almacenados y funciones.
2. **Guías de Uso:** Desarrolla guías de uso para los usuarios finales y los desarrolladores que contribuyan al proyecto.
3. **Comentarios en el Código:** Añade comentarios en el código para explicar la lógica y el propósito de cada sección.

### Problema 6: Problemas de Rendimiento
**Opciones de Solución:**
1. **Optimización de Consultas:** Revisa y optimiza las consultas SQL para mejorar el rendimiento.
2. **Indexación:** Implementa índices en las tablas para acelerar las consultas.
3. **Monitoreo de Rendimiento:** Utiliza herramientas de monitoreo de rendimiento para identificar y resolver cuellos de botella.

### Problema 7: Seguridad de la Base de Datos
**Opciones de Solución:**
1. **Control de Acceso:** Implementa controles de acceso basados en roles para limitar el acceso a los datos sensibles.
2. **Cifrado de Datos:** Utiliza cifrado para proteger los datos sensibles en la base de datos.
3. **Auditoría de Seguridad:** Realiza auditorías de seguridad periódicas para identificar y mitigar vulnerabilidades.

### Problema 8: Escalabilidad
**Opciones de Solución:**
1. **Particionamiento de Tablas:** Implementa particionamiento de tablas para manejar grandes volúmenes de datos.
2. **Replicación de Base de Datos:** Utiliza replicación de base de datos para distribuir la carga y mejorar la disponibilidad.
3. **Optimización de Recursos:** Optimiza el uso de recursos del servidor para mejorar la escalabilidad del sistema.
