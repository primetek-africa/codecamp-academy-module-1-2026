-- ============================================================
-- HOSPITAL MANAGEMENT SYSTEM - SEED DATA
-- ============================================================

BEGIN;
 
-- ============================================================
-- GENDER
-- ============================================================
 
INSERT INTO gender (
    name_gender,
    description_gender
)
VALUES
    ('Male', 'Male gender'),
    ('Female', 'Female gender'),
    ('Non-binary', 'Non-binary gender');
 
-- ============================================================
-- SPECIALTY
-- ============================================================
 
INSERT INTO specialty (
    name_specialty,
    description_specialty
)
VALUES
    ('Cardiology', 'Diagnosis and treatment of heart conditions'),
    ('Pediatrics', 'Medical care for children'),
    ('Neurology', 'Treatment of nervous system disorders'),  -- FIX: shortened to fit VARCHAR(50)
    ('Dermatology', 'Diagnosis and treatment of skin conditions'),
    ('Orthopedics', 'Treatment of bones and musculoskeletal conditions');
 
-- ============================================================
-- CATALOG STATUS
-- ============================================================
 
INSERT INTO catalog_status (
    name_c_status,
    description_c_status
)
VALUES
    ('Scheduled', 'Appointment has been scheduled'),
    ('Confirmed', 'Appointment has been confirmed'),
    ('Completed', 'Appointment has been completed'),
    ('Cancelled', 'Appointment has been cancelled'),
    ('No Show', 'Patient did not attend the appointment');
 
-- ============================================================
-- CATALOG DIAGNOSIS
-- ============================================================
 
INSERT INTO catalog_diagnosis (
    name_c_diagnosis,
    description_c_diagnosis
)
VALUES
    ('Hypertension', 'High blood pressure'),
    ('Influenza', 'Viral respiratory infection'),
    ('Migraine', 'Neurological condition causing headaches'),
    ('Dermatitis', 'Inflammation of the skin'),
    ('Fracture', 'Broken or cracked bone'),
    ('Diabetes', 'Chronic condition affecting blood sugar');
 
-- ============================================================
-- CATALOG TREATMENT
-- ============================================================
 
INSERT INTO catalog_treatment (
    name_c_treatment,
    description_c_treatment
)
VALUES
    ('Medication', 'Treatment using prescribed medication'),
    ('Physical Therapy', 'Therapeutic physical exercises'),
    ('Surgery', 'Surgical medical procedure'),
    ('Observation', 'Medical observation and monitoring'),
    ('Lifestyle Changes', 'Recommended changes to lifestyle'),
    ('Follow-up', 'Additional medical evaluation');
 
-- ============================================================
-- PHONE
-- ============================================================
 
INSERT INTO phone (
    number_phone
)
VALUES
    ('555-1001'),
    ('555-1002'),
    ('555-1003'),
    ('555-1004'),
    ('555-1005'),
    ('555-1006'),
    ('555-1007'),
    ('555-1008'),
    ('555-1009'),
    ('555-1010'),
    ('555-1011'),
    ('555-1012');
 
-- ============================================================
-- ROOM
-- (id_room will be generated as 1..7 in this insertion order)
-- ============================================================
 
INSERT INTO room (
    room_number,
    type_room,
    floor_room,
    capacity_room
)
VALUES
    ('101', 'consultation', 1, 2),   -- id_room = 1
    ('102', 'consultation', 1, 2),   -- id_room = 2
    ('103', 'consultation', 1, 2),   -- id_room = 3
    ('201', 'surgery', 2, 4),        -- id_room = 4
    ('202', 'surgery', 2, 4),        -- id_room = 5
    ('301', 'emergency', 3, 6),      -- id_room = 6
    ('302', 'emergency', 3, 6);      -- id_room = 7
 
-- ============================================================
-- PATIENT
-- ============================================================
 
INSERT INTO patient (
    first_name_patient,
    last_name_patient,
    date_birth_patient,
    gender_patient,
    email_patient,
    address_patient
)
VALUES
    ('Carlos', 'Martinez', '1988-04-15', 1, 'carlos.martinez@email.com', '12 Main Street'),
    ('Laura', 'Gomez', '1992-07-22', 2, 'laura.gomez@email.com', '25 Oak Avenue'),
    ('Michael', 'Johnson', '1975-11-03', 1, 'michael.johnson@email.com', '48 Pine Street'),
    ('Sofia', 'Rodriguez', '2001-02-18', 2, 'sofia.rodriguez@email.com', '73 Central Avenue'),
    ('Daniel', 'Wilson', '1969-09-27', 1, 'daniel.wilson@email.com', '91 Lake Road'),
    ('Emma', 'Taylor', '1998-12-10', 2, 'emma.taylor@email.com', '15 Park Avenue'),
    ('James', 'Brown', '1983-06-05', 1, 'james.brown@email.com', '33 River Street'),
    ('Isabella', 'Davis', '2010-03-14', 2, 'isabella.davis@email.com', '64 Hill Road');
 
-- ============================================================
-- DOCTOR
-- ============================================================
 
INSERT INTO doctor (
    first_name_doctor,
    last_name_doctor,
    gender_doctor,
    medical_license_doctor,
    specialty_doctor,
    email_doctor
)
VALUES
    ('Robert', 'Anderson', 1, 'MED-1001', 1, 'robert.anderson@hospital.com'),
    ('Maria', 'Thomas', 2, 'MED-1002', 2, 'maria.thomas@hospital.com'),
    ('David', 'Jackson', 1, 'MED-1003', 3, 'david.jackson@hospital.com'),
    ('Jennifer', 'White', 2, 'MED-1004', 4, 'jennifer.white@hospital.com'),
    ('William', 'Harris', 1, 'MED-1005', 5, 'william.harris@hospital.com');
 
-- ============================================================
-- PATIENT PHONE
-- ============================================================
 
INSERT INTO patient_phone (
    id_number_phone,
    patient_id_phone
)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 1),
    (10, 3);
 
-- ============================================================
-- DOCTOR PHONE
-- ============================================================
 
INSERT INTO doctor_phone (
    id_number_phone,
    doctor_id_phone
)
VALUES
    (9, 1),
    (10, 2),
    (11, 3),
    (12, 4),
    (1, 5);
 
-- ============================================================
-- MEDICAL RECORD
-- ============================================================
 
INSERT INTO medical_record (
    patient_id_medical_record,
    blood_type_medical_record,
    allergies_medical_record,
    chronic_conditions_medical_record,
    observations_medical_record
)
VALUES
    (1, 'O+', 'Penicillin', 'Hypertension', 'Requires regular blood pressure monitoring'),
    (2, 'A+', 'None', 'None', 'No significant observations'),
    (3, 'B+', 'Peanuts', 'Diabetes', 'Requires dietary monitoring'),
    (4, 'O-', 'Dust', 'Asthma', 'Uses prescribed inhaler'),
    (5, 'AB+', 'None', 'Hypertension', 'Regular cardiovascular monitoring'),
    (6, 'A-', 'Latex', 'None', 'Latex allergy must be considered'),
    (7, 'B-', 'Penicillin', 'Migraine', 'Regular neurological evaluation'),
    (8, 'O+', 'None', 'None', 'Pediatric patient');
 
-- ============================================================
-- APPOINTMENT
-- FIX: room_appointment now uses the real id_room (1-7) instead
-- of the room_number label (101, 102, 201...).
-- Mapping used: 101->1, 102->2, 103->3, 201->4, 202->5, 301->6, 302->7
-- ============================================================
 
INSERT INTO appointment (
    date_appointment,
    time_appointment,
    status_appointment,
    patience_id_appointment,
    doctor_id_appointment,
    diagnosis_appointment,
    treatment_appointment,
    room_appointment,
    notes_appointment
)
VALUES
    ('2026-08-11', '08:00', 2, 1, 1, 1, 1, 1, 'Blood pressure follow-up'),
    ('2026-08-11', '09:00', 3, 2, 2, 2, 1, 2, 'Influenza symptoms'),
    ('2026-08-12', '10:00', 1, 3, 3, 3, 1, 3, 'Recurring headaches'),
    ('2026-08-12', '11:00', 2, 4, 4, 4, 1, 1, 'Skin irritation'),
    ('2026-08-13', '08:30', 3, 5, 1, 1, 5, 2, 'Cardiovascular evaluation'),
    ('2026-08-13', '09:30', 4, 6, 5, 5, 3, 4, 'Fracture treatment'),
    ('2026-08-14', '10:30', 5, 7, 3, 3, 6, 3, 'Patient did not attend'),
    ('2026-08-14', '14:00', 1, 8, 2, 2, 4, 6, 'Pediatric evaluation'),
    ('2026-08-15', '08:00', 2, 1, 1, 1, 5, 2, 'Follow-up appointment'),
    ('2026-08-15', '09:00', 3, 3, 1, 6, 1, 3, 'Diabetes control appointment');
 
COMMIT;