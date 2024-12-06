import os
from mysql.connector import connect, Error
from dotenv import load_dotenv

load_dotenv()

DB_HOST = os.getenv("DB_HOST")
DB_USER = os.getenv("DB_USER")
DB_PASSWORD = os.getenv("DB_PASSWORD")
DB_NAME = os.getenv("DB_NAME")

def connect_to_database():
    """
    Establece una conexión con la base de datos MySQL.
    """
    try:
        connection = connect(
            host=DB_HOST,
            user=DB_USER,
            password=DB_PASSWORD,
            database=DB_NAME
        )
        print(f"Conexión exitosa a la base de datos: {DB_NAME}")
        return connection
    except Error as e:
        print(f"Error al conectar a la base de datos: {e}")
        return None
