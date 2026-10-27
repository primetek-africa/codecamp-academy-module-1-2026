/*
    Author: Cristian Camilo Cortes Ortiz <Cristianco9>
    Problem: Weekly Expense Report (With Day Names)
*/

const expenses = [45, 20, 35, 60, 15, 80, 25];

let totalSpent = 0;
let highestExpense = -Infinity;
let highestDayIndex = -1;

// Single pass loop
for (let i = 0; i < expenses.length; i++) {

    const currentExpense = expenses[i];

    totalSpent += currentExpense;

    if (currentExpense > highestExpense) {
        highestExpense = currentExpense;
        highestDayIndex = i;
    }
}

// Calculate average
const averageExpense = totalSpent / expenses.length;

// Map index to day using switch
let dayName;

switch (highestDayIndex) {
    case 0:
        dayName = "Monday";
        break;
    case 1:
        dayName = "Tuesday";
        break;
    case 2:
        dayName = "Wednesday";
        break;
    case 3:
        dayName = "Thursday";
        break;
    case 4:
        dayName = "Friday";
        break;
    case 5:
        dayName = "Saturday";
        break;
    case 6:
        dayName = "Sunday";
        break;
    default:
        dayName = "Unknown";
}

// Output
console.log(`
Total spent: ${totalSpent}
Average expense: ${averageExpense.toFixed(2)}
Highest expense on: ${dayName}
Amount: ${highestExpense}
`);