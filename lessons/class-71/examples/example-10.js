// Author: Cristian Camilo Cortes Ortiz <Cristianco9>

const numbers = [
    34, 12.5, 67, 8, 45.3, 22, 91, 13.7, 56, 4,
    78.9, 31, 19, 62.4, 7, 88, 15.2, 40, 27, 53
];

console.log(`Total elements in the array is: ${numbers.length}`);

// what is the smallest number??
let smallest = numbers[0];
let index = 0;

for(let i = 0; i < numbers.length; i++) {
    if(numbers[i] < smallest) {
        smallest = numbers[i];
        index = i;
    }
}

console.log(`
The smallest number is: ${smallest}
Founded in the index position: ${index}
`);
