// Author: Cristian Camilo Cortes Ortiz <Cristianco9>

console.log("************************");
console.log("Example 1");
let temperature = 35;
// Ternary operator
let weather = temperature > 30  // Conditional to evaluate
    ? "Hot day" // ? => True clausula
    : "Normal temperature"; // : =>  False clausula
console.log("Ternary Operator:");
console.log(weather);

// Classic conditional statement
if (temperature > 30) {
    weather = "Hot day";
} else {
    weather = "Normal temperature";
}
console.log("If - Else statement:");
console.log(weather);
console.log("************************");

console.log("************************");
console.log("Example 2");
// Ternary Operator
let score = 75;
let result = score >= 60 ? "Student passed" : "Student failed";
console.log("Ternary Operator:");
console.log(result);

// If - Else statement
if (score >= 60) {
    result = "Student passed";
} else {
    result = "Student failed";
}
console.log("If - Else statement:");
console.log(result);
console.log("************************");

console.log("************************");
console.log("Example 3");
// Ternary Operator
let isLoggedIn = true;
let message = isLoggedIn ? "Welcome back!" : "Please log in!";
console.log("Ternary Operator:");
console.log(message);

// If - Else statement
if (isLoggedIn) {
    message = "Welcome back!";
} else {
    message = "Please log in!";
}
console.log("If - Else statement:");
console.log(message);
console.log("************************");

console.log("************************");
console.log("Example 4");
// Ternary Operator
let age = 20;
let income = 800;
let loan = 
    age > 18
        ? income > 1000
            ? "Approved"
            : "Review"
        : "Rejected";
console.log("Ternary Operator:");
console.log(loan);

// If - Else statement
if (age > 18) {
    if (income > 1000) {
        loan = "Approved";
    } else {
        loan = 'Review';
    }
} else {
    "Rejected";
}
console.log("If - Else statement:");
console.log(loan);
console.log("************************");

console.log("************************");
console.log("Example 5");
// Ternary Operator
let number = 10;
let type = number % 2 === 0 ? "Even" : "Odd";
console.log("Ternary Operator:");
console.log(type);

// If - Else statement
if (number % 2 === 0) {
    type = "Even";
} else {
    type = "Odd";
}
console.log("If - Else statement:");
console.log(type);
console.log("************************");