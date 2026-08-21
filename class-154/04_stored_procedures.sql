-- =====================================================================
-- STORED PROCEDURE 01
-- Registers a new passenger and, optionally, links a phone number to
-- them (creating the phone row if it doesn't already exist).
-- =====================================================================
CREATE OR REPLACE PROCEDURE sp_register_passenger(
    IN  p_passport       VARCHAR,
    IN  p_first_name     VARCHAR,
    IN  p_last_name      VARCHAR,
    IN  p_date_birth     DATE,
    IN  p_gender_id      INT,
    IN  p_email          VARCHAR,
    IN  p_nationality_id INT,
    OUT p_passenger_id   INT,
    IN  p_phone_number   VARCHAR DEFAULT NULL
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_phone_id    INT;
    c_passport_rx CONSTANT VARCHAR := '^[A-Z]{2}[0-9]{6,9}$';
    c_email_rx    CONSTANT VARCHAR := '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$';
    c_phone_rx    CONSTANT VARCHAR := '^\+[0-9]{1,3}(\s[0-9]{1,5}){1,6}$';
BEGIN
    -- Validate passport format
    IF p_passport !~ c_passport_rx THEN
        RAISE EXCEPTION 'Invalid passport format: %. Expected 2 letters + 6-9 digits (e.g. US100001).',
            p_passport;
    END IF;

    -- Validate email format
    IF p_email !~ c_email_rx THEN
        RAISE EXCEPTION 'Invalid email format: %.', p_email;
    END IF;

    -- Validate phone format
    IF p_phone_number IS NOT NULL AND p_phone_number !~ c_phone_rx THEN
        RAISE EXCEPTION 'Invalid phone format: %. Expected e.g. +1 212 555 0101.',
            p_phone_number;
    END IF;

    -- Check duplicate passport
    IF EXISTS (
        SELECT 1 
        FROM passenger 
        WHERE number_passport_passenger = p_passport
    ) THEN
        RAISE EXCEPTION 'A passenger with passport % already exists.', p_passport;
    END IF;

    -- Check duplicate email
    IF EXISTS (
        SELECT 1 
        FROM passenger 
        WHERE email_passenger = p_email
    ) THEN
        RAISE EXCEPTION 'A passenger with email % already exists.', p_email;
    END IF;

    -- Insert passenger
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
        p_passport,
        p_first_name,
        p_last_name,
        p_date_birth,
        p_gender_id,
        p_email,
        p_nationality_id
    )
    RETURNING id_passenger INTO p_passenger_id;

    -- Process phone number
    IF p_phone_number IS NOT NULL THEN
        -- Check whether the phone already exists
        SELECT id_phone
        INTO v_phone_id
        FROM phone
        WHERE number_phone = p_phone_number;

        -- Create phone if it does not exist
        IF v_phone_id IS NULL THEN
            INSERT INTO phone (number_phone)
            VALUES (p_phone_number)
            RETURNING id_phone INTO v_phone_id;
        END IF;

        -- Associate phone with passenger
        INSERT INTO passenger_phone (
            id_number_phone,
            passenger_number_phone
        )
        VALUES (
            v_phone_id,
            p_passenger_id
        );
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
    NULL,
    '+1 646 555 0199'
);

CALL sp_register_passenger(
    'GB900002',
    'Oliver',
    'Thompson',
    '1987-11-18',
    1,
    'oliver.thompson@email.com',
    8,
    NULL,
    '+44 20 7946 0958'
);

-- =====================================================================
-- 2. sp_create_reservation
-- ---------------------------------------------------------------------
-- Books a seat for a passenger on a flight.
-- Validates: flight exists and is not cancelled/departed/completed,
-- seat is not already taken on that flight, and the aircraft still has
-- available capacity. New reservation is created with status 'Pending'.
-- =====================================================================
CREATE OR REPLACE PROCEDURE sp_create_reservation(
    IN p_passenger_id       INT,
    IN p_flight_id          INT,
    IN p_seat_number        VARCHAR,
    OUT p_reservation_id    INT   
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_flight_status         VARCHAR := '^(Confirmed|Pending|Cancelled|Checked-in|No-show)$';
    v_capacity              INT;
    v_booked_seats          INT;
    v_pending_status        INT;
    c_seat_rx               CONSTANT VARCHAR := '^[0-9]{1,2}[A-Z]{1}$';
BEGIN
    IF p_seat_number !~ c_seat_rx THEN
        RAISE EXCEPTION 'Invalid seat format: %. Expected 1-2 digits + a letter (e.g. 1A, 12C).',
            p_seat_number;
    END IF;

    SELECT
        fs.name_flight_status,
        ac.capacity_aircraft
    INTO v_flight_status, v_capacity
    FROM flight AS f
    JOIN flight_status AS fs
        ON fs.id_flight_status = f.status_flight
    JOIN aircraft AS ac
        ON ac.id_aircraft = f.aircraft_id_flight
    WHERE f.id_flight = p_flight_id;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'Flight % does not exists.', p_flight_id;
    END IF;

    IF EXISTS (
        SELECT 1
        FROM reservation
        WHERE flight_id_registration = p_flight_id
            AND seat_number_reservation = p_seat_number
    ) THEN
        RAISE EXCEPTION 'Seat % is already taken on flight %.',
            p_seat_number, p_flight_id;
    END IF;

    SELECT 
        COUNT(*) INTO v_booked_seats
    FROM reservation AS r
    JOIN reservation_status AS rs
        ON rs.id_reservation_status = r.status_reservation
    WHERE r.flight_id_registration = p_flight_id
        AND rs.name_reservation_status <> 'Cancelled';

    IF v_booked_seats >= v_capacity THEN
        RAISE EXCEPTION 'Flight % is fully booked (capacity %).',
            p_flight_id, v_capacity;
    END IF;

    SELECT
        id_reservation_status INTO v_pending_status
    FROM reservation_status
    WHERE name_reservation_status = 'Pending';

    INSERT INTO reservation (
        date_reservation,
        seat_number_reservation,
        status_reservation,
        passenger_id_reservation,
        flight_id_registration
    )
    VALUES (
        CURRENT_DATE,
        p_seat_number,
        v_pending_status,
        p_passenger_id,
        p_flight_id
    )
    RETURNING id_reservation INTO p_reservation_id;
END;
$$;

-- Example
CALL sp_create_reservation(
    1, 
    25, 
    '4C', 
    NULL
);

-- =====================================================================
-- 3. sp_confirm_reservation
-- ---------------------------------------------------------------------
-- Moves a reservation from 'Pending' to 'Confirmed'.
-- =====================================================================
CREATE OR REPLACE PROCEDURE sp_confirm_reservation(
    IN p_reservation_id INT
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_current_status VARCHAR(20);
    v_confirmed_id   INT;
BEGIN
    SELECT rs.name_reservation_status
    INTO v_current_status
    FROM reservation r
    JOIN reservation_status rs ON rs.id_reservation_status = r.status_reservation
    WHERE r.id_reservation = p_reservation_id;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'Reservation % does not exist.', p_reservation_id;
    END IF;

    IF v_current_status <> 'Pending' THEN
        RAISE EXCEPTION 'Reservation % cannot be confirmed from status %.',
            p_reservation_id, v_current_status;
    END IF;

    SELECT id_reservation_status INTO v_confirmed_id
    FROM reservation_status
    WHERE name_reservation_status = 'Confirmed';

    UPDATE reservation
    SET status_reservation = v_confirmed_id
    WHERE id_reservation = p_reservation_id;
END;
$$;

-- Example:
CALL sp_confirm_reservation(94);

-- =====================================================================
-- 4. sp_cancel_reservation
-- ---------------------------------------------------------------------
-- Cancels a reservation. Blocks cancellation once the passenger has
-- already checked in.
-- =====================================================================

CREATE OR REPLACE PROCEDURE sp_cancel_reservation(
    IN p_reservation_id INT
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_current_status  VARCHAR(20);
    v_cancelled_id    INT;
BEGIN
    SELECT rs.name_reservation_status
    INTO v_current_status
    FROM reservation r
    JOIN reservation_status rs ON rs.id_reservation_status = r.status_reservation
    WHERE r.id_reservation = p_reservation_id;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'Reservation % does not exist.', p_reservation_id;
    END IF;

    IF v_current_status = 'Checked-in' THEN
        RAISE EXCEPTION 'Reservation % cannot be cancelled: passenger already checked in.',
            p_reservation_id;
    END IF;

    IF v_current_status = 'Cancelled' THEN
        RAISE EXCEPTION 'Reservation % is already cancelled.', p_reservation_id;
    END IF;

    SELECT id_reservation_status INTO v_cancelled_id
    FROM reservation_status
    WHERE name_reservation_status = 'Cancelled';

    UPDATE reservation
    SET status_reservation = v_cancelled_id
    WHERE id_reservation = p_reservation_id;
END;
$$;

-- Example:
CALL sp_cancel_reservation(3);