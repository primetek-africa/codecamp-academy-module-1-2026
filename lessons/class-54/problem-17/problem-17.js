// Author: Cristian Camilo Cortes Ortiz <Cristianco9>

// Request user inputs
const membership = prompt(
    "Enter membership type (basic or premium):"
).toLowerCase();
const trainer = prompt(
    "Do you want a personal trainer (yes or no):"
).toLowerCase();

// Variables
let price = 0;
let trainerFee = 0;

// Validate membership type
if (membership === "basic" || membership === "premium ") {

    // Determine base membership price
    if (membership === "basic") {
        price = 20;
    } else {
        price = 30;
    }

    // Nested conditional for personal trainer
    if (trainer === "yes") {
        if (membership === "basic") {
            trainerFee = 10;
        } else {
            // premium includes free trainer
            trainerFee = 0;
        }
    } else if ( trainer === "no") {
        trainerFee = 0;
    } else {
        alert("Invalid trainer option.");
    }

    // Calculate total cost
    const totalCost = price + trainerFee;
    alert("Total membership cost is: $" + totalCost + "USD.");
} else {
    alert("Invalid membership type.");
}

/*
---------------------------------------
Desktop Test
---------------------------------------

membership = basic      trainer = no
price = 20
trainerFee = 0
totalCost = 20

=> Total membership cost: $20
---------------------------------------

---------------------------------------
membership = basic      trainer = yes
price = 20
trainerFee = 10
totalCost = 30

=> Total membership cost: $30
---------------------------------------

---------------------------------------
membership = premium    trainer = no
price = 30
trainerFee = 0
totalCost = 30

=> Total membership cost: $30
---------------------------------------

---------------------------------------
membership = premium    trainer = yes
price = 30
trainerFee = 0   (trainer included for premium)
totalCost = 30

=> Total membership cost: $30
---------------------------------------

---------------------------------------
membership = gold       trainer = yes

=> Invalid membership type.
---------------------------------------

---------------------------------------
membership = basic      trainer = maybe

=> Invalid trainer option.
---------------------------------------
*/