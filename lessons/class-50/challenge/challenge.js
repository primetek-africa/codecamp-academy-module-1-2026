// Author: Cristian Camilo Cortes Ortiz <Cristianco9>

// Request user inputs
const age = parseInt(prompt("Enter your age:"));
const studentInput = prompt("Are you a student? (yes or no):").toLowerCase();
const day = prompt("Enter the day of the week:").toLowerCase();
const tickets = parseInt(prompt("Enter number of tickets:"));

let pricePerTicket;
let totalToPay;

// Conditionals
// Data validation
if (isNaN(age) || age < 0 || age > 120) {
    alert("Invalid user age.");
} else if (isNaN(tickets) || tickets < 1) {
    alert("Invalid tickets value.")
} else if (studentInput !== "yes" && studentInput !== "no") {
    alert("Invalid student input.");
}
// Business rules (logic)
else {
    // Nested conditionals
    // Age logic
    if (age < 12) {
        pricePerTicket = 6;
    } else if (age >= 65) {
        pricePerTicket = 7;
    } else {
        pricePerTicket = 12;
    }
    // Student discount
    if (studentInput === "yes") {
        if (age >= 12 && age <= 25) {
            pricePerTicket = pricePerTicket - 3;
        }
    }
    // Day discount
    if (day === "wednesday") {
        pricePerTicket = pricePerTicket - 2;
    }
    // Total calculation
    totalToPay = pricePerTicket * tickets;
    // Output
    alert(
        "Price per ticket: $" + pricePerTicket + " Tickets: " + tickets +
        " Total to pay: $" + totalToPay
    );
}

/*
---------------------------------------
Desktop Test
Movie Theater Ticket System
---------------------------------------

age = 10      student = no      day = monday      tickets = 2
=> Price per ticket: 6 USD. Total to pay: 12 USD.

age = 20      student = yes     day = monday      tickets = 3
=> Price per ticket: 9 USD. Total to pay: 27 USD.

age = 20      student = yes     day = wednesday   tickets = 3
=> Price per ticket: 7 USD. Total to pay: 21 USD.

age = 70      student = no      day = monday      tickets = 2
=> Price per ticket: 7 USD. Total to pay: 14 USD.

age = 70      student = no      day = wednesday   tickets = 2
=> Price per ticket: 5 USD. Total to pay: 10 USD.

age = 15      student = yes     day = wednesday   tickets = 1
=> Price per ticket: 7 USD. Total to pay: 7 USD.

age = 25      student = yes     day = friday      tickets = 4
=> Price per ticket: 9 USD. Total to pay: 36 USD.

age = -3      student = yes     day = monday      tickets = 2
=> Invalid input.

age = 130     student = no      day = monday      tickets = 1
=> Invalid input.

age = 20      student = maybe   day = monday      tickets = 2
=> Invalid student input.

age = 30      student = no      day = monday      tickets = 0
=> Invalid input.

age = 40      student = yes     day = monday      tickets = -5
=> Invalid input.

age = 22      student = yes     day = wednesday   tickets = "hello"
=> Invalid input.

---------------------------------------
*/