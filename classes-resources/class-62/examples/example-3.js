// Calculate the sum of even numbers from 1 - 30
let sumEven = 0;
for (let i = 1; i <= 30; i++) {
    if(i % 2 === 0) {
        sumEven = sumEven + i;
    }
}

console.log("Sum of even numbers: ", sumEven);
