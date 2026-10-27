const alphabet = [
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 
    'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
];

console.log(`
The alphabet is: ${alphabet}
The alphabet length is: ${alphabet.length} 
The first element is: ${alphabet[0]}
The last element is: ${alphabet[alphabet.length - 1]}
`);

const length = alphabet.length; // 26
const middle = length / 2; // 13
const middleItem = alphabet[middle - 1];
console.log(`
The middle alphabet letter is: ${middleItem}
`);

console.log(`
The middle of the alphabet is: ${alphabet[(alphabet.length / 2) - 1]}
`);
