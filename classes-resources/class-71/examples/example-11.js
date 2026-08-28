// Author: Cristian Camilo Cortes Ortiz <Cristianco9>

const numbers = [12, 45, 7, 23, 56, 19, 31, 8, 62, 14];

console.log(`Total elements in the array is: ${numbers.length}`);

/*
Problem: Calculate the average of numbers greater than 20
*/

let sum = 0;
let count = 0;
let average = 0;

for(let i = 0; i < numbers.length; i++) {

    if(numbers[i] > 20) {
        console.log(numbers[i]);
        sum += numbers[i];
        count++;
    }
}

average = sum / count;

console.log(`
Sum:        ${sum}
frequency:  ${count}
Average is: ${average}
`);
