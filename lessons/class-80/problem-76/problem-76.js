/*
    Author: Cristian Camilo Cortes Ortiz <Cristianco9>
    Problem: Order Processing
*/

const orders = [
    { id: 1, customer: "Alice", total: 120, status: "completed" },
    { id: 2, customer: "Bob", total: 80, status: "pending" },
    { id: 3, customer: "Charlie", total: 200, status: "completed" },
    { id: 4, customer: "Diana", total: 50, status: "pending" },
    { id: 5, customer: "Eve", total: 300, status: "completed" }
];

// Step 1: Filter completed orders
const completedOrders = orders.filter(
    order => order.status === "completed"
);

// Step 2: Extract totals
const totals = completedOrders.map(
    order => order.total
);

// Step 3: Calculate total sum
const totalRevenue = totals.reduce(
    (sum, value) => sum + value, 0
);

// Step 4: Simplify Structure
const simplifiedOrders = completedOrders.map(
    order => ({id: order.id, customer: order.customer})
);

// Output
console.log("*********************************");
console.log("Completed Orders:");
console.log(completedOrders);
console.log("*********************************");
console.log("Totals:");
console.log(totals);
console.log("*********************************");
console.log("Total Revenue:");
console.log(totalRevenue);
console.log("*********************************");
console.log("Simplified Orders:");
console.log(simplifiedOrders);
console.log("*********************************");





