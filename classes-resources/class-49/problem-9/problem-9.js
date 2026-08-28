// Author: Cristian Camilo Cortes Ortiz <Cristianco9>

// Request the user data
const age = parseInt(prompt("Enter your age:"));
const isStudent = prompt("Are you a student? (yes/no)").toLowerCase();
// HELLO GUYS => toLowerCase(); => hello guys

// Conditionals
// Validate the user age
if (isNaN(age) || age < 0 || age > 100) {
    alert("Invalid age.");
}
else if (isStudent !== "yes" && isStudent !== "no") {
    alert("invalid student status");
} else {
    // business rules (child - teenager)
    if (age < 18) {
        if (isStudent === "yes") {
            alert("50% discount");
        } else {
            alert("30% discount");
        }
    } else {
        // business rules (adults)
        if (isStudent === "yes") {
            alert("20% discount");
        } else {
            alert("No discount");
        }
    }
}

/*
---------------------------------------
Desktop Test
---------------------------------------

age = 16     isStudent = yes
=> 50% discount

age = 16     isStudent = no
=> 30% discount

age = 25     isStudent = yes
=> 20% discount

age = 25     isStudent = no
=> No discount

age = -3     isStudent = yes
=> Invalid age.

age = 120    isStudent = no
=> Invalid age.

age = "hello"   isStudent = yes
=> Invalid age.

age = 17     isStudent = maybe
=> Invalid student status

age = 30     isStudent = student
=> Invalid student status

---------------------------------------
*/