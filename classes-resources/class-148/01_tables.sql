-- ============================================================
-- HOSPITAL MANAGEMENT SYSTEM - PostgreSQL DDL (3NF)
-- ============================================================

BEGIN;

-- ------------------------------------------------------------
-- ENUM TYPES
-- ------------------------------------------------------------
CREATE TYPE room_type AS ENUM ('consultation', 'surgery', 'emergency');
CREATE TYPE blood_type_enum AS ENUM ('O+', 'O-', 'A+', 'A-', 'B+', 'B-', 'AB+', 'AB-');

-- ------------------------------------------------------------
-- CATALOG / LOOKUP TABLES (no dependencies)
-- ------------------------------------------------------------

CREATE TABLE gender (
    id_gender           INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name_gender         VARCHAR(20)  NOT NULL UNIQUE,
    description_gender  VARCHAR(50)  NOT NULL
);

CREATE TABLE specialty (
    id_specialty           INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name_specialty         VARCHAR(20)  NOT NULL UNIQUE,
    description_specialty  VARCHAR(50)  NOT NULL
);

CREATE TABLE catalog_status (
    id_c_status               INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name_c_status             VARCHAR(150) NOT NULL UNIQUE,
    description_c_status      VARCHAR(200) NOT NULL
);

CREATE TABLE catalog_diagnosis (
    id_c_diagnosis            INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name_c_diagnosis          VARCHAR(150) NOT NULL UNIQUE,
    description_c_diagnosis   VARCHAR(200) NOT NULL
);

CREATE TABLE catalog_treatment (
    id_c_treatment              INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name_c_treatment            VARCHAR(150) NOT NULL UNIQUE,
    description_c_treatment     VARCHAR(200) NOT NULL
);

CREATE TABLE phone (
    id_phone       INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    number_phone   VARCHAR(20) NOT NULL
);

CREATE TABLE room (
    id_room         INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    room_number     VARCHAR(10) NOT NULL UNIQUE,
    type_room       room_type   NOT NULL,
    floor_room      INT         NOT NULL,
    capacity_room   INT         NOT NULL
);

-- ------------------------------------------------------------
-- CORE ENTITIES
-- ------------------------------------------------------------

CREATE TABLE patient (
    id_patient          INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name_patient  VARCHAR(50)  NOT NULL,
    last_name_patient   VARCHAR(50)  NOT NULL,
    date_birth_patient  DATE         NOT NULL,
    gender_patient      INT          NOT NULL,
    email_patient       VARCHAR(100),
    address_patient     VARCHAR(150) NOT NULL,
    CONSTRAINT fk_patient_gender
        FOREIGN KEY (gender_patient) REFERENCES gender (id_gender)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE doctor (
    id_doctor               INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name_doctor       VARCHAR(50)  NOT NULL,
    last_name_doctor        VARCHAR(50)  NOT NULL,
    gender_doctor           INT          NOT NULL,
    medical_license_doctor  VARCHAR(30)  NOT NULL UNIQUE,
    specialty_doctor        INT          NOT NULL,
    email_doctor            VARCHAR(100) NOT NULL UNIQUE,
    CONSTRAINT fk_doctor_gender
        FOREIGN KEY (gender_doctor) REFERENCES gender (id_gender)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_doctor_specialty
        FOREIGN KEY (specialty_doctor) REFERENCES specialty (id_specialty)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

-- ------------------------------------------------------------
-- APPOINTMENT (depends on patient, doctor, status, diagnosis,
-- treatment, room)
-- ------------------------------------------------------------

CREATE TABLE appointment (
    id_appointment              INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    date_appointment            DATE,
    time_appointment            TIME,
    status_appointment          INT  NOT NULL,
    patience_id_appointment     INT  NOT NULL,
    doctor_id_appointment       INT  NOT NULL,  
    diagnosis_appointment       INT  NOT NULL,   
    treatment_appointment       INT  NOT NULL,   
    room_appointment            INT  NOT NULL,   
    notes_appointment           TEXT,
    CONSTRAINT fk_appointment_status
        FOREIGN KEY (status_appointment) REFERENCES catalog_status (id_c_status)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_appointment_patient
        FOREIGN KEY (patience_id_appointment) REFERENCES patient (id_patient)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_appointment_doctor
        FOREIGN KEY (doctor_id_appointment) REFERENCES doctor (id_doctor)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_appointment_diagnosis
        FOREIGN KEY (diagnosis_appointment) REFERENCES catalog_diagnosis (id_c_diagnosis)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_appointment_treatment
        FOREIGN KEY (treatment_appointment) REFERENCES catalog_treatment (id_c_treatment)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_appointment_room
        FOREIGN KEY (room_appointment) REFERENCES room (id_room)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

-- ------------------------------------------------------------
-- PATIENT / DOCTOR PHONE (bridge tables implementing the N:N
-- relationship between patient/doctor and phone)
-- ------------------------------------------------------------

CREATE TABLE patient_phone (
    id_patient_phone   INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_number_phone    INT NOT NULL, 
    patient_id_phone   INT NOT NULL,   
    CONSTRAINT fk_patient_phone_phone
        FOREIGN KEY (id_number_phone) REFERENCES phone (id_phone)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_patient_phone_patient
        FOREIGN KEY (patient_id_phone) REFERENCES patient (id_patient)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT uq_patient_phone UNIQUE (id_number_phone, patient_id_phone)
);

CREATE TABLE doctor_phone (
    id_doctor_phone    INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_number_phone    INT NOT NULL,
    doctor_id_phone    INT NOT NULL,  
    CONSTRAINT fk_doctor_phone_phone
        FOREIGN KEY (id_number_phone) REFERENCES phone (id_phone)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_doctor_phone_doctor
        FOREIGN KEY (doctor_id_phone) REFERENCES doctor (id_doctor)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT uq_doctor_phone UNIQUE (id_number_phone, doctor_id_phone)
);

-- ------------------------------------------------------------
-- MEDICAL RECORD (1:1 with patient)
-- ------------------------------------------------------------

CREATE TABLE medical_record (
    id_medical_record                  INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    patient_id_medical_record          INT NOT NULL,
    blood_type_medical_record          blood_type_enum,
    allergies_medical_record           VARCHAR(200) NOT NULL,
    chronic_conditions_medical_record  VARCHAR(200) NOT NULL,
    observations_medical_record        VARCHAR(100),
    CONSTRAINT fk_medical_record_patient
        FOREIGN KEY (patient_id_medical_record) REFERENCES patient (id_patient)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- ------------------------------------------------------------
-- HELPFUL INDEXES ON FOREIGN KEYS
-- (PKs/UNIQUE already indexed automatically by Postgres)
-- ------------------------------------------------------------
CREATE INDEX idx_patient_gender            ON patient (gender_patient);
CREATE INDEX idx_doctor_gender             ON doctor (gender_doctor);
CREATE INDEX idx_doctor_specialty          ON doctor (specialty_doctor);
CREATE INDEX idx_appointment_status        ON appointment (status_appointment);
CREATE INDEX idx_appointment_patient       ON appointment (patience_id_appointment);
CREATE INDEX idx_appointment_doctor        ON appointment (doctor_id_appointment);
CREATE INDEX idx_appointment_diagnosis     ON appointment (diagnosis_appointment);
CREATE INDEX idx_appointment_treatment     ON appointment (treatment_appointment);
CREATE INDEX idx_appointment_room          ON appointment (room_appointment);
CREATE INDEX idx_patient_phone_phone       ON patient_phone (id_number_phone);
CREATE INDEX idx_patient_phone_patient     ON patient_phone (patient_id_phone);
CREATE INDEX idx_doctor_phone_phone        ON doctor_phone (id_number_phone);
CREATE INDEX idx_doctor_phone_doctor       ON doctor_phone (doctor_id_phone);

COMMIT;