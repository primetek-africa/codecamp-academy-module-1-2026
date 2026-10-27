// Author: Cristian Camilo Cortes Ortiz <Cristianco9>

// Request user (employee) data
const yearsOfExperience = parseInt(prompt("Enter years of experience:"));
const performanceScore = parseFloat(prompt("Enter performance score [0-100]"));

// Validate the Inputs
if (isNaN(yearsOfExperience) || yearsOfExperience < 0 || yearsOfExperience > 80) {
    alert("Invalid years of experience.");
}
else if (isNaN(performanceScore) || performanceScore < 0 || performanceScore > 100) {
    alert("Invalid performance score.");
}
// Business logic (rules)
else if (yearsOfExperience >= 5 && performanceScore >= 85) {
    alert("Full bonus.");
}
else if (yearsOfExperience >= 3 && performanceScore >= 70) {
    alert("Partial bonus.");
}
else if (yearsOfExperience < 3 && performanceScore >= 90) {
    alert("Special recognition bonus.");
}
else {
    alert("No bonus.");
}

/*
---------------------------------------
Desktop Test
---------------------------------------

yearsOfExperience = 6;          performanceScore = 90;
=> Full bonus

yearsOfExperience = 4;          performanceScore = 75;
=> Parcial bonus

yearsOfExperience = 2;          performanceScore = 95;
=> Special recognition bonus

yearsOfExperience = 2;          performanceScore = 60;
=> No bonus.

yearsOfExperience = 5;          performanceScore = 84;
=> Parcial bonus

yearsOfExperience = -1;         performanceScore = 80;
=> Invalid years of experience

yearsOfExperience = 3;          performanceScore = 120;
=> Invalid performance score

yearsOfExperience = "hello";    performanceScore = 90;
=> Invalid years of experience 

yearsOfExperience = 4;          performanceScore = "hello";
=> Invalid performance score

---------------------------------------
*/