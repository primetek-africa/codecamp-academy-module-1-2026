/*
    Author: Cristian Camilo Cortes Ortiz <Cristianco9>
    Problem: Hospital Management System
*/

const patients = [
    {
        name: "Michael Johnson",
        id: "PT1001",
        age: 45,
        diagnosis: "Pneumonia",
        hospitalizationCost: 3500,
        admitted: true
    },
    {
        name: "Sarah Williams",
        id: "PT1002",
        age: 30,
        diagnosis: "Fracture",
        hospitalizationCost: 2200,
        admitted: false
    },
    {
        name: "David Brown",
        id: "PT1003",
        age: 60,
        diagnosis: "Diabetes",
        hospitalizationCost: 4100,
        admitted: true
    },
    {
        name: "Emma Davis",
        id: "PT1004",
        age: 25,
        diagnosis: "Migraine",
        hospitalizationCost: 900,
        admitted: false
    },
    {
        name: "James Wilson",
        id: "PT1005",
        age: 50,
        diagnosis: "Hypertension",
        hospitalizationCost: 2800,
        admitted: true
    }
];

// 1. Display all patience
function displayPatiences() {
    patients.forEach(function(patient) {
        console.log(`
            Name:      ${patient.name}
            Diagnosis: ${patient.diagnosis}
            Admitted:  ${patient.admitted}
        `);
    });
}

// 2. Find patient by ID
function findPatientById(id) {
    return patients.find(function(patient) {
        return patient.id === id;
    });
}

// 3. Count admitted patients
function countAdmittedPatients() {
    return patients.filter(function(patient) {
        return patient.admitted;
    }).length;
}

// 4. Calculate total hospitalization cost
function calculateTotalCost() {
    return patients.reduce(function(total, patient) {
        return total + patient.hospitalizationCost;
    }, 0);
}

// 5. Add new patient
function addPatient(patient) {
    patients.push(patient);
}

// 6. Get patients by diagnosis
function getPatientByDiagnosis(diagnosis) {
    return patients.filter(function(patient) {
        return patient.diagnosis.toLowerCase() === diagnosis.toLowerCase();
    });
}

// Testing the system

console.log("***************************");
console.log("All Patients:");
displayPatiences();
console.log("***************************");
console.log("Find Patient:");
console.log(findPatientById("PT1003"));
console.log("***************************");
console.log("Admitted patients:");
console.log(countAdmittedPatients());
console.log("***************************");
console.log("Total Hospitalization Cost:");
console.log("$", calculateTotalCost(), " USD.");
console.log("***************************");
console.log("Patients with Diabetes:");
console.log(getPatientByDiagnosis("Diabetes"));
console.log("***************************");
console.log("Add a new Patient:");
addPatient({
    name: "Anthony Joshua",
    id: "PT1006",
    age: 39,
    diagnosis: "Allergy",
    hospitalizationCost: 1200,
    admitted: false
});
console.log("***************************");
console.log("Updated Patients List:");
console.log(patients);
console.log("***************************");

console.log(typeof(patients[0].name));
