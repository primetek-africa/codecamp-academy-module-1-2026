-- =====================================================================
-- STORE PROCEDURE 01
-- Registers a new passenger and, optionally, links a phone number to
-- them (creating the phone row if it doesn't already exist).
-- =====================================================================
CREATE OR REPLACE PROCEDURE sp_register_passenger(
    IN  p_passport               VARCHAR,
    IN  p_first_name             VARCHAR,
    IN  p_last_name              VARCHAR,
    IN  p_date_birth             DATE,
    IN  p_gender_id              INT,
    IN  p_email                  VARCHAR,
    IN  p_nationality_id         INT,
    IN  p_phone_number           VARCHAR DEFAULT NULL,
    OUT p_passenger_id           INT
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_phone_id          INT;
    c_passport_rx       CONSTANT VARCHAR := '^[A-Z]{2}[0-9]$';
    c_email_rx          CONSTANT VARCHAR := '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-+]+\.[A-Za-z]{2,}$';
    c_phone_rx          CONSTANT VARCHAR := '^\+[0-9]{1,3}(\s[0-9]{1,5}){1,6}$';
BEGIN
    IF p_passport !~ c_passport_rx THEN
        RAISE EXCEPTION 'Invalid passport format: %. Expected 2 letters + 6-9 digits (e.g. US100001)',
            p_passport;
    END IF;

    IF p_email !~ c_email_rx THEN
        RAISE EXCEPTION 'Invalid email format: %.', p_email;
    END IF;

    IF p_phone_number IS NOT NULL AND p_phone_number !~ c_passport_rx THEN
        RAISE EXCEPTION 'Invalid phone format: %. Expected e.g. +1 212 555 0101.',
            p_phone_number;
    END IF

    IF EXISTS (SELECT 1 FROM passenger WHERE number_passport_passenger = p_passport)
    THEN RAISE EXCEPTION 'A passenger with passport % already exists.', p_passport;

    IF EXISTS (SELECT 1 FROM passenger WHERE email_passenger = p_email) THEN
        RAISE EXCEPTION 'A passenger with email % already exists.', p_email;
    
    INSERT INTO passenger (
        number_passport_passenger, first_name_passenger, last_name_passenger,
        date_birth_passenger, gender_passenger, email_passenger, nationality_passenger
    )
    VALUES (
        p_passport, p_first_name, p_last_name,
        p_date_birth, p_gender_id, p_email, p_nationality_id
    )
    RETURNING id_passenger INTO p_passenger_id;

    IF p_phone_number IS NOT NULL THEN
        SELECT id_phone INTO v_phone_id
        FROM phone
        WHERE number_phone = p_phone_number;

        IF v_phone_id IS NULL THEN
            INSERT INTO phone (number_phone)
            VALUES (p_phone_number)
            RETURNING id_phone INTO v_phone_id;
        END IF;

        INSERT INTO passenger_phone (id_number_phone, passenger_number_phone)
        VALUES (v_phone_id, p_passenger_id);
    END IF;
END;
$$;

-- Example
CALL sp_register_passenger(
    'US900001',
    'Louis',
    'Kim',
    '1994-05-02',
    2,
    'louis.kim@email.com',
    1,
    '+1 646 555 0199'
); 