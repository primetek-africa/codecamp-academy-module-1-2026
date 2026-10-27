// Author: Cristian Camilo Cortes Ortiz <Cristianco9>

// require to the user two number
var number1 = parseFloat(prompt("Enter the first number:"));
var number2 = parseFloat(prompt("Enter the second number:"));

// conditionals
if (number1 > number2) {
    alert("The first number is larger");
} else if (number2 > number1) {
    alert("The second number is larger"); 
} else if (number1 === number2) {
    alert("Both numbers are equal");
} else {
    alert("invalid input. Try again");
}

/*
    ---------------------
    Desktop test
    ---------------------
    number1 = 21 && number2  = 12  => The first number is larger
    number1 = 7 && number2   = 30  => The first number is larger
    number1 = 15 && number2  = 15  => Both numbers are equal
    ---------------------
*/