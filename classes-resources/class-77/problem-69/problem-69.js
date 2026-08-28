/*
    Author: Cristian Camilo Cortes Ortiz <Cristianco9>
    Problem: Formats a full name into username 
*/

/**
 * Formats a full name into a username
 * @param {string} fullName 
 * @returns {string}
 */
function formatUsername(fullName) {
    return fullName.toLowerCase().replace(/\s+/g, "");
}

/**
 * Generates usernames from a list of  full names
 * @param {string[]} names 
 * @returns {string[]} 
 */
function generateUsernames(names) {

    const usernames = [];

    for (const name of names) {

        const username = formatUsername(name);
        usernames.push(username);
    }

    return usernames;
}

// Example usage
const names = ["Jhonny Frank", "Will Smith", "Alex Rosse"];
const result = generateUsernames(names);

console.log(`Result: ${result}`);