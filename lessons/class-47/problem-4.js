// Author: Cristian Camilo Cortes Ortiz <Cristianco9>

// require the user age
var age = prompt("Enter your age: ");

// Conditionals
if (age < 0) {
    // If the conditionals is true
    // execute the next code block
    alert("The user age cannot be less than 0");
} else if (age >= 0 && age < 13) {
    // && => means and like AND logic operator
    // if the previously conditional is false, and
    // else if this conditional is true
    // execute the next code block
    alert("You are a child");
} else if (age >= 13 && age <= 17) {
    // if the previously conditional is false, and
    // else if this conditional is true
    // execute the next code block 
    alert("You are a teenager");
} else if (age >= 18 && age <= 120) {
    // if the previously conditional is false, and
    // else if this conditional is true
    // execute the next code block 
    alert("You are an adult"); 
} else {
    alert("Invalid input. Try again...")
}

/*
    ---------------------
    Desktop test
    ---------------------
    age =   -2      =>  The user age cannot be less than 0 
    age =   4       =>  You are a child
    age =   15      =>  You are a teenager
    age =   21      =>  You are an adult
    age =   "hello" =>  Invalid input. Try again...
    ---------------------
*/