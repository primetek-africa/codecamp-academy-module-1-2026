// Author: Cristian Camilo Cortes Ortiz <Cristianco9>

// Display the menu
alert(
    `CALCULATOR MENU:
    1. Addition
    2. Subtraction
    3. Multiplication
    4. Division
    `
);

// Request the inputs
const num1 = parseFloat(prompt("Enter the first number: "));
const num2 = parseFloat(prompt("Enter the second number: "));
const option = parseInt(prompt("Enter a option (1-4): "));

// Result global variable
let result = 0;

// Data type validation
if(isNaN(num1)) {
    alert("The number 1 should be a number");
} else if (isNaN(num2)) {
    alert("The number 2 should be a number");
} else if(isNaN(option)) {
    alert("The option should be a number");
} else {

    switch(option) {

        case 1:
            result = num1 + num2;
            break;

        case 2:
            result = num1 - num2;
            break;

        case 3:
            result = num1 * num2;
            break;
        
        case 4:
            
            if(num2 === 0) {
                alert("The number 2 must be different to 0");
                result = null;
                break;
            } else {
                result = num1 / num2;
                break;
            }

        default:
            alert("The option should be between 1-4");
    }

    alert("The result is: " + result);
}

/*
---------------------------------------
Desktop Test
---------------------------------------

num1 = 10     num2 = 5     option = 1
=> The result is: 15

num1 = 10     num2 = 5     option = 2
=> The result is: 5

num1 = 10     num2 = 5     option = 3
=> The result is: 50

num1 = 10     num2 = 5     option = 4
=> The result is: 2

num1 = 8      num2 = 2     option = 4
=> The result is: 4

num1 = 8      num2 = 0     option = 4
=> The number 2 must be different to 0
=> The result is: null

num1 = hello  num2 = 5     option = 1
=> The number 1 should be a number

num1 = 10     num2 = world option = 1
=> The number 2 should be a number

num1 = 10     num2 = 5     option = four
=> The option should be a number

num1 = 10     num2 = 5     option = 7
=> The option should be between 1-4
=> The result is: 0

---------------------------------------
*/