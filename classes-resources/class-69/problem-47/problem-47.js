// Author: Cristian Camilo Cortes Ortiz <Cristianco9>

// Step 1: Declare the global variables
let currentTemperature = 95;
let safeTemperature = 70;
let coolingRate = 5;
let cycleCount = 0;

// Step 2: Display the initial system status
console.log("**********************************");
console.log("  MACHINE TEMPERATURE MONITORING  ");
console.log("**********************************");
console.log(`Initial temperature: ${currentTemperature}°C`);
console.log(`Safe temperature limit: ${safeTemperature}°C`);
console.log("**********************************");

// Step 3: Cooling process
while (currentTemperature > safeTemperature) {
    cycleCount++;
    console.log(`Cooling cycle #${cycleCount}`);
    currentTemperature -= coolingRate;
    console.log("----------------------------------");
    console.log(`Current temperature: ${currentTemperature}°C`);
    console.log("----------------------------------"); 
}

// Step 4: Final system status
console.log("==================================");
console.log("Temperature is now within the safe range.");
console.log(`Final temperature: ${currentTemperature}°C`);
console.log(`Total cooling cycles: ${cycleCount}`);
console.log("==================================")

/*
Desktop Test (Short Execution Trace)

Initial Values
--------------------------------
currentTemperature = 95
safeTemperature = 70
coolingRate = 5
cycleCount = 0


Iteration 1
--------------------------------
cycleCount = 1
currentTemperature = 90

Iteration 2
--------------------------------
cycleCount = 2
currentTemperature = 85

Iteration 3
--------------------------------
cycleCount = 3
currentTemperature = 80

Iteration 4
--------------------------------
cycleCount = 4
currentTemperature = 75

Iteration 5
--------------------------------
cycleCount = 5
currentTemperature = 70


Condition Check
--------------------------------
70 > 70 → FALSE
Loop stops


Final State
--------------------------------
currentTemperature = 70
cycleCount = 5
*/