// Author: Cristian Camilo Cortes Ortiz <Cristianco9>

// Request the user inputs
const age = parseInt(prompt("Enter your age:"));
const accessCard = prompt(
    "Do you have an access card? (yes or no):"
).toLowerCase();

// Data validation
if(isNaN(age)) {
    alert("Age must be a number.");
} else if (age < 0 || age > 120) {
    alert("Age must be between 0 and 120.");
} else if (accessCard !== "yes" && accessCard !== "no") {
    alert("Access card must be yes or no.");
} else {
    // Nested conditionals logic
    if (age >= 18) {
        if (accessCard === "yes") {
            alert("Access granted.")
        } else {
            alert("Access denied. Access card required.")
        }
    } else {
        alert("Access denied. Minimum age required.");
    }
}

/*
---------------------------------------
Desktop Test
Access Control System
---------------------------------------

age = 25     accessCard = yes
age >= 18 → check access card
accessCard = yes → Access granted

Result:
Access granted.


---------------------------------------

age = 30     accessCard = no
age >= 18 → check access card
accessCard = no → Access denied

Result:
Access denied. Access card required.


---------------------------------------

age = 17     accessCard = yes
age < 18 → access denied

Result:
Access denied. Minimum age required.


---------------------------------------

age = 15     accessCard = no
age < 18 → access denied

Result:
Access denied. Minimum age required.


---------------------------------------

age = -5     accessCard = yes
age < 0 → validation error

Result:
Age must be between 0 and 120.


---------------------------------------

age = 150     accessCard = yes
age > 120 → validation error

Result:
Age must be between 0 and 120.


---------------------------------------

age = twenty     accessCard = yes
age is not a number → validation error

Result:
Age must be a number.


---------------------------------------

age = 25     accessCard = maybe
accessCard !== yes or no → validation error

Result:
Access card must be yes or no.

---------------------------------------
*/