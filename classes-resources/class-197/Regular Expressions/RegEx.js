// 1
let text = "Panom this is the 1 example: 2";

let result = text.match(/\d/g);
console.log(result);

console.log("------------------------------------");

// 2 
let username = /^\w{4,12}$/;
console.log(username.test("student_1"));
console.log(username.test("abc"));
console.log(username.test("student-1"));
console.log(username.test("student1234567890"));

console.log("------------------------------------");

//3
let nickname = /^[a-zA-Z0-9_]{5,10}$/;
console.log(nickname.test("student_1"));
console.log(nickname.test("STUDent1"));
console.log(nickname.test("STUDENT_1"));
console.log(nickname.test("student-1"));
console.log(nickname.test("student@1"));

console.log("------------------------------------");

//4

text = 'There are 25 students, 3 teachers, and 2 classrooms.';
result = text.match(/\b\d{1,}\b/g);
console.log(result);

console.log("------------------------------------");

//5
text = 'regular expressions are useful';
result = text.replace(/\s+/g, "-");
console.log(result);
