-- =====================================================================
-- VIEW 01
-- Complete flight information
-- =====================================================================
CREATE OR REPLACE VIEW vw_flight_details AS
SELECT
	f.id_flight,
	f.number_flight,
	f.departure_date_flight,
	f.departure_time_flight,
	f.arrival_time_flight,
	apo.code_airport AS origin_airport,
	apo.name_airport AS origin_airport_name,
	cto.name_city AS origin_city,
	dpo.name_department AS origin_department,
	cyo.name_country AS origin_country,
	apd.code_airport AS destination_airport,
	apd.name_airport AS destination_airport_name,
	ctd.name_city AS destination_city,
	dpd.name_department AS destination_department,
	cyd.name_country AS destination_country,
	ab.name_aircraft_brand AS aircraft_brand,
	a.model_aircraft,
	a.registration_number_aircraft,
	a.capacity_aircraft,
	p.employee_number_pilot,
	p.license_number_pilot,
	CONCAT(p.first_name_pilot, ' ', last_name_pilot) AS pilot_name,
	fs.name_flight_status AS flight_status
FROM flight AS f
JOIN airport AS apo
	ON f.origin_airport_flight = apo.id_airport
JOIN city AS cto
	ON apo.city_airport = cto.id_city
JOIN department AS dpo
	ON cto.department_id_city = dpo.id_department
JOIN country AS cyo
	ON dpo.country_id_department = cyo.id_country
JOIN airport AS apd
	ON f.destination_airport_flight = apd.id_airport
JOIN city AS ctd
	ON apd.city_airport = ctd.id_city
JOIN department AS dpd
	ON ctd.department_id_city = dpd.id_department
JOIN country AS cyd
	ON dpd.country_id_department = cyd.id_country
JOIN aircraft AS a
	ON f.aircraft_id_flight = a.id_aircraft
JOIN aircraft_brand AS ab
	ON a.manufacture_aircraft = ab.id_aircraft_brand
JOIN pilot AS p
	ON f.pilot_id_flight = p.id_pilot
JOIN flight_status AS fs
	ON f.status_flight = fs.id_flight_status;

SELECT 
* 
FROM vw_flight_details;

SELECT 
	origin_city,
	destination_city,
	registration_number_aircraft,
	employee_number_pilot
FROM vw_flight_details;

-- =====================================================================
-- VIEW 02
-- Passenger profiles with nationality and gender
-- =====================================================================
CREATE OR REPLACE VIEW vw_passenger_profiles AS
SELECT
	p.id_passenger,
	p.number_passport_passenger,
	CONCAT(p.first_name_passenger, ' ', p.last_name_passenger) AS passenger_name,
	p.date_birth_passenger,
	EXTRACT(
		YEAR FROM AGE(CURRENT_DATE, p.date_birth_passenger)
	)::INT AS passenger_age,
	g.name_gender AS gender,
	c.name_country AS nationality,
	c.code_iso2_country AS nationality_code,
	p.email_passenger
FROM passenger AS p
JOIN gender AS g
	ON p.gender_passenger = g.id_gender
JOIN country AS c
	ON p.nationality_passenger = c.id_country
ORDER BY p.id_passenger;

SELECT
*
FROM vw_passenger_profiles;

-- =====================================================================
-- VIEW 03
-- Flight occupancy and reservation statistics
-- =====================================================================
CREATE OR REPLACE VIEW vw_flight_occupancy AS
SELECT
	f.id_flight,
	f.number_flight,
	f.departure_date_flight,
	a.registration_number_aircraft,
	a.capacity_aircraft,
	COUNT(r.id_reservation) AS total_reservations,
	COUNT(
		CASE
			WHEN rs.name_reservation_status IN 
				('Confirmed', 'Checked-in')
			THEN 1
		END
	) AS active_reservations,
	ROUND(
		COUNT(
			CASE
				WHEN rs.name_reservation_status IN
					('Confirmed', 'Checked-in')
				THEN 1
			END
		) * 100.0 / a.capacity_aircraft,
		3
	) AS occupancy_percentage
FROM flight AS f
JOIN aircraft AS a
	ON f.aircraft_id_flight = a.id_aircraft
LEFT JOIN reservation AS r
	ON f.id_flight = r.flight_id_registration
LEFT JOIN reservation_status AS rs
	ON r.status_reservation = rs.id_reservation_status
GROUP BY
	f.id_flight,
	f.number_flight,
	f.departure_date_flight,
	a.registration_number_aircraft,
	a.capacity_aircraft
ORDER BY f.id_flight;

SELECT *
FROM vw_flight_occupancy
WHERE capacity_aircraft > 200;

SELECT *
FROM vw_flight_occupancy
WHERE occupancy_percentage > 3;