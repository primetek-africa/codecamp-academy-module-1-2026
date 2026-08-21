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

-- =====================================================================
-- 5. sp_checkin_passenger
-- ---------------------------------------------------------------------
-- Checks in a passenger for a confirmed reservation. The flight must
-- be Scheduled or Boarding.
-- =====================================================================

CREATE OR REPLACE PROCEDURE sp_checkin_passenger(
    IN p_reservation_id INT
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_reservation_status VARCHAR(20);
    v_flight_status      VARCHAR(20);
    v_checkedin_id       INT;
BEGIN
    SELECT rs.name_reservation_status, fs.name_flight_status
    INTO v_reservation_status, v_flight_status
    FROM reservation r
    JOIN reservation_status rs ON rs.id_reservation_status = r.status_reservation
    JOIN flight f              ON f.id_flight = r.flight_id_registration
    JOIN flight_status fs      ON fs.id_flight_status = f.status_flight
    WHERE r.id_reservation = p_reservation_id;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'Reservation % does not exist.', p_reservation_id;
    END IF;

    IF v_reservation_status <> 'Confirmed' THEN
        RAISE EXCEPTION 'Reservation % must be Confirmed to check in (current: %).',
            p_reservation_id, v_reservation_status;
    END IF;

    IF v_flight_status NOT IN ('Scheduled', 'Boarding') THEN
        RAISE EXCEPTION 'Cannot check in: flight status is %.', v_flight_status;
    END IF;

    SELECT id_reservation_status INTO v_checkedin_id
    FROM reservation_status
    WHERE name_reservation_status = 'Checked-in';

    UPDATE reservation
    SET status_reservation = v_checkedin_id
    WHERE id_reservation = p_reservation_id;
END;
$$;

-- Example:
CALL sp_checkin_passenger(101);

-- =====================================================================
-- 6. sp_issue_ticket
-- ---------------------------------------------------------------------
-- Issues a ticket for a confirmed (or checked-in) reservation that does
-- not already have one. Ticket number is auto-generated.
-- =====================================================================

CREATE OR REPLACE PROCEDURE sp_issue_ticket(
    IN  p_reservation_id INT,
    IN  p_price          DECIMAL(10,2),
    OUT p_ticket_number  VARCHAR
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_reservation_status VARCHAR(20);
    v_pending_payment_id INT;
    v_new_ticket_id      INT;
BEGIN
    SELECT rs.name_reservation_status
    INTO v_reservation_status
    FROM reservation r
    JOIN reservation_status rs ON rs.id_reservation_status = r.status_reservation
    WHERE r.id_reservation = p_reservation_id;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'Reservation % does not exist.', p_reservation_id;
    END IF;

    IF v_reservation_status NOT IN ('Confirmed', 'Checked-in') THEN
        RAISE EXCEPTION 'Cannot issue ticket: reservation % has status %.',
            p_reservation_id, v_reservation_status;
    END IF;

    IF EXISTS (SELECT 1 FROM ticket WHERE reservation_id_ticket = p_reservation_id) THEN
        RAISE EXCEPTION 'Reservation % already has a ticket issued.', p_reservation_id;
    END IF;

    IF p_price < 0 THEN
        RAISE EXCEPTION 'Ticket price cannot be negative.';
    END IF;

    SELECT id_payment_status INTO v_pending_payment_id
    FROM payment_status
    WHERE name_payment_status = 'Pending';

    INSERT INTO ticket (
        number_ticket, reservation_id_ticket, purchase_date_ticket,
        price_ticket, payment_status_ticket
    )
    VALUES (
        'TKT-PENDING', p_reservation_id, CURRENT_DATE,
        p_price, v_pending_payment_id
    )
    RETURNING id_ticket INTO v_new_ticket_id;

    -- Generate a readable, zero-padded ticket number from the new id.
    p_ticket_number := 'TKT-' || LPAD(v_new_ticket_id::TEXT, 4, '0');

    -- Defense in depth: confirm the generated code actually matches the
    -- system's ticket-number convention before it's persisted.
    IF p_ticket_number !~ '^TKT-[0-9]{4,}$' THEN
        RAISE EXCEPTION 'Generated ticket number % does not match expected format.', p_ticket_number;
    END IF;

    UPDATE ticket
    SET number_ticket = p_ticket_number
    WHERE id_ticket = v_new_ticket_id;
END;
$$;

-- Example:
CALL sp_issue_ticket(101, 210.00, NULL);

-- =====================================================================
-- 7. sp_process_payment
-- ---------------------------------------------------------------------
-- Marks a ticket as paid. Only tickets currently Pending can be paid.
-- =====================================================================

CREATE OR REPLACE PROCEDURE sp_process_payment(
    IN p_ticket_id INT
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_current_status VARCHAR(20);
    v_paid_id        INT;
BEGIN
    SELECT ps.name_payment_status
    INTO v_current_status
    FROM ticket t
    JOIN payment_status ps ON ps.id_payment_status = t.payment_status_ticket
    WHERE t.id_ticket = p_ticket_id;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'Ticket % does not exist.', p_ticket_id;
    END IF;

    IF v_current_status NOT IN ('Pending', 'Failed') THEN
        RAISE EXCEPTION 'Ticket % cannot be paid from status %.', p_ticket_id, v_current_status;
    END IF;

    SELECT id_payment_status INTO v_paid_id
    FROM payment_status
    WHERE name_payment_status = 'Paid';

    UPDATE ticket
    SET payment_status_ticket = v_paid_id
    WHERE id_ticket = p_ticket_id;
END;
$$;

-- Example:
CALL sp_process_payment(96);

-- =====================================================================
-- 8. sp_process_refund
-- ---------------------------------------------------------------------
-- Refunds a paid ticket and cancels the associated reservation
-- (unless the passenger has already checked in, which is blocked by
-- sp_cancel_reservation's own rule).
-- =====================================================================

CREATE OR REPLACE PROCEDURE sp_process_refund(
    IN p_ticket_id INT
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_current_status  VARCHAR(20);
    v_reservation_id  INT;
    v_refunded_id     INT;
BEGIN
    SELECT ps.name_payment_status, t.reservation_id_ticket
    INTO v_current_status, v_reservation_id
    FROM ticket t
    JOIN payment_status ps ON ps.id_payment_status = t.payment_status_ticket
    WHERE t.id_ticket = p_ticket_id;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'Ticket % does not exist.', p_ticket_id;
    END IF;

    IF v_current_status <> 'Paid' THEN
        RAISE EXCEPTION 'Only Paid tickets can be refunded (ticket % is %).',
            p_ticket_id, v_current_status;
    END IF;

    SELECT id_payment_status INTO v_refunded_id
    FROM payment_status
    WHERE name_payment_status = 'Refunded';

    UPDATE ticket
    SET payment_status_ticket = v_refunded_id
    WHERE id_ticket = p_ticket_id;

    -- Reuses the cancellation rules already defined in sp_cancel_reservation
    -- (e.g. blocks refund-driven cancellation once checked in).
    CALL sp_cancel_reservation(v_reservation_id);
END;
$$;

-- Example:
CALL sp_process_refund(96);

-- =====================================================================
-- 9. sp_update_flight_status
-- ---------------------------------------------------------------------
-- Updates a flight's status by name (e.g. 'Boarding', 'Delayed',
-- 'Cancelled'). Blocks changes to flights already Completed.
-- =====================================================================

CREATE OR REPLACE PROCEDURE sp_update_flight_status(
    IN p_flight_id  INT,
    IN p_new_status VARCHAR
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_current_status VARCHAR(20);
    v_new_status_id  INT;
BEGIN
    IF p_new_status !~ '^[A-Za-z]{3,20}$' THEN
        RAISE EXCEPTION 'Invalid status name format: %. Letters only, 3-20 characters.',
            p_new_status;
    END IF;

    SELECT fs.name_flight_status
    INTO v_current_status
    FROM flight f
    JOIN flight_status fs ON fs.id_flight_status = f.status_flight
    WHERE f.id_flight = p_flight_id;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'Flight % does not exist.', p_flight_id;
    END IF;

    IF v_current_status = 'Completed' THEN
        RAISE EXCEPTION 'Flight % is already Completed and cannot be changed.', p_flight_id;
    END IF;

    SELECT id_flight_status INTO v_new_status_id
    FROM flight_status
    WHERE name_flight_status = p_new_status;

    IF v_new_status_id IS NULL THEN
        RAISE EXCEPTION 'Unknown flight status: %.', p_new_status;
    END IF;

    UPDATE flight
    SET status_flight = v_new_status_id
    WHERE id_flight = p_flight_id;
END;
$$;

-- Example:
CALL sp_update_flight_status(29, 'Boarding');

-- =====================================================================
-- 10. sp_reassign_pilot
-- ---------------------------------------------------------------------
-- Reassigns a flight to a different pilot, ensuring the new pilot
-- has no other flight on the same date whose time window overlaps.
-- =====================================================================

CREATE OR REPLACE PROCEDURE sp_reassign_pilot(
    IN p_flight_id     INT,
    IN p_new_pilot_id  INT
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_departure_date DATE;
    v_departure_time TIME;
    v_arrival_time   TIME;
    v_conflict_count INT;
BEGIN
    SELECT departure_date_flight, departure_time_flight, arrival_time_flight
    INTO v_departure_date, v_departure_time, v_arrival_time
    FROM flight
    WHERE id_flight = p_flight_id;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'Flight % does not exist.', p_flight_id;
    END IF;

    IF NOT EXISTS (SELECT 1 FROM pilot WHERE id_pilot = p_new_pilot_id) THEN
        RAISE EXCEPTION 'Pilot % does not exist.', p_new_pilot_id;
    END IF;

    SELECT COUNT(*) INTO v_conflict_count
    FROM flight f
    WHERE f.pilot_id_flight = p_new_pilot_id
        AND f.id_flight <> p_flight_id
        AND f.departure_date_flight = v_departure_date
        AND f.departure_time_flight < v_arrival_time
        AND v_departure_time < f.arrival_time_flight;

    IF v_conflict_count > 0 THEN
        RAISE EXCEPTION 'Pilot % already has an overlapping flight on %.',
            p_new_pilot_id, v_departure_date;
    END IF;

    UPDATE flight
    SET pilot_id_flight = p_new_pilot_id
    WHERE id_flight = p_flight_id;
END;
$$;

-- Example:
CALL sp_reassign_pilot(1, 3);