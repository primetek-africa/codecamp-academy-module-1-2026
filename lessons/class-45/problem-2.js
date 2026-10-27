// Author: Cristianco9 <GitHub>

// storage the exam score in a variable
var s = prompt("Enter your exam score: ");

// Conditionals
if (s < 0) {
    // if the conditional is true
    // execute this code
    alert("Invalid negative score. Try again....");
} else if (s >= 0 && s < 60) {
    // if the conditional is false,
    // else if, analice other conditional
    // execute this code
    alert("You failed the exam.");
} else if (s >= 60 && s <= 100) {
    // if the conditional is false,
    // else if, analice other conditional
    // execute this code
    alert("You passed the exam.");
} else {
    // default false clausula
    alert("Invalid score. Can't be greater than 100");
}

/*
    ---------------------
    Desktop test
    ---------------------
    s = -20   =>  Invalid negative score. Try again....
    s = 0     =>  You failed the exam.
    s = 59    =>  You failed the exam.
    s = 60    =>  You passed the exam.
    s = 100   =>  You passed the exam.
    s = 120   =>  Invalid score. Can't be greater than 100
    ---------------------
*/