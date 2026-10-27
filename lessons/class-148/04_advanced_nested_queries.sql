-- ============================================================
-- HOSPITAL MANAGEMENT SYSTEM
-- ADVANCED NESTED SQL QUERIES - SOLUTIONS
-- ============================================================

-- ============================================================
-- QUERY 1
-- Doctors Above the Average
-- ============================================================
 
SELECT
    d.id_doctor,
    d.first_name_doctor,
    d.last_name_doctor,
    COUNT(a.id_appointment) AS appointment_count
FROM doctor AS d
JOIN appointment AS a
    ON a.doctor_id_appointment = d.id_doctor
GROUP BY
    d.id_doctor,
    d.first_name_doctor,
    d.last_name_doctor
HAVING COUNT(a.id_appointment) > (
    SELECT AVG(appointment_count)
    FROM (
        SELECT
            doctor_id_appointment,
            COUNT(id_appointment) AS appointment_count
        FROM appointment
        GROUP BY doctor_id_appointment
    ) AS doctor_counts
)
ORDER BY appointment_count DESC;
 
 
-- ============================================================
-- QUERY 2
-- Patients With More Appointments Than Average
-- ============================================================
 
SELECT
    p.id_patient,
    p.first_name_patient,
    p.last_name_patient,
    COUNT(a.id_appointment) AS appointment_count
FROM patient AS p
JOIN appointment AS a
    ON a.patience_id_appointment = p.id_patient
GROUP BY
    p.id_patient,
    p.first_name_patient,
    p.last_name_patient
HAVING COUNT(a.id_appointment) > (
    SELECT AVG(appointment_count)
    FROM (
        SELECT
            patience_id_appointment,
            COUNT(id_appointment) AS appointment_count
        FROM appointment
        GROUP BY patience_id_appointment
    ) AS patient_counts
)
ORDER BY appointment_count DESC;
 
 
-- ============================================================
-- QUERY 3
-- Doctors Without Cancelled Appointments
-- ============================================================
 
SELECT
    d.id_doctor,
    d.first_name_doctor,
    d.last_name_doctor,
    d.medical_license_doctor
FROM doctor AS d
WHERE NOT EXISTS (
    SELECT 1
    FROM appointment AS a
    JOIN catalog_status AS cs
        ON cs.id_c_status = a.status_appointment
    WHERE a.doctor_id_appointment = d.id_doctor
      AND cs.name_c_status = 'Cancelled'
)
ORDER BY
    d.last_name_doctor,
    d.first_name_doctor;
 
 
-- ============================================================
-- QUERY 4
-- Patients With the Same Diagnosis as Carlos Martinez
-- ============================================================
-- Note: assumes a single patient named 'Carlos Martinez'. If two
-- patients could share that exact name, the scalar subquery below
-- would raise "more than one row returned by a subquery used as
-- an expression". Add LIMIT 1 there (or filter by id_patient
-- instead of name) if that's a real possibility in your data.
 
SELECT DISTINCT
    p.id_patient,
    p.first_name_patient,
    p.last_name_patient,
    cd.name_c_diagnosis
FROM patient AS p
JOIN appointment AS a
    ON a.patience_id_appointment = p.id_patient
JOIN catalog_diagnosis AS cd
    ON cd.id_c_diagnosis = a.diagnosis_appointment
WHERE a.diagnosis_appointment IN (
    SELECT DISTINCT
        a_carlos.diagnosis_appointment
    FROM appointment AS a_carlos
    JOIN patient AS p_carlos
        ON p_carlos.id_patient = a_carlos.patience_id_appointment
    WHERE p_carlos.first_name_patient = 'Carlos'
      AND p_carlos.last_name_patient = 'Martinez'
)
AND p.id_patient <> (
    SELECT p_carlos.id_patient
    FROM patient AS p_carlos
    WHERE p_carlos.first_name_patient = 'Carlos'
      AND p_carlos.last_name_patient = 'Martinez'
)
ORDER BY
    p.last_name_patient,
    p.first_name_patient;
 
 
-- ============================================================
-- QUERY 5
-- Doctors Above the Average of Completed Appointments
-- ============================================================
-- FIX: the inner average subquery now uses
-- COUNT(...) FILTER (WHERE ...) instead of LEFT JOIN + WHERE.
-- This keeps every doctor in the average (counting 0 completed
-- appointments where applicable) instead of silently dropping
-- doctors who have never had a completed appointment.
 
SELECT
    d.id_doctor,
    d.first_name_doctor,
    d.last_name_doctor,
    s.name_specialty,
    COUNT(a.id_appointment) AS completed_appointments
FROM doctor AS d
JOIN specialty AS s
    ON s.id_specialty = d.specialty_doctor
JOIN appointment AS a
    ON a.doctor_id_appointment = d.id_doctor
JOIN catalog_status AS cs
    ON cs.id_c_status = a.status_appointment
WHERE cs.name_c_status = 'Completed'
GROUP BY
    d.id_doctor,
    d.first_name_doctor,
    d.last_name_doctor,
    s.name_specialty
HAVING COUNT(a.id_appointment) > (
    SELECT AVG(completed_appointments)
    FROM (
        SELECT
            d_inner.id_doctor,
            COUNT(a_inner.id_appointment) FILTER (
                WHERE cs_inner.name_c_status = 'Completed'
            ) AS completed_appointments
        FROM doctor AS d_inner
        LEFT JOIN appointment AS a_inner
            ON a_inner.doctor_id_appointment = d_inner.id_doctor
        LEFT JOIN catalog_status AS cs_inner
            ON cs_inner.id_c_status = a_inner.status_appointment
        GROUP BY d_inner.id_doctor
    ) AS doctor_completed_counts
)
ORDER BY completed_appointments DESC;
 