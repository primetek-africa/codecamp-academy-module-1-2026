// Author: Cristian Camilo Cortes Ortiz <Cristianco9>

const numbers = [
    12, 7.45, 98, 3.14, 56, 42.8, 19, 73.21, 5, 64.9,
    28, 91.33, 14, 8.6, 37, 60.12, 2, 77.5, 49, 11.09,
    83, 25.7, 6, 94.44, 31, 16.8, 70, 53.26, 9, 88.1
];

let evenCount = 0;
let oddCount = 0;

for(let i = 0; i < numbers.length; i++ ){
    if(numbers[i] % 2 === 0) {
        //evenCount = evenCount + 1;
        //evenCount+= 1;
        evenCount++;
    } else {
        oddCount++;
    }
}

console.log(`
Total of even numbers is: ${evenCount}
Total of odd numbers is: ${oddCount}
`);

let totalEvenN = 0;
let totalOddN = 0;

for (let i = 0; i < numbers.length; i++) {
    if(numbers[i] % 2 === 0) {
        totalEvenN += numbers[i];
    } else {
        totalOddN += numbers[i];
    }
}

console.log(`
The addition of all even numbers is: ${totalEvenN}
The addition of all odd numbers is: ${totalOddN}
`);
