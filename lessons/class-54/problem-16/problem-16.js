// Author: Cristian Camilo Cortes Ortiz <Cristianco9>

// Request user inputs
const meal = prompt(
    "Enter the meal type (burger, pizza, salad):"
).toLowerCase(); // BURGER => burger
const delivery = prompt(
    "Do you want delivery? (yes or no):"
).toLowerCase(); // YES => yes

// Variables
let price = 0;
let deliveryFee = 0;
let totalPrice = 0;

// Validate meal type
if (meal === "burger" || meal === "pizza" || meal === "salad") {

    // Determine base price
    if (meal === "burger") {
        price = 8;
    } else if (meal === "pizza") {
        price = 10;
    } else {
        price = 7;
    }

    // Nested conditional for delivery
    if (delivery === "yes") {

        // Special promotion for pizza
        if (meal === "pizza") {
            deliveryFee = 2;
            totalPrice = price + deliveryFee;
            alert("Total price: $" + totalPrice + " USD.");
        } else {
            deliveryFee = 3;
            totalPrice = price + deliveryFee; 
            alert("Total price: $" + totalPrice + " USD.");
        }
    } else if (delivery === "no") {
        deliveryFee = 0;
        totalPrice = price + deliveryFee;  
        alert("Total price: $" + totalPrice + " USD.");
    } else {
        alert("Invalid delivery option.");
    }
} else {
    alert("Invalid meal option.");
}

/*
---------------------------------------
Desktop Test
---------------------------------------

---------------------------------------
meal = burger      delivery = no
price = 8
deliveryFee = 0
totalPrice = 8

=> Total price: $8
---------------------------------------

---------------------------------------
meal = burger      delivery = yes
price = 8
deliveryFee = 3
totalPrice = 11

=> Total price: $11
---------------------------------------

---------------------------------------
meal = pizza       delivery = yes
price = 10
deliveryFee = 2   (pizza delivery promotion)
totalPrice = 12

=> Total price: $12
---------------------------------------

---------------------------------------
meal = salad       delivery = yes
price = 7
deliveryFee = 3
totalPrice = 10

=> Total price: $10
---------------------------------------

---------------------------------------
meal = salad       delivery = no
price = 7
deliveryFee = 0
totalPrice = 7

=> Total price: $7
---------------------------------------

---------------------------------------
meal = pasta       delivery = yes

=> Invalid meal option.
---------------------------------------
*/