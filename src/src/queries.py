def get_top_drivers():
    """
    Consulta SQL para obtener los 10 pilotos con más puntos.
    """
    return """
        SELECT drivers.forename, drivers.surname, SUM(results.points) AS total_points
        FROM drivers
        JOIN results ON drivers.driverId = results.driverId
        GROUP BY drivers.driverId
        ORDER BY total_points DESC
        LIMIT 10;
    """

def get_constructor_points():
    """
    Consulta SQL para obtener puntos por constructor por temporada.
    """
    return """
        SELECT constructors.name AS constructor, races.year, SUM(results.points) AS total_points
        FROM results
        JOIN constructors ON results.constructorId = constructors.constructorId
        JOIN races ON results.raceId = races.raceId
        GROUP BY constructors.name, races.year
        ORDER BY races.year, total_points DESC;
    """

def get_driver_performance_by_year():
    """
    Consulta SQL para obtener puntos de pilotos por año.
    """
    return """
        SELECT drivers.forename AS driver, races.year, SUM(results.points) AS points
        FROM results
        JOIN drivers ON results.driverId = drivers.driverId
        JOIN races ON results.raceId = races.raceId
        GROUP BY driver, year
        ORDER BY year, points DESC;
    """

def get_race_distribution():
    """
    Consulta SQL para obtener el total de carreras por país.
    """
    return """
        SELECT circuits.country, COUNT(races.raceId) AS total_races
        FROM races
        JOIN circuits ON races.circuitId = circuits.circuitId
        GROUP BY circuits.country
        ORDER BY total_races DESC;
    """

def get_constructor_dominance():
    """
    Consulta SQL para obtener puntos de constructores por temporada.
    """
    return """
        SELECT constructors.name AS constructor, races.year, SUM(results.points) AS points
        FROM results
        JOIN constructors ON results.constructorId = constructors.constructorId
        JOIN races ON results.raceId = races.raceId
        GROUP BY constructor, year
        ORDER BY year, points DESC;
    """
