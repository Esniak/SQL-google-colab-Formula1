import logging
from src.db_connection import connect_to_database
from src.queries import (
    get_top_drivers, 
    get_constructor_points,
    get_driver_performance_by_year,
    get_race_distribution,
    get_constructor_dominance
)
from src.data_analysis import (
    plot_top_drivers, 
    plot_race_distribution
)

# Configurar el registro
logging.basicConfig(filename='app.log', level=logging.INFO, 
                    format='%(asctime)s - %(levelname)s - %(message)s')

if __name__ == "__main__":
    try:
        connection = connect_to_database()
        
        if connection:
            logging.info("Conexión a la base de datos establecida con éxito.")
            
            # Analizar y graficar los 10 pilotos con más puntos
            cursor = connection.cursor(dictionary=True)
            cursor.execute(get_top_drivers())
            top_drivers = cursor.fetchall()
            plot_top_drivers(top_drivers)
            logging.info("Consulta y gráfico de los 10 pilotos con más puntos completados.")

            # Graficar distribución de carreras por país
            cursor.execute(get_race_distribution())
            race_distribution = cursor.fetchall()
            plot_race_distribution(race_distribution)
            logging.info("Consulta y gráfico de la distribución de carreras por país completados.")

            connection.close()
            logging.info("Conexión a la base de datos cerrada.")
        else:
            logging.error("No se pudo establecer la conexión a la base de datos.")
    except Exception as e:
        logging.error(f"Error durante la ejecución del script: {e}")
