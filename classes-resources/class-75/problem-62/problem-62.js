/*
    Author: Cristian Camilo Cortes Ortiz <Cristianco9>
    Problem: Diagonal Sum of a Matrix
*/

const matrix = [
    [5, 2, 3],
    [1, 4, 6],
    [7, 8, 9]
];

let diagonalSum = 0;

for (let i = 0; i < matrix.length; i++) {
    diagonalSum += matrix[i][i];
}

console.log(`Diagonal sum: ${diagonalSum}`);
