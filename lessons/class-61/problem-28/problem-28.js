// Author: Cristian Camilo Cortes Ortiz <Cristianco9>

// Given variables
const months = 3;
const plan = 2;

// Global variable to store the monthly cost
let monthlyCost;
// Global variable to store the total membership cost
let totalCost;

// Data type validation
if(isNaN(months)) {
    console.log("The months should be a number");
} else if(months < 1) {
    console.log("The months should be grater than 0");
} else if(isNaN(plan)) {
    console.log("The plan should be a number");
} else if (plan < 1) {
    console.log("The plan should be grater than 0");
} else {

    // Switch statement to determinate the monthly cost
    switch(plan) {

        case 1:
            // Basic plan
            monthlyCost = 25;
            break;

        case 2:
            // Standard plan
            monthlyCost = 40;
            break;

        case 3:
            // premium plan
            monthlyCost = 60;
            break;

        case 4:
            // VIP plan
            monthlyCost = 90;
            break;
        
        default:
            console.log("Invalid plan code.");
            monthlyCost = null;
    }

    // Calculate and display the total cost if the plan was valid
    if(monthlyCost !== null) {
        totalCost = monthlyCost * months;
        console.log("Total Membership cost: is $" + totalCost + " USD.");
        
    }
}

/*
---------------------------------------
Desktop Test
---------------------------------------

months = 6     plan = 1
=> monthlyCost = 25
=> 6 * 25 = 150
=> Total Membership cost: is $150 USD.

months = 6     plan = 2
=> monthlyCost = 40
=> 6 * 40 = 240
=> Total Membership cost: is $240 USD.

months = 6     plan = 3
=> monthlyCost = 60
=> 6 * 60 = 360
=> Total Membership cost: is $360 USD.

months = 6     plan = 4
=> monthlyCost = 90
=> 6 * 90 = 540
=> Total Membership cost: is $540 USD.

months = 12    plan = 2
=> monthlyCost = 40
=> 12 * 40 = 480
=> Total Membership cost: is $480 USD.

months = 3     plan = 4
=> monthlyCost = 90
=> 3 * 90 = 270
=> Total Membership cost: is $270 USD.

months = hello plan = 2
=> The months should be a number

months = 0     plan = 2
=> The months should be grater than 0

months = 6     plan = premium
=> The plan should be a number

months = 6     plan = 0
=> The plan should be grater than 0

months = 6     plan = 7
=> Invalid plan code.
=> No membership cost calculation

---------------------------------------
*/