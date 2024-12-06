-- Test cases for get_top_drivers query
USE Formula1DB;

-- Test case 1: Verify the top 10 drivers with the most points
SELECT drivers.forename, drivers.surname, SUM(results.points) AS total_points
FROM drivers
JOIN results ON drivers.driverId = results.driverId
GROUP BY drivers.driverId
ORDER BY total_points DESC
LIMIT 10;

-- Test case 2: Verify the top 5 drivers with the most points
SELECT drivers.forename, drivers.surname, SUM(results.points) AS total_points
FROM drivers
JOIN results ON drivers.driverId = results.driverId
GROUP BY drivers.driverId
ORDER BY total_points DESC
LIMIT 5;

-- Test case 3: Verify the top driver with the most points
SELECT drivers.forename, drivers.surname, SUM(results.points) AS total_points
FROM drivers
JOIN results ON drivers.driverId = results.driverId
GROUP BY drivers.driverId
ORDER BY total_points DESC
LIMIT 1;

-- Test cases for get_constructor_points query

-- Test case 1: Verify the points for constructors by season
SELECT constructors.name AS constructor, races.year, SUM(results.points) AS total_points
FROM results
JOIN constructors ON results.constructorId = constructors.constructorId
JOIN races ON results.raceId = races.raceId
GROUP BY constructors.name, races.year
ORDER BY races.year, total_points DESC;

-- Test case 2: Verify the points for constructors in a specific season (e.g., 2020)
SELECT constructors.name AS constructor, races.year, SUM(results.points) AS total_points
FROM results
JOIN constructors ON results.constructorId = constructors.constructorId
JOIN races ON results.raceId = races.raceId
WHERE races.year = 2020
GROUP BY constructors.name, races.year
ORDER BY total_points DESC;

-- Test case 3: Verify the points for a specific constructor (e.g., Ferrari) by season
SELECT constructors.name AS constructor, races.year, SUM(results.points) AS total_points
FROM results
JOIN constructors ON results.constructorId = constructors.constructorId
JOIN races ON results.raceId = races.raceId
WHERE constructors.name = 'Ferrari'
GROUP BY constructors.name, races.year
ORDER BY races.year, total_points DESC;
