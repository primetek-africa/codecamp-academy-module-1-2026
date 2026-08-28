/*
    Author: Cristian Camilo Cortes Ortiz <Cristianco9>
    Problem: Inventory warehouse
*/

const warehouse = [
    [12, 5, 8, 10],
    [7, 14, 3, 6],
    [9, 11, 2, 4],
    [6, 8, 13, 7]
];

// 1. Total inventory
let totalInventory = 0;

for (let i = 0; i < warehouse.length; i++) {

    for (let j = 0; j < warehouse[i].length; j++) {
        totalInventory += warehouse[i][j];
    }
}

console.log("\n****************************************");
console.log(`Total inventory: ${totalInventory}`);
console.log("****************************************");

// 2. Section Inventory
for (let i = 0; i < warehouse.length; i++) {

    let sectionTotal = 0;

    for (let j = 0; j < warehouse[i].length; j++) {
        sectionTotal += warehouse[i][j];
    }

    console.log("\n****************************************"); 
    console.log(`Section ${i}: ${sectionTotal} items.`);
    console.log("****************************************"); 
}

// 3. Find the shelf with the highest quantity
let maxQuantity = warehouse[0][0];

for (let i = 0; i < warehouse.length; i++) {

    for (let j = 0; j < warehouse[i].length; j++) {
        
        if (warehouse[i][j] > maxQuantity) {
            maxQuantity = warehouse[i][j];
        }
    }
}

console.log("\n****************************************"); 
console.log(`Highest quantity on a shelf: ${maxQuantity}`);
console.log("****************************************"); 

// 4. Count low stock shelves (less than 5)
let lowStockCount = 0;

for (let i = 0; i < warehouse.length; i++) {

    for (let j = 0; j < warehouse[i].length; j++) {

        if (warehouse[i][j] < 5){
            lowStockCount++;
        }
    }
}

console.log("\n****************************************"); 
console.log(`Low stock shelves ${lowStockCount}`);
console.log("****************************************"); 

// 5. Locate shelf containing 13 items
let found = false;

for (let i = 0; i < warehouse.length; i++) {

    for (let j = 0; j < warehouse[i].length; j++) {

        if(warehouse[i][j] === 13) {
            console.log("\n****************************************"); 
            console.log(`
            Item quantity 13 found at:
            Section: ${i}
            Shelf: ${j}
            `);
            console.log("****************************************"); 
            found = true;
            break;
        }
    }

    if(found) {
        break;
    }
}
