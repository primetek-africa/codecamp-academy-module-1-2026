/*
    Author: Cristian Camilo Cortes Ortiz <Cristianco9>
    Problem: Classroom Scores Grid
*/

const scores = [
    [80, 75, 90],
    [60, 85, 70],
    [95, 88, 92]
];

for ( let i = 0; i < scores.length; i++) {
    let sum = 0;

    for (let j = 0; j < scores.length; j++) {
        sum += scores[i][j];
    }

    const average = sum / scores[i].length;

    console.log(`Student ${i + 1} - average: ${average.toFixed(2)}`);
}