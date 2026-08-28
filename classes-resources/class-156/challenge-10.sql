-- =====================================================================
-- TRIGGER FUNCTION: Protect Ticket Reservation & Paid Ticket Price
-- =====================================================================
CREATE OR REPLACE FUNCTION fn_protect_ticket_reservation()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
    paid_status_id  INT;
BEGIN
    -- 1. Prevent changing the reservation associated with an existing ticket
    IF OLD.reservation_id_ticket IS DISTINCT FROM NEW.reservation_id_ticket THEN
        RAISE EXCEPTION 
            'Cannot change the reservation associated with an existing ticket (Ticket ID: %, Old Reservation ID: %, Attempted New Reservation ID: %)',
                OLD.id_ticket, OLD.reservation_id_ticket, NEW.reservation_id_ticket;
    END IF;

    -- 2. Bonus: Prevent price modification if payment status is 'Paid'
    SELECT 
        id_payment_status 
    INTO paid_status_id
    FROM payment_status
    WHERE name_payment_status = 'Paid';

    IF OLD.payment_status_ticket = paid_status_id 
       AND OLD.price_ticket IS DISTINCT FROM NEW.price_ticket THEN
        RAISE EXCEPTION 
            'Cannot modify price of ticket ID % because payment status is Paid', 
                OLD.id_ticket;
    END IF;

    RETURN NEW;
END;
$$;

-- =====================================================================
-- TRIGGER DEFINITION
-- =====================================================================
CREATE OR REPLACE TRIGGER trg_protect_ticket_reservation
BEFORE UPDATE
ON ticket
FOR EACH ROW
EXECUTE FUNCTION fn_protect_ticket_reservation();

-- =====================================================================
-- TEST SCENARIOS
-- =====================================================================

-- Scenario Setup: Create a pending-payment ticket for Price modification tests
INSERT INTO ticket (
    number_ticket,
    reservation_id_ticket,
    purchase_date_ticket,
    price_ticket,
    payment_status_ticket
)
VALUES (
    'TKT-PENDING-01',
    84,
    CURRENT_DATE,
    150.00,
    (
        SELECT 
            id_payment_status 
        FROM payment_status 
        WHERE name_payment_status = 'Pending'
    )
);

-----------------------------------------------------------------------
-- Test 1: Valid Update (Price update on a Pending ticket)
-----------------------------------------------------------------------
UPDATE ticket
SET price_ticket = 175.00
WHERE number_ticket = 'TKT-PENDING-01';

-- Verification of Test 1
SELECT 
    id_ticket, 
    number_ticket, 
    reservation_id_ticket, 
    price_ticket, 
    payment_status_ticket
FROM ticket
WHERE number_ticket = 'TKT-PENDING-01';


-----------------------------------------------------------------------
-- Test 2: Invalid Update (Attempt to change reservation_id_ticket)
-----------------------------------------------------------------------
-- This statement will raise an exception: "Cannot change the reservation..."
UPDATE ticket
SET reservation_id_ticket = 2
WHERE id_ticket = 1;


-----------------------------------------------------------------------
-- Test 3: Verify Original Value (Ensures transaction was rolled back)
-----------------------------------------------------------------------
SELECT id_ticket, number_ticket, reservation_id_ticket, price_ticket
FROM ticket
WHERE id_ticket = 1;


-----------------------------------------------------------------------
-- Test 4 (Bonus): Invalid Update (Attempt to change price on a 'Paid' ticket)
-----------------------------------------------------------------------
-- Ticket 1 has payment_status_ticket = 1 ('Paid')
-- This statement will raise an exception: "Cannot modify price of ticket..."
UPDATE ticket
SET price_ticket = 250.00
WHERE id_ticket = 1;