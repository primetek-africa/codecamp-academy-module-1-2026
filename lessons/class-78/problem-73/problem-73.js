/*
    Author: Cristian Camilo Cortes Ortiz <Cristianco9>
    Problem: Loan Monthly Payment Calculator
*/

function calculateMonthlyPayment(principal, annualRate, years) {

    const monthlyRate = annualRate / 12;
    const numberOfPayments = years * 12;

    const numerator = 
        monthlyRate * Math.pow(1 + monthlyRate, numberOfPayments);

    const denominator = 
        Math.pow(1 + monthlyRate, numberOfPayments) - 1;

    const monthlyPayment = principal * ( numerator / denominator);

    return monthlyPayment;
}

// Test
const test1 = calculateMonthlyPayment(10000, 0.12, 1);
console.log(`
********************************
Monthly Payment: ${test1.toFixed(2)}
********************************
`);
