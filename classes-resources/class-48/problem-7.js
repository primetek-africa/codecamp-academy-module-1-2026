// Author: Cristian Camilo Cortes Ortiz <Cristianco9>

// Require the user salary and credit score
let salary = parseFloat(prompt("Enter your monthly salary:"));
let creditScore = parseFloat(prompt("Enter your credit score:")); 

// conditionals
// validate the user data
if (isNaN(salary) || isNaN(creditScore)) {
    alert("Invalid input. Please enter numeric values.");
} 
// case 1: Both conditionals satisfied
else if (salary >= 2000 && creditScore >= 700) {
    alert("loan Approved");
}
// case 2: Salary is good but credit score is too low
else if (salary >= 2000 && creditScore < 700) {
    alert("Loan Rejected. Your credit score is too low.");
}
// case 3: Credit score is good but the salary is too low
else if (salary < 2000 && creditScore >= 700) {
    alert("Loan Rejected. Your salary does not meet the minimum requirement");
}
// case 4: Both conditionals fail
else {
    alert("Loan Rejected. Both salary and credit score do not meet the requirements");
}
/*
    ---------------------
    Desktop test
    ---------------------
    salary = 1900; creditScore = 690;
    => Loan Rejected. Both salary and credit score do not meet the requirements.

    salary = 3000; creditScore = 500;
    => Loan Rejected. Your credit score is too low.

    salary = 1900; creditScore = 800;
    => Loan Rejected. Your salary does not meet the minimum requirement.
    
    salary = 2200; creditScore = 720;
    => Loan Approved.

    salary = "hello"; creditScore = 800;
    => Invalid input. Please enter numeric values.

    salary = 2700; creditScore = "hello";
    => Invalid input. Please enter numeric values.
    ---------------------
*/