-- =====================================================================
-- CODE CHALLENGE 9 SOLUTION
-- Stored Procedure: sp_register_pilot
-- ---------------------------------------------------------------------
-- Registers a new pilot after validating the employee number, license
-- number, and email, and checking for duplicate values.
-- =====================================================================

CREATE OR REPLACE PROCEDURE sp_register_pilot(
    IN  p_employee_number VARCHAR,
    IN  p_first_name      VARCHAR,
    IN  p_last_name       VARCHAR,
    IN  p_date_birth      DATE,
    IN  p_gender_id       INT,
    IN  p_license_number  VARCHAR,
    IN  p_email           VARCHAR,
    OUT p_pilot_id        INT
)
LANGUAGE plpgsql
AS $$
DECLARE
    c_employee_rx CONSTANT VARCHAR :=
        '^PIL-[0-9]{3,}$';

    c_license_rx CONSTANT VARCHAR :=
        '^LIC-[A-Z]{2,4}-[0-9]{3,}$';

    c_email_rx CONSTANT VARCHAR :=
        '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$';
BEGIN
    -- Validate employee number format
    IF p_employee_number !~ c_employee_rx THEN
        RAISE EXCEPTION
            'Invalid employee number format: %. Expected format: PIL-001.',
            p_employee_number;
    END IF;

    -- Validate license number format
    IF p_license_number !~ c_license_rx THEN
        RAISE EXCEPTION
            'Invalid license number format: %. Expected format: LIC-INT-1001.',
            p_license_number;
    END IF;

    -- Validate email format
    IF p_email !~ c_email_rx THEN
        RAISE EXCEPTION
            'Invalid email format: %.',
            p_email;
    END IF;

    -- Check duplicate employee number
    IF EXISTS (
        SELECT 1
        FROM pilot
        WHERE employee_number_pilot = p_employee_number
    ) THEN
        RAISE EXCEPTION
            'A pilot with employee number % already exists.',
            p_employee_number;
    END IF;

    -- Check duplicate license number
    IF EXISTS (
        SELECT 1
        FROM pilot
        WHERE license_number_pilot = p_license_number
    ) THEN
        RAISE EXCEPTION
            'A pilot with license number % already exists.',
            p_license_number;
    END IF;

    -- Check duplicate email
    IF EXISTS (
        SELECT 1
        FROM pilot
        WHERE email_pilot = p_email
    ) THEN
        RAISE EXCEPTION
            'A pilot with email % already exists.',
            p_email;
    END IF;

    -- Insert pilot
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
        p_employee_number,
        p_first_name,
        p_last_name,
        p_date_birth,
        p_gender_id,
        p_license_number,
        p_email
    )
    RETURNING id_pilot INTO p_pilot_id;
END;
$$;

-- Valid example
CALL sp_register_pilot(
    'PIL-101',
    'James',
    'Anderson',
    '1985-07-14',
    1,
    'LIC-USA-1001',
    'james.anderson@email.com',
    NULL
);

-- Invalid employee number
CALL sp_register_pilot(
    'PIL-1',
    'Robert',
    'Miller',
    '1988-09-10',
    1,
    'LIC-USA-1003',
    'robert.miller@email.com',
    NULL
);

-- Invalid license number
CALL sp_register_pilot(
    'PIL-103',
    'Robert',
    'Miller',
    '1988-09-10',
    1,
    'USA-1003',
    'robert.miller@email.com',
    NULL
);

-- Duplicated employee number
CALL sp_register_pilot(
    'PIL-101',
    'Michael',
    'Brown',
    '1986-05-11',
    1,
    'LIC-USA-1004',
    'michael.brown@email.com',
    NULL
);

-- Duplicated license number
CALL sp_register_pilot(
    'PIL-104',
    'Michael',
    'Brown',
    '1986-05-11',
    1,
    'LIC-USA-1001',
    'michael.brown@email.com',
    NULL
);

-- Duplicated email
CALL sp_register_pilot(
    'PIL-105',
    'Michael',
    'Brown',
    '1986-05-11',
    1,
    'LIC-USA-1005',
    'james.anderson@email.com',
    NULL
);