/*
    Author: Cristian Camilo Cortes Ortiz <Cristianco9>
    Problem: Highest Scoring Student
*/

const scores = [
    [80, 75, 90],
    [60, 85, 70],
    [95, 88, 92]
];

let topStudent = -1;
let highestAverage = -Infinity;

for (let i = 0; i < scores.length; i++) {

    let sum = 0;
    const studentScore = scores[i];

    for (let j = 0; j < scores[i].length; j++) {

        sum += studentScore[j];
    }

    const average = sum / scores[i].length;
    
    if (average > highestAverage) {
        highestAverage = average;
        topStudent = i;
    }
}

console.log(`
The student: ${topStudent}
Highest average: ${highestAverage.toFixed(2)}
`);
