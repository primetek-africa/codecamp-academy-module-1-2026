// Author: Cristian Camilo Cortes Ortiz <Cristianco9>

const numbers = [
    12, 7.45, 98, 3.14, 56, 42.8, 19, 73.21, 5, 64.9,
    28, 91.33, 14, 8.6, 37, 60.12, 2, 77.5, 49, 11.09,
    83, 25.7, 6, 94.44, 31, 16.8, 70, 53.26, 9, 88.1
];

let greaterNumber = 0;
let index = 0;

for (let i = 0; i < numbers.length; i++) {
    if(numbers[i] > greaterNumber) {
        greaterNumber = numbers[i];
        index = i;
    }
}

console.log(`
The greater number in the array is: ${greaterNumber}
Founded in the position: ${index}    
`);
