# Uso del Proyecto Fórmula 1

## Introducción

Este documento describe cómo configurar, ejecutar y utilizar este proyecto, que analiza datos históricos de Fórmula 1 utilizando una base de datos MySQL y herramientas como Google Colab.

## Requisitos Previos

1. **Sistemas Operativos Compatibles**: macOS, Linux, Windows

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

