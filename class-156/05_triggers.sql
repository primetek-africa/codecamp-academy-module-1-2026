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

CREATE TRIGGER trg_validate_passenger_age
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