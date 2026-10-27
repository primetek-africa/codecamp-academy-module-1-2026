/*
    Author: Cristian Camilo Cortes Ortiz
    Solution: Warehouse Inventory Manager
*/

// Initial inventory
let inventory = ["Laptop", "Mouse", "Keyboard", "Monitor", "USB Cable"];

// 1. Print the total number of products in the inventory
console.log("\n***********************************************");
console.log(`Total products in inventory: ${inventory.length}`);
console.log("***********************************************");

// 2. Add two new products to the inventory
inventory.push("Webcam");
inventory.push("Headphones");

console.log("\n***********************************************");
console.log(`Inventory after adding new products: ${inventory}`);
console.log("***********************************************");

// 3. Remove the last product from the inventory
let removedLastProduct = inventory.pop();
console.log("\n***********************************************");
console.log(`Removed last product: ${removedLastProduct}`);
console.log("***********************************************");

// 4. Remove the first product from the inventory
// Method shift() => remove an item in the first position of the list
// Function don't receive any parameter such as element
let removedFirstProduct = inventory.shift();
console.log("\n***********************************************");
console.log(`Removed first product: ${removedFirstProduct}`);
console.log("***********************************************");

// 5. Add a new product to the beginning of the inventory
// Method unshift() => add a new item in the first position of the list
// Function that receive as parameter the new element
inventory.unshift("Tablet");

console.log("\n***********************************************");
console.log(`Inventory after updates: ${inventory}`);
console.log("***********************************************");

// 6. Print the second product in the inventory
console.log("\n***********************************************");
console.log(`Second product in inventory: ${inventory[1]}`);
console.log("***********************************************");

// 7. Check if the inventory has more than 5 products
if (inventory.length > 5) {
    console.log("\n***********************************************");
    console.log("Warehouse is well stocked");
    console.log("***********************************************");
} else {
    console.log("\n***********************************************");
    console.log("Warehouse needs more products");
    console.log("***********************************************");
}

// 8. Print all products with their position number
console.log("Current Inventory List: ");

for (let i = 0; i < inventory.length; i++) {
    console.log("+++++++++++++++++++++++++++++++++++++++++++++++");
    console.log(`${i + 1} - ${inventory[i]}`);
    console.log("+++++++++++++++++++++++++++++++++++++++++++++++");
}

