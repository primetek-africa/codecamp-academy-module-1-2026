// Author: Cristian Camilo Cortes Ortiz <Cristianco9>

// Step 1: Declare the global variables
let currentStock = 25;
let minimumStock = 100;
let restockAmount = 10;
let restockCount = 0;

// Step 2: Display the initial inventory
console.log("====================================");
console.log(`Initial inventory: ${currentStock}`);
console.log(`Minimum required Inventory: ${minimumStock}`);
console.log("====================================");

// Step 3: Restocking process
while (currentStock < minimumStock) {
    restockCount += 1;
    currentStock += restockAmount;
    console.log(`Restock number: ${restockCount}`);
    console.log(`Current Inventory: ${currentStock}`);
    console.log("++++++++++++++++++++++++++++++++++++");    
}

// Step 4: Final results
console.log("====================================");
console.log("Restocking completed.");
console.log(`Final inventory: ${currentStock}`);
console.log(`Total restocks performed: ${restockCount}`);
console.log("====================================");

/*
Desktop Test (Step-by-step execution trace)

Initial values
------------------------------------
currentStock = 25
minimumStock = 100
restockAmount = 10
restockCount = 0

Condition to evaluate in the loop:
currentStock < minimumStock
25 < 100 → TRUE (enter the loop)

Iteration 1
------------------------------------
restockCount += 1  → restockCount = 1
currentStock += 10 → currentStock = 35

Output:
Restock #1
Current Inventory: 35

Check condition again:
35 < 100 → TRUE

Iteration 8
------------------------------------
restockCount = 8
currentStock = 105

Output:
Restock #8
Current Inventory: 105

Check condition:
105 < 100 → FALSE
Loop stops

Final State
------------------------------------
currentStock = 105
restockCount = 8

Final Output:
Restocking completed.
Final inventory: 105
Total restocks performed: 8
*/