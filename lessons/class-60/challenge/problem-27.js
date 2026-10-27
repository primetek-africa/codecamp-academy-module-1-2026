// Author: Cristian Camilo Cortes Ortiz <Cristianco9>

// Given variables
const kwhUsed = 350;
const customerType = 2;

// Global variable to store the price per kwh
let pricePerKwh;

// Global variable to store the total bill
let totalBill;

// Switch statement to determine the price per kwh
switch (customerType) {

    case 1:
        // Residential
        pricePerKwh = 0.12;
        break;
    
    case 2:
        // Commercial
        pricePerKwh = 0.20;
        break;
    
    case 3:
        // Industrial
        pricePerKwh = 0.35;
        break;
    
    default:
        console.log("Invalid customer type code.");
        pricePerKwh = null;

}

// Calculate and display the total bill if the code was valid
if (pricePerKwh !== null) {
    totalBill = kwhUsed * pricePerKwh;
    console.log("Total KWh consumed: ", kwhUsed);
    console.log("Price per KWh is: $", pricePerKwh, " USD.");
    console.log("Total bill is: $", totalBill, " USD.");
}

/*
---------------------------------------
Desktop Test
---------------------------------------

kwhUsed = 350    customerType = 1
=> price = 0.12
=> 350 * 0.12
=> Total Bill: $42

kwhUsed = 350    customerType = 2
=> price = 0.20
=> 350 * 0.20
=> Total Bill: $70

kwhUsed = 350    customerType = 3
=> price = 0.35
=> 350 * 0.35
=> Total Bill: $122.5

kwhUsed = 100    customerType = 1
=> price = 0.12
=> 100 * 0.12
=> Total Bill: $12

kwhUsed = 500    customerType = 2
=> price = 0.20
=> 500 * 0.20
=> Total Bill: $100

kwhUsed = 800    customerType = 3
=> price = 0.35
=> 800 * 0.35
=> Total Bill: $280

kwhUsed = 350    customerType = 7
=> Invalid customer type code.
=> No bill calculation

---------------------------------------
*/