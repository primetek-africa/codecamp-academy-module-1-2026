/*
    Author: Cristian Camilo Cortes Ortiz <Cristianco9>
    Problem: Cinema Seating Grid
*/

const seats = [
    [1, 0, 1, 0],
    [0, 0, 1, 1],
    [1, 0, 0, 0]
];

// 1. Count occupied seats
let occupied  = 0;
let available = 0;

for (let i = 0; i < seats.length; i++) {

    for (let j = 0; j < seats[i].length; j++) {

        if(seats[i][j] === 1) {
            occupied++;
        } else {
            available++;
        }
    }
}

console.log("\n*****************************************");
console.log(`Occupied seats: ${occupied}`);
console.log(`Available seats: ${available}`);
console.log("*****************************************");

// 2. Row with the most occupied seats
let maxRow = -1;
let maxOccupied = 0;

for (let i = 0; i < seats.length; i++) {

    let rowCount = 0;

    for (let j = 0; j < seats[i].length; j++) {

        if(seats[i][j] === 1) {
            rowCount++;
        }
    }

    if (rowCount > maxOccupied) {
        maxOccupied = rowCount;
        maxRow = i;
    }
}

console.log("\n*****************************************");
console.log(`Row with most occupied seats: ${maxRow}`);
console.log(`Occupied seats in the row: ${maxOccupied}`);
console.log("*****************************************");
