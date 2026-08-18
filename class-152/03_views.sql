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

-- =====================================================================
-- VIEW 04
-- Passenger travel history
-- =====================================================================
CREATE OR REPLACE VIEW vw_passenger_travel_history AS
SELECT
    p.id_passenger,
    CONCAT(p.first_name_passenger, ' ', p.last_name_passenger) AS passenger_name,
    c.name_country AS nationality,
    f.number_flight,
    f.departure_date_flight,
    ao.code_airport AS origin_airport,
    ad.code_airport AS destination_airport,
    rs.name_reservation_status AS reservation_status,
    t.number_ticket,
    t.price_ticket,
    ps.name_payment_status AS payment_status
FROM passenger AS p
JOIN country AS c
    ON p.nationality_passenger = c.id_country
JOIN reservation AS r
    ON p.id_passenger = r.passenger_id_reservation
JOIN flight AS f
    ON r.flight_id_registration = f.id_flight
JOIN airport AS ao
    ON f.origin_airport_flight = ao.id_airport
JOIN airport AS ad
    ON f.destination_airport_flight = ad.id_airport
JOIN reservation_status AS rs
    ON r.status_reservation = rs.id_reservation_status
LEFT JOIN ticket AS t
    ON r.id_reservation = t.reservation_id_ticket
LEFT JOIN payment_status AS ps
    ON t.payment_status_ticket = ps.id_payment_status
ORDER BY p.id_passenger;

SELECT *
FROM vw_passenger_travel_history
WHERE id_passenger = 1;

SELECT *
FROM vw_passenger_travel_history
WHERE price_ticket > 300;

SELECT *
FROM vw_passenger_travel_history
WHERE payment_status = 'Failed';

-- =====================================================================
-- VIEW 05
-- Revenue generated by flight
-- =====================================================================
CREATE OR REPLACE VIEW vw_flight_revenue AS
SELECT
    f.id_flight,
    f.number_flight,
    f.departure_date_flight,
    ao.code_airport AS origin_airport,
    ad.code_airport AS destination_airport,
    COUNT(t.id_ticket) AS tickets_sold,
    COALESCE(
        SUM(
            CASE
                WHEN ps.name_payment_status = 'Paid'
                THEN t.price_ticket
                ELSE 0
            END
        ),
        0
    ) AS total_revenue,
    COALESCE(
        AVG(
            CASE
                WHEN ps.name_payment_status = 'Paid'
                THEN t.price_ticket
            END
        ),
        0
    ) AS average_ticket_price
FROM flight AS f
JOIN airport AS ao
    ON f.origin_airport_flight = ao.id_airport
JOIN airport AS ad
    ON f.destination_airport_flight = ad.id_airport
JOIN reservation AS r
    ON f.id_flight = r.flight_id_registration
JOIN ticket AS t
    ON r.id_reservation = t.reservation_id_ticket
JOIN payment_status AS ps
    ON t.payment_status_ticket = ps.id_payment_status
GROUP BY
    f.id_flight,
    f.number_flight,
    f.departure_date_flight,
    ao.code_airport,
    ad.code_airport
ORDER BY id_flight;

SELECT *
FROM vw_flight_revenue;

SELECT *
FROM vw_flight_revenue
WHERE total_revenue > 1000;

SELECT *
FROM vw_flight_revenue
WHERE average_ticket_price > 500;