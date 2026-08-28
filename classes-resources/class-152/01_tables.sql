-- =====================================================================
-- Airline Reservation System
-- =====================================================================

BEGIN;

-- =====================================================================
-- LOOKUP / REFERENCE TABLES (no dependencies)
-- =====================================================================

CREATE TABLE gender (
    id_gender                   INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name_gender                 VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE country (
    id_country                  INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name_country                VARCHAR(50) NOT NULL UNIQUE,
    code_iso2_country           VARCHAR(2) NOT NULL UNIQUE
);

CREATE TABLE aircraft_brand (
    id_aircraft_brand           INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name_aircraft_brand         VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE flight_status (
    id_flight_status            INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name_flight_status          VARCHAR(20) NOT NULL UNIQUE,
    description_flight_status   VARCHAR(100) NOT NULL
);

CREATE TABLE reservation_status (
    id_reservation_status           INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name_reservation_status         VARCHAR(20) NOT NULL UNIQUE,
    description_reservation_status  VARCHAR(100) NOT NULL
);

CREATE TABLE payment_status (
    id_payment_status               INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name_payment_status             VARCHAR(20) NOT NULL UNIQUE,
    description_payment_status      VARCHAR(100) NOT NULL
);

CREATE TABLE phone (
    id_phone                    INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    number_phone                VARCHAR(20) NOT NULL UNIQUE
);

-- =====================================================================
-- GEOGRAPHIC HIERARCHY: country -> department -> city
-- =====================================================================

CREATE TABLE department (
    id_department               INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name_department             VARCHAR(50) NOT NULL,
    country_id_department       INT NOT NULL,
    CONSTRAINT fk_department_country
        FOREIGN KEY (country_id_department) REFERENCES country (id_country)
);

CREATE TABLE city (
    id_city                     INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name_city                   VARCHAR(50) NOT NULL,
    department_id_city          INT NOT NULL,
    CONSTRAINT fk_city_department
        FOREIGN KEY (department_id_city) REFERENCES department (id_department)
);

-- =====================================================================
-- CORE ENTITIES
-- =====================================================================

CREATE TABLE airport (
    id_airport                  INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code_airport                VARCHAR(20) NOT NULL UNIQUE,
    name_airport                VARCHAR(50) NOT NULL UNIQUE,
    city_airport                INT NOT NULL,
    CONSTRAINT fk_airport_city
        FOREIGN KEY (city_airport) REFERENCES city (id_city)
);

CREATE TABLE aircraft (
    id_aircraft                     INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    registration_number_aircraft    VARCHAR(20) NOT NULL UNIQUE,
    manufacture_aircraft            INT NOT NULL,
    manufacture_year_aircraft       INT NOT NULL,
    model_aircraft                  VARCHAR(50) NOT NULL,
    capacity_aircraft               INT NOT NULL,
    CONSTRAINT fk_aircraft_brand
        FOREIGN KEY (manufacture_aircraft) REFERENCES aircraft_brand (id_aircraft_brand),
    CONSTRAINT chk_aircraft_capacity_positive CHECK (capacity_aircraft > 0),
    CONSTRAINT chk_aircraft_year_reasonable CHECK (manufacture_year_aircraft BETWEEN 1900 AND 2100)
);

CREATE TABLE passenger (
    id_passenger                    INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    number_passport_passenger       VARCHAR(30) NOT NULL UNIQUE,
    first_name_passenger            VARCHAR(50) NOT NULL,
    last_name_passenger             VARCHAR(50),
    date_birth_passenger            DATE NOT NULL,
    gender_passenger                INT NOT NULL,
    email_passenger                 VARCHAR(100) NOT NULL,
    nationality_passenger           INT NOT NULL,
    CONSTRAINT fk_passenger_gender
        FOREIGN KEY (gender_passenger) REFERENCES gender (id_gender),
    CONSTRAINT fk_passenger_country
        FOREIGN KEY (nationality_passenger) REFERENCES country (id_country)
);

CREATE TABLE pilot (
    id_pilot                        INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    employee_number_pilot           VARCHAR(20) NOT NULL UNIQUE,
    first_name_pilot                VARCHAR(50) NOT NULL,
    last_name_pilot                 VARCHAR(50),
    date_birth_pilot                DATE NOT NULL,
    gender_pilot                    INT NOT NULL,
    license_number_pilot            VARCHAR(30) NOT NULL UNIQUE,
    email_pilot                     VARCHAR(100) NOT NULL UNIQUE,
    CONSTRAINT fk_pilot_gender
        FOREIGN KEY (gender_pilot) REFERENCES gender (id_gender)
);

CREATE TABLE flight (
    id_flight                       INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    number_flight                   INT  NOT NULL UNIQUE,
    departure_date_flight           DATE NOT NULL,
    departure_time_flight           TIME NOT NULL,
    arrival_time_flight             TIME NOT NULL,
    origin_airport_flight           INT  NOT NULL,
    destination_airport_flight      INT  NOT NULL,
    aircraft_id_flight              INT  NOT NULL,
    pilot_id_flight                 INT  NOT NULL,
    status_flight                   INT  NOT NULL,
    CONSTRAINT fk_flight_origin_airport
        FOREIGN KEY (origin_airport_flight) REFERENCES airport (id_airport),
    CONSTRAINT fk_flight_destination_airport
        FOREIGN KEY (destination_airport_flight) REFERENCES airport (id_airport),
    CONSTRAINT fk_flight_aircraft
        FOREIGN KEY (aircraft_id_flight) REFERENCES aircraft (id_aircraft),
    CONSTRAINT fk_flight_pilot
        FOREIGN KEY (pilot_id_flight) REFERENCES pilot (id_pilot),
    CONSTRAINT fk_flight_status
        FOREIGN KEY (status_flight) REFERENCES flight_status (id_flight_status),
    CONSTRAINT chk_flight_origin_destination_different
        CHECK (origin_airport_flight <> destination_airport_flight)
);

CREATE TABLE reservation (
    id_reservation                  INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    date_reservation                DATE NOT NULL,
    seat_number_reservation         VARCHAR(10) NOT NULL,
    status_reservation              INT NOT NULL,
    passenger_id_reservation        INT NOT NULL,
    flight_id_registration          INT NOT NULL,
    CONSTRAINT fk_reservation_status
        FOREIGN KEY (status_reservation) REFERENCES reservation_status (id_reservation_status),
    CONSTRAINT fk_reservation_passenger
        FOREIGN KEY (passenger_id_reservation) REFERENCES passenger (id_passenger),
    CONSTRAINT fk_reservation_flight
        FOREIGN KEY (flight_id_registration) REFERENCES flight (id_flight),
    CONSTRAINT uq_reservation_flight_seat
        UNIQUE (flight_id_registration, seat_number_reservation)
);

CREATE TABLE ticket (
    id_ticket                       INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    number_ticket                   VARCHAR(30) NOT NULL UNIQUE,
    reservation_id_ticket           INT NOT NULL UNIQUE,
    purchase_date_ticket            DATE NOT NULL,
    price_ticket                    DECIMAL(10,2) NOT NULL,
    payment_status_ticket           INT NOT NULL,
    CONSTRAINT fk_ticket_reservation
        FOREIGN KEY (reservation_id_ticket) REFERENCES reservation (id_reservation),
    CONSTRAINT fk_ticket_payment_status
        FOREIGN KEY (payment_status_ticket) REFERENCES payment_status (id_payment_status),
    CONSTRAINT chk_ticket_price_non_negative
        CHECK (price_ticket >= 0)
);

-- =====================================================================
-- BRIDGE TABLES: multi-valued phone numbers for passenger / pilot
-- =====================================================================

CREATE TABLE passenger_phone (
    id_passenger_phone              INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_number_phone                 INT NOT NULL,
    passenger_number_phone          INT NOT NULL,
    CONSTRAINT fk_passenger_phone_phone
        FOREIGN KEY (id_number_phone) REFERENCES phone (id_phone),
    CONSTRAINT fk_passenger_phone_passenger
        FOREIGN KEY (passenger_number_phone) REFERENCES passenger (id_passenger),
    CONSTRAINT uq_passenger_phone UNIQUE (id_number_phone, passenger_number_phone)
);

CREATE TABLE pilot_phone (
    id_pilot_phone                  INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_number_phone                 INT NOT NULL,
    pilot_number_phone              INT NOT NULL,
    CONSTRAINT fk_pilot_phone_phone
        FOREIGN KEY (id_number_phone) REFERENCES phone (id_phone),
    CONSTRAINT fk_pilot_phone_pilot
        FOREIGN KEY (pilot_number_phone) REFERENCES pilot (id_pilot),
    CONSTRAINT uq_pilot_phone UNIQUE (id_number_phone, pilot_number_phone)
);

-- =====================================================================
-- INDEXES on foreign keys (Postgres does not auto-index FK columns)
-- =====================================================================

CREATE INDEX idx_department_country         ON department (country_id_department);
CREATE INDEX idx_city_department            ON city (department_id_city);
CREATE INDEX idx_airport_city               ON airport (city_airport);
CREATE INDEX idx_aircraft_brand             ON aircraft (manufacture_aircraft);
CREATE INDEX idx_passenger_gender           ON passenger (gender_passenger);
CREATE INDEX idx_passenger_nationality      ON passenger (nationality_passenger);
CREATE INDEX idx_pilot_gender               ON pilot (gender_pilot);
CREATE INDEX idx_flight_origin              ON flight (origin_airport_flight);
CREATE INDEX idx_flight_destination         ON flight (destination_airport_flight);
CREATE INDEX idx_flight_aircraft            ON flight (aircraft_id_flight);
CREATE INDEX idx_flight_pilot               ON flight (pilot_id_flight);
CREATE INDEX idx_flight_status              ON flight (status_flight);
CREATE INDEX idx_reservation_status         ON reservation (status_reservation);
CREATE INDEX idx_reservation_passenger      ON reservation (passenger_id_reservation);
CREATE INDEX idx_reservation_flight         ON reservation (flight_id_registration);
CREATE INDEX idx_ticket_payment_status      ON ticket (payment_status_ticket);
CREATE INDEX idx_passenger_phone_phone      ON passenger_phone (id_number_phone);
CREATE INDEX idx_passenger_phone_passenger  ON passenger_phone (passenger_number_phone);
CREATE INDEX idx_pilot_phone_phone          ON pilot_phone (id_number_phone);
CREATE INDEX idx_pilot_phone_pilot          ON pilot_phone (pilot_number_phone);

COMMIT;