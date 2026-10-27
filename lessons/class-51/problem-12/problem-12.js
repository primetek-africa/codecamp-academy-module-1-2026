// Author: Cristian Camilo Cortes Ortiz <Cristianco9>

// Request the user data
const age = parseInt(prompt('Enter your age:'));
const salary = parseFloat(prompt("Enter your monthly salary:"));
const employment = prompt(
    "Enter employment status: (employed, self-employed, unemployed)"
).toLowerCase();
const creditScore = parseInt(prompt("Enter your credit score:"));

// Global variables
let multiplier;
let loanAmount;

// Conditionals
// Data validation
if (isNaN(age)) {
    alert("Invalid age. Try again.");
} else if (age < 18) {
    alert("Minimum age required is 18.");
} else if (age > 65) {
    alert("Maximum age allowed is 65.");
} else if (isNaN(salary)) {
    alert("Invalid salary. Try again.");
} else if (salary <= 0) {
    alert("Monthly salary invalid.");
} else if (isNaN(creditScore)) {
    alert("Invalid credit score. Try again.");
} else if (
    employment !== "employed" &&
    employment !== "self-employed" &&
    employment !== "unemployed"
) {
    alert("Invalid employment status.");
} else {
    // Business rules (logic)
    // Employment logic
    if (employment === "unemployed") {
        alert("Loan rejected. Get a job!!!");
    } else {
        // Credit score logic
        if (creditScore >= 750) {
            multiplier = 5;
        } else if (creditScore >= 650) {
            multiplier = 3;
        } else if (creditScore >= 550) {
            multiplier = 2;
        } else {
            alert("Loan rejected. Improve your credit score.");
            multiplier = 0;
        }

        // Loan calculation
        if (multiplier > 0) {
            loanAmount = salary * multiplier;

            // self-employed rule
            if (employment === "self-employed") {
                loanAmount = loanAmount * 0.8;
            }

            alert("Loan approved. Amount: $" + loanAmount + " USD.");
        }
    }
}

/*
---------------------------------------
Desktop Test
Bank Loan Approval System
---------------------------------------

age = 30     salary = 2000     employment = employed        creditScore = 760
=> Loan approved. Amount: $10000 USD.

age = 40     salary = 3000     employment = employed        creditScore = 700
=> Loan approved. Amount: $9000 USD.

age = 35     salary = 2500     employment = employed        creditScore = 580
=> Loan approved. Amount: $5000 USD.

age = 45     salary = 4000     employment = self-employed   creditScore = 760
=> Loan approved. Amount: $16000 USD.

age = 50     salary = 3500     employment = self-employed   creditScore = 660
=> Loan approved. Amount: $8400 USD.

age = 28     salary = 2200     employment = unemployed      creditScore = 720
=> Loan rejected. Get a job!!!

age = 33     salary = 2400     employment = employed        creditScore = 500
=> Loan rejected. Improve your credit score.

age = "hello"    salary = 2000     employment = employed    creditScore = 700
=> Invalid age. Try again.

age = 16     salary = 2000     employment = employed        creditScore = 700
=> Minimum age required is 18.

age = 70     salary = 2000     employment = employed        creditScore = 700
=> Maximum age allowed is 65.

age = 30     salary = "hello"  employment = employed        creditScore = 700
=> Invalid salary. Try again.

age = 30     salary = -500     employment = employed        creditScore = 700
=> Monthly salary invalid.

age = 30     salary = 2000     employment = employed        creditScore = "hello"
=> Invalid credit score. Try again.

age = 30     salary = 2000     employment = freelancer      creditScore = 700
=> Invalid employment status.

---------------------------------------
*/