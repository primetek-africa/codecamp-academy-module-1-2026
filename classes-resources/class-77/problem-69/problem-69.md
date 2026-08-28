# Problem: Username Formatter

## Objective
Create a function that formats a user's name into a valid username.

## Requirements
1. Create a function named `formatUsername`.
2. The function must receive one parameter:
   - `fullName` (string)

3. The function should:
   - Convert the string to lowercase
   - Remove all spaces
   - Return the formatted username

## Additional Requirement
4. Create another function named `generateUsernames` that:
   - Receives an array of full names
   - Returns a new array with formatted usernames

## Example
Input:
["John Doe", "Jane Smith", "Carlos Pérez"]

Output:
["johndoe", "janesmith", "carlospérez"]