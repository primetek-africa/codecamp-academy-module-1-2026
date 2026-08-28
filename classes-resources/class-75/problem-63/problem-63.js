/*
    Author: Cristian Camilo Cortes Ortiz <Cristianco9>
    Problem: Column with the Highest Sum
*/

const data = [
    [5, 10, 15],
    [20, 5, 10],
    [10, 20, 5]
];

let highestSum = -Infinity;
let bestColumnIndex = -1;

// Number of columns
const numCols = data[0].length;

for (i = 0; i < numCols; i++) {

    let columnSum = 0;

    for (j = 0; j < data.length; j++) {
        columnSum += data[j][i];
    }

    if (columnSum > highestSum) {
        highestSum = columnSum;
        bestColumnIndex = i;
    }
}

console.log(`Column with highest sum: ${bestColumnIndex}`);
console.log(`highest sum: ${highestSum}`);

