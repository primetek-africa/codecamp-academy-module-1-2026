-- =====================================================================
-- VIEW 01
-- Beginner Level
-- =====================================================================
CREATE OR REPLACE VIEW vw_airport_directory AS
SELECT
    a.id_airport AS airport_id,
    a.code_airport AS airport_code,
    a.name_airport AS airport_name,
    c.name_city AS city_name,
    d.name_department AS department_name,
    co.name_country AS country_name,
    co.code_iso2_country AS country_iso2
FROM airport AS a
JOIN city AS c
    ON c.id_city = a.city_airport
JOIN department AS d
    ON d.id_department = c.department_id_city
JOIN country AS co
    ON co.id_country = d.country_id_department
ORDER BY a.id_airport;

SELECT *
FROM vw_airport_directory;

-- =====================================================================
-- VIEW 02
-- Intermediate / Advanced Level
-- =====================================================================
CREATE OR REPLACE VIEW vw_pilot_flight_summary AS
SELECT
    p.id_pilot AS pilot_id,
    p.employee_number_pilot AS employee_number,
    p.license_number_pilot AS license_number,
    CONCAT(p.first_name_pilot, ' ', p.last_name_pilot) AS pilot_name,
    COUNT(f.id_flight) AS total_flights,
    COUNT(
        CASE 
            WHEN fs.name_flight_status = 'Completed'
            THEN f.id_flight 
        END
    ) AS completed_flights,
    COUNT(
        CASE 
            WHEN fs.name_flight_status = 'Cancelled'
            THEN f.id_flight END
    ) AS cancelled_flights,
    STRING_AGG(DISTINCT ab.name_aircraft_brand, ', ') AS aircraft_brands_flown
FROM pilot AS p
LEFT JOIN flight AS f
    ON f.pilot_id_flight = p.id_pilot
LEFT JOIN flight_status AS fs
    ON fs.id_flight_status = f.status_flight
LEFT JOIN aircraft AS ac
    ON ac.id_aircraft = f.aircraft_id_flight
LEFT JOIN aircraft_brand AS ab
    ON ab.id_aircraft_brand = ac.manufacture_aircraft
GROUP BY
    p.id_pilot,
    p.employee_number_pilot,
    p.license_number_pilot,
    p.first_name_pilot,
    p.last_name_pilot
ORDER BY total_flights DESC;

SELECT *
FROM vw_pilot_flight_summary;