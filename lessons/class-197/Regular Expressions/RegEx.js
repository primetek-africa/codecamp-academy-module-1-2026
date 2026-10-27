/**
 * @file RegEx.js
 * @description Regular Expressions module containing solutions to practical 
 * exercises and additional patterns from the course.
 */

// ==========================================
// PART 1: SOLUTIONS TO THE LESSON EXERCISES
// ==========================================

/**
 * Exercise 1: Determines whether a string contains at least one digit[cite: 1].
 */
export function checkHasDigit(str) {
    const pattern = /\d/;
    return pattern.test(str);
}

/**
 * Exercise 2: Validates a four-digit year string[cite: 1].
 */
export function validateFourDigitYear(str) {
    const pattern = /^\d{4}$/;
    return pattern.test(str);
}

/**
 * Exercise 3: Validates a username (5-10 chars, letters/digits/underscores only)[cite: 1].
 */
export function validateUsername(str) {
    const pattern = /^[A-Za-z0-9_]{5,10}$/;
    return pattern.test(str);
}

/**
 * Exercise 4 & 9: Extracts all numbers/academic years from a sentence[cite: 1].
 */
export function extractNumbers(str) {
    const pattern = /\d+/g;
    return str.match(pattern) || [];
}

/**
 * Exercise 5: Replaces all spaces in a string with hyphens[cite: 1].
 */
export function replaceSpacesWithHyphens(str) {
    const pattern = /\s+/g;
    return str.replace(pattern, "-");
}

/**
 * Exercise 6: Validates an identification number consisting of exactly eight digits[cite: 1].
 */
export function validateId8Digits(str) {
    const pattern = /^\d{8}$/;
    return pattern.test(str);
}

/**
 * Exercise 7: Searches for the exact word "student" using word boundaries[cite: 1].
 */
export function searchStudentWord(str) {
    const pattern = /\bstudent\b/;
    return pattern.test(str);
}

/**
 * Exercise 8: Validates a simplified email format[cite: 1].
 */
export function validateBasicEmail(str) {
    const pattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return pattern.test(str);
}

/**
 * Exercise 10: Combines multiple student data validations[cite: 1].
 */
export function validateStudentData(id, username, email) {
    const idPattern = /^\d{10}$/;
    const userPattern = /^[A-Za-z0-9_]{4,12}$/;
    const mailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return idPattern.test(id) && userPattern.test(username) && mailPattern.test(email);
}


// ==========================================
// PART 2: 10 ADDITIONAL REGEX EXAMPLES
// ==========================================

/**
 * 1. Hexadecimal Color Code Validation
 */
export function validateHexColor(str) {
    const pattern = /^#[0-9A-Fa-f]{3}([0-9A-Fa-f]{3})?$/;
    return pattern.test(str);
}

/**
 * 2. Matching IPv4 Addresses (Structural check)
 */
export function validateIPv4(str) {
    const pattern = /^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/;
    return pattern.test(str);
}

/**
 * 3. US Phone Number Format
 */
export function validateUSPhoneNumber(str) {
    const pattern = /^(\(\d{3}\)|\d{3})[-.\s]?\d{3}[-.\s]?\d{4}$/;
    return pattern.test(str);
}

/**
 * 4. Simple URL / Web Link Detection
 */
export function validateURL(str) {
    const pattern = /^https?:\/\/[^\s]+$/;
    return pattern.test(str);
}

/**
 * 5. Password Strength Validation (Min 8 chars, upper, lower, digit, special char)
 */
export function validateStrongPassword(str) {
    const pattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$/;
    return pattern.test(str);
}

/**
 * 6. Extract HTML Tag Content
 */
export function extractTagContent(htmlStr) {
    const match = htmlStr.match(/>([^<]+)</);
    return match ? match[1] : null;
}

/**
 * 7. Date Format Validation (YYYY-MM-DD structural layout)
 */
export function validateISODate(str) {
    const pattern = /^\d{4}-(?:0[1-9]|1[0-2])-(?:0[1-9]|[12]\d|3[01])$/;
    return pattern.test(str);
}

/**
 * 8. Clean Extra Whitespace
 */
export function cleanWhitespace(str) {
    const pattern = /\s+/g;
    return str.replace(pattern, " ").trim();
}

/**
 * 9. File Extension Validation (Images: jpg, jpeg, png, gif)
 */
export function validateImageExtension(str) {
    const pattern = /\.(jpg|jpeg|png|gif)$/i;
    return pattern.test(str);
}

/**
 * 10. Extract Hashtags from Social Media Text
 */
export function extractHashtags(str) {
    const pattern = /#[\w]+/g;
    return str.match(pattern) || [];
}

console.log("=== TESTING LESSON EXERCISES ===");

// Exercise 1: Find a Digit[cite: 1]
console.log("Ex 1 (Find Digit):");
console.log("  'Hello' ->", checkHasDigit("Hello"));       // expected: false[cite: 1]
console.log("  'Hello123' ->", checkHasDigit("Hello123"));  // expected: true[cite: 1]
console.log("  '2026' ->", checkHasDigit("2026"));          // expected: true[cite: 1]

// Exercise 2: Validate a Four-Digit Year[cite: 1]
console.log("\nEx 2 (Four-Digit Year):");
console.log("  '1998' ->", validateFourDigitYear("1998"));      // expected: true[cite: 1]
console.log("  '12345' ->", validateFourDigitYear("12345"));    // expected: false[cite: 1]
console.log("  'Year 1998' ->", validateFourDigitYear("Year 1998")); // expected: false[cite: 1]

// Exercise 3: Validate a Username[cite: 1]
console.log("\nEx 3 (Username Validation):");
console.log("  'student1' ->", validateUsername("student1"));     // expected: true[cite: 1]
console.log("  'abc' ->", validateUsername("abc"));               // expected: false[cite: 1]
console.log("  'my user' ->", validateUsername("my user"));         // expected: false[cite: 1]

// Exercise 4 & 9: Find All Numbers / Academic Years[cite: 1]
console.log("\nEx 4 & 9 (Extract Numbers):");
console.log("  Result ->", extractNumbers("There are 25 students, 3 teachers, and 2 classrooms.")); 
// expected: ["25", "3", "2"][cite: 1]

// Exercise 5: Replace Spaces with Hyphens[cite: 1]
console.log("\nEx 5 (Replace Spaces):");
console.log("  Result ->", `"${replaceSpacesWithHyphens("regular expressions are useful")}"`); 
// expected: "regular-expressions-are-useful"[cite: 1]

// Exercise 6: Validate an Identification Number (8 digits)[cite: 1]
console.log("\nEx 6 (ID 8 Digits):");
console.log("  '12345678' ->", validateId8Digits("12345678")); // expected: true[cite: 1]
console.log("  '1234567' ->", validateId8Digits("1234567"));   // expected: false[cite: 1]

// Exercise 7: Search for a Word with Boundaries[cite: 1]
console.log("\nEx 7 (Word Boundary Search):");
console.log("  'The student is here.' ->", searchStudentWord("The student is here."));       // expected: true[cite: 1]
console.log("  'The students are here.' ->", searchStudentWord("The students are here.")); // expected: false[cite: 1]

// Exercise 8: Validate Basic Email Format[cite: 1]
console.log("\nEx 8 (Basic Email):");
console.log("  'student@example.com' ->", validateBasicEmail("student@example.com")); // expected: true[cite: 1]
console.log("  'invalid-email' ->", validateBasicEmail("invalid-email"));             // expected: false[cite: 1]

// Exercise 10: Combine Multiple Validations[cite: 1]
console.log("\nEx 10 (Combined Validation Function):");
console.log("  Valid Data ->", validateStudentData("1000000011", "student01", "student@example.com")); // expected: true[cite: 1]
console.log("  Invalid Data ->", validateStudentData("123", "usr", "bad-email"));                   // expected: false[cite: 1]


console.log("\n=== TESTING ADDITIONAL EXAMPLES ===");

// 1. Hex Color
console.log("Hex Color '#ff0000':", validateHexColor("#ff0000")); // true
console.log("Hex Color '#12345':", validateHexColor("#12345"));   // false

// 2. IPv4 Address
console.log("IPv4 '192.168.1.1':", validateIPv4("192.168.1.1")); // true
console.log("IPv4 '192.168.1':", validateIPv4("192.168.1"));       // false

// 3. US Phone Number
console.log("Phone '555-123-4567':", validateUSPhoneNumber("555-123-4567")); // true

// 4. URL Detection
console.log("URL 'https://example.com':", validateURL("https://example.com")); // true

// 5. Password Strength
console.log("Password 'Str0ng@Pass':", validateStrongPassword("Str0ng@Pass")); // true
console.log("Password 'weakpass':", validateStrongPassword("weakpass"));       // false

// 6. Extract HTML Tag Content
console.log("HTML Content ('<p>Hello World</p>'):", extractTagContent("<p>Hello World</p>")); // "Hello World"

// 7. ISO Date Validation
console.log("ISO Date '2026-10-19':", validateISODate("2026-10-19")); // true

// 8. Clean Whitespace
console.log("Clean Whitespace:", `"${cleanWhitespace("Too   much    space   here.")}"`); // "Too much space here."

// 9. Image File Extension
console.log("Image Extension 'photo.JPG':", validateImageExtension("photo.JPG")); // true

// 10. Extract Hashtags
console.log("Extract Hashtags:", extractHashtags("Learning JavaScript and #RegEx is awesome! #coding")); 
// ["#RegEx", "#coding"]