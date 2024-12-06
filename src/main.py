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

if __name__ == "__main__":
    connection = connect_to_database()
    
    if connection:
        # Analizar y graficar los 10 pilotos con más puntos
        cursor = connection.cursor(dictionary=True)
        cursor.execute(get_top_drivers())
        top_drivers = cursor.fetchall()
        plot_top_drivers(top_drivers)

        # Graficar distribución de carreras por país
        cursor.execute(get_race_distribution())
        race_distribution = cursor.fetchall()
        plot_race_distribution(race_distribution)

        connection.close()
