// Author: Cristian Camilo Cortes Ortiz <Cristianco9>

// Request user inputs
const grade = parseFloat(
    prompt("Enter the student;s final grade (0-100):")
);
const attendance = parseFloat(
    prompt("Enter the attendance percentage (0-100):")
);
const project = prompt(
    "Was the final project submitted? (yes or no):"
).toLowerCase();

// Data validation
if (isNaN(grade)) {
    alert("The grade should be a number.");
} else if (grade < 0 || grade > 100) {
    alert("The grade should be between 0 - 100.");
} else if (isNaN(attendance)) {
    alert("The attendance should be a number.");
} else if (attendance < 0 || attendance > 100) {
    alert("The attendance should be between 0 - 100.");
} else if (project !== "yes" && project !== "no") {
    alert("The final project should be yes or no.");
} else {
    let result = "";
    let performance = "";

    // First conditional: Attendance rule
    if (attendance < 75) {
        result = "Fail (insufficient attendance)";
    } else {
        // Grade evaluation
        if (grade >= 90) {
            result = "PASS";
            performance = "Excellent";
        } else if (grade >= 70) {
            // Nested conditional project
            if (project === "yes") {
                result = "PASS";
                performance = "Good";
            } else {
                result = "REMEDIAL EXAM REQUIRED";
            }
        } else if (grade >= 50) {
            result = "REMEDIAL EXAM REQUIRED";
        } else {
            result = "FAIL";
        }
    }

    // Output
    alert("Student grade: " + grade);
    alert("Attendance: " + attendance + "%");
    alert("Final project submitted: " + project);

    alert("Result: " + result);

    if (performance !== "") {
        alert("Performance level: " + performance);
    }
}

/*
---------------------------------------
Desktop Test
University Course Grading System
---------------------------------------

Case 1
grade = 95
attendance = 90
project = yes

attendance >= 75 → continue
grade >= 90 → PASS
performance = Excellent

Result:
PASS
Performance: Excellent


---------------------------------------

Case 2
grade = 85
attendance = 80
project = yes

attendance >= 75 → continue
grade >= 70 → check project
project = yes → PASS

Result:
PASS
Performance: Good


---------------------------------------

Case 3
grade = 85
attendance = 80
project = no

attendance >= 75 → continue
grade >= 70 → check project
project = no → remedial exam

Result:
REMEDIAL EXAM REQUIRED


---------------------------------------

Case 4
grade = 60
attendance = 85
project = yes

attendance >= 75 → continue
grade >= 50 → remedial exam

Result:
REMEDIAL EXAM REQUIRED


---------------------------------------

Case 5
grade = 40
attendance = 90
project = yes

attendance >= 75 → continue
grade < 50 → fail

Result:
FAIL

---------------------------------------
*/