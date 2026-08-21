-- =====================================================================
-- TRIGGER 01
-- Automatic validation of passenger age
-- =====================================================================
CREATE OR REPLACE FUNCTION fn_validate_passenger_age()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    IF NEW.date_birth_passenger >
        CURRENT_DATE - INTERVAL '18 years' THEN
            RAISE EXCEPTION 'Passenger must be at least 18 years old';
    END IF;

    RETURN NEW;
END;
$$;

CREATE OR REPLACER TRIGGER trg_validate_passenger_age
BEFORE INSERT OR UPDATE
ON passenger
FOR EACH ROW
EXECUTE FUNCTION fn_validate_passenger_age();

INSERT INTO passenger (
    number_passport_passenger,
    first_name_passenger,
    last_name_passenger,
    date_birth_passenger,
    gender_passenger,
    email_passenger,
    nationality_passenger
)
VALUES (
    'TEST-AGE-002',
    'John',
    'Adult',
    '2024-05-15',
    1,
    'john.adult@example.com',
    1
);

UPDATE passenger
SET date_birth_passenger = '2022-05-15'
WHERE id_passenger = 1;

-- =====================================================================
-- TRIGGER 02
-- Automatic validation of pilot age
-- =====================================================================
CREATE OR REPLACE FUNCTION fn_validate_pilot_age()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    IF NEW.date_birth_pilot >
        CURRENT_DATE - INTERVAL '21 years' THEN
            RAISE EXCEPTION 'Pilot must be at least 21 years old';
    END IF;

    RETURN NEW;
END;
$$;

CREATE OR REPLACE TRIGGER trg_validate_pilot_age
BEFORE INSERT OR UPDATE
ON pilot
FOR EACH ROW
EXECUTE FUNCTION fn_validate_pilot_age();

INSERT INTO pilot (
    employee_number_pilot,
    first_name_pilot,
    last_name_pilot,
    date_birth_pilot,
    gender_pilot,
    license_number_pilot,
    email_pilot
)
VALUES (
    'TEST-PILOT-001',
    'Carlos',
    'Test',
    '202o-01-15',
    1,
    'TEST-LICENSE-001',
    'carlos.test@example.com'
);

UPDATE pilot
SET date_birth_pilot = '2020-01-15'
WHERE id_pilot = 1;

-- =====================================================================
-- TRIGGER 03
-- Automatically set reservation date
-- =====================================================================
CREATE OR REPLACE FUNCTION fn_set_reservation_date()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    IF NEW.date_reservation IS NULL THEN
        NEW.date_reservation := CURRENT_DATE;
    END IF;

    RETURN NEW;
END;
$$;

CREATE TRIGGER trg_set_reservation_date
BEFORE INSERT
ON reservation
FOR EACH ROW
EXECUTE FUNCTION fn_set_reservation_date();

INSERT INTO reservation (
    seat_number_reservation,
    status_reservation,
    passenger_id_reservation,
    flight_id_registration
)
VALUES (
    '12A',
    1,
    1,
    1
);

-- =====================================================================
-- TRIGGER 04
-- Prevent reservations on cancelled flights
-- =====================================================================
CREATE OR REPLACE FUNCTION fn_validate_reservation_flight()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
    flight_status_name VARCHAR := '^(Confirmed|Pending|Cancelled|Checked-in|No-show)$';
BEGIN
    SELECT
        fs.name_flight_status
    INTO flight_status_name
    FROM flight AS f
    JOIN flight_status AS fs
        ON fs.id_flight_status = f.status_flight
    WHERE f.id_flight = NEW.flight_id_registration;

    IF flight_status_name IN (
        'Cancelled',
        'Departed',
        'Completed'
    ) THEN
        RAISE EXCEPTION 'Cannot reserve a seat on a % flight', 
            flight_status_name;
    END IF;

    RETURN NEW;
END;
$$;

CREATE OR REPLACE TRIGGER trg_validate_reservation_flight
BEFORE INSERT OR UPDATE
ON reservation
FOR EACH ROW
EXECUTE FUNCTION fn_validate_reservation_flight();

INSERT INTO reservation (
    date_reservation,
    seat_number_reservation,
    status_reservation,
    passenger_id_reservation,
    flight_id_registration
)
VALUES (
    CURRENT_DATE,
    '21A',
    1,
    1,
    27
);