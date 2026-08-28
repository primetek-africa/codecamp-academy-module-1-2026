// Author: Cristian Camilo Cortes Ortiz <Cristianco9>

// Request user inputs
const passengerType = prompt(
    "Enter passenger type (adult or child):"
).toLowerCase();
const travelClass = prompt(
    "Enter the travel class (economy or business):"
).toLowerCase();
const luggageWeight = parseFloat(
    prompt("Enter luggage weight in kilograms:")
);

// Global variables
let freeAllowance;
let pricePerKg;
let extraWeight;
let fee;

// Conditionals
// Data validation
if (passengerType !== "adult" && passengerType !== "child") {
    alert("Invalid passenger Type.");
} else if (travelClass !== "economy" && travelClass !== "business") {
    alert("Invalid travel class.");
} else if (isNaN(luggageWeight)) {
    alert("Invalid luggage weight.")
} else if (luggageWeight <= 0) {
    alert("Luggage must be greater than 0.")
} else if (luggageWeight > 60) {
    alert("Luggage must be less than 60.")
}
// Business rules (logic)
else {
    if (travelClass === "economy") {
        freeAllowance = 20;
        pricePerKg = 10;
    } else {
        freeAllowance = 30;
        pricePerKg = 8;
    }

    // Weight calculation
    if (luggageWeight <= freeAllowance) {
        alert("No luggage fee.");
    } else {
        extraWeight = luggageWeight - freeAllowance;
        fee = extraWeight * pricePerKg;
        // Child discount
        if (passengerType === 'child') {
            fee = fee * 0.5;
        }
        alert(
            "Extra weight: " + extraWeight + "Kg - total fee: $" + fee + " USD."
        );
    }
}

/*
---------------------------------------
Desktop Test
Airport Luggage Fee Calculator
---------------------------------------

passengerType = adult      travelClass = economy      luggageWeight = 15
=> No luggage fee.

passengerType = adult      travelClass = economy      luggageWeight = 25
=> Extra weight: 5Kg - total fee: $50 USD.

passengerType = adult      travelClass = business     luggageWeight = 28
=> No luggage fee.

passengerType = adult      travelClass = business     luggageWeight = 40
=> Extra weight: 10Kg - total fee: $80 USD.

passengerType = child      travelClass = economy      luggageWeight = 25
=> Extra weight: 5Kg - total fee: $25 USD.

passengerType = child      travelClass = business     luggageWeight = 40
=> Extra weight: 10Kg - total fee: $40 USD.

passengerType = baby       travelClass = economy      luggageWeight = 20
=> Invalid passenger Type.

passengerType = adult      travelClass = first        luggageWeight = 20
=> Invalid travel class.

passengerType = adult      travelClass = economy      luggageWeight = -5
=> Luggage must be greater than 0.

passengerType = adult      travelClass = business     luggageWeight = 0
=> Luggage must be greater than 0.

passengerType = adult      travelClass = economy      luggageWeight = 80
=> Luggage must be less than 60.

passengerType = adult      travelClass = economy      luggageWeight = "hello"
=> Invalid luggage weight.

*/