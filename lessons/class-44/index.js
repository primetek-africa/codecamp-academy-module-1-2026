/*
    Discrete mathematics
        - Propositional logic
        - Inference rules
*/
var a = 30;
var b = a; // 30
var c = b; // 30
// c -> b -> a
// The questions is
// c == a ??
// look Alexandra this is a comment line
// instate of a logic line, just a message
console.log("Value of the variable 'a': " + a); // 30
console.log("Value of the variable 'b': " + b); // 30
console.log("Value of the variable 'c': " + c); // 30

console.log("c == a :"); // 30 == 30
console.log(c == a); // true
a = "new value";
console.log("Value of the variable 'a': " + a); // "new value"
console.log("c == a :"); // "new value" == 30
console.log(c == a); // false
console.log("b == c :"); // 30 == 30
console.log(b == c); // true

// what is the 'c' variable value ?
console.log("Value of the variable 'a': " + a); // "new value"
console.log("Value of the variable 'b': " + b); // 30
console.log("Value of the variable 'c': " + c); // 30
/* ========================================================================== */
console.log("====================================================");

// What's the difference between '==' and '==='

// same value, same data type
console.log("value comparison");
// [number] 5 == [number] 5
console.log("5 == 5 :");
console.log(5 == 5);  // true
console.log("value and data type comparison");
// [number] 5 === [number] 5
console.log("5 === 5 :");
console.log(5 === 5); // true

// same value, but different data type
console.log("value comparison");
// [number] 5 == [string] '5'
console.log("5 == '5' :");
console.log(5 == '5'); // true
console.log("value and data type comparison");
// [number] 5 === [string] '5'
console.log("5 === '5' :"); 
console.log(5 === '5'); // false

// Why?
/* 
    because
        ==  : compare value
        === : compare value and data type
*/

/* 
    --------------------------------
    |       Boolean theory         |
    --------------------------------
    |    LOGIC GATES :   STATE     |
    --------------------------------
    |       1        :   true      |
    |       0        :   false     |
    --------------------------------
*/
console.log("value comparison");
// [number] 1 == [boolean] true
console.log(" 1 == true :");
console.log(1 == true); // true
console.log("value and data type comparison");
// [number] 1 === [boolean] true
console.log("1 === true :");
console.log(1 === true); // false

/* 
    why is false?
    1 = numeric and true = boolean
    numeric === boolean => false
*/

// Another example
// Classic Junior developers interview question

console.log("value comparison");
// [object] null == [undefined] undefined
console.log("null == undefine :");
console.log(null == undefined); // true
console.log("value and data type comparison");
// [object] null === [undefined] undefined
console.log("null === undefined :");
console.log(null === undefined); // true

/* 
    why is false?
    null = object and undefined = undefined primitive data type
    null === undefined => false
*/

let example; // undefined [primitive data type] (automatic)
let test = null; // null [object] (manual)

console.log("value comparison");
// [string] "" == [numeric] 0
console.log('"" == 0 :');
console.log("" == 0); // true
console.log("value and data type comparison");
// [string] "" === [numeric] 0
console.log('"" === 0 :');
console.log("" === 0); // false

/* 
    why is false?
    "" = string and 0 = numeric
    string === numeric => false
*/

console.log("====================================================");
var t = "";
var u = 0;
console.log('"" == 0 :');
console.log(t == u); //true
console.log('"" === 0 :');
console.log(t === u); //true
console.log("====================================================");
