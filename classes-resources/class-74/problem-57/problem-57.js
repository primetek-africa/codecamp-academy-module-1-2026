/*
    Author: Cristian Camilo Cortes Ortiz <Cristianco9>
    Problem: Temperature Grid
*/

const temperatures = [
    [22, 25, 24],
    [30, 28, 27],
    [19, 21, 20]
];

// Asume the first value is the lowest initially
let lowestTemperature = temperatures[0][0];


for (let i = 0; i < temperatures.length; i++) {

    for (let j = 0; j < temperatures[i].length; j++) {

        if(temperatures[i][j] < lowestTemperature) {
            lowestTemperature = temperatures[i][j]
        }
    }   
}

console.log(`Lowest temperature: ${lowestTemperature}`);