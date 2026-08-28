# Problem: Quadratic Equation Solver Using the General Formula

## Objective
Develop a function that solves a quadratic equation using the general formula 
(also known as the quadratic formula).

## Scenario
In many engineering and scientific applications, it is necessary to compute the 
roots of a quadratic equation of the form:

    ax² + bx + c = 0

Where:
- `a`, `b`, and `c` are real numbers
- `a ≠ 0` (otherwise, the equation is not quadratic)

To solve this type of equation, the general formula is used:

    x = (-b ± √(b² - 4ac)) / (2a)

The expression inside the square root:

    Δ = b² - 4ac

is called the **discriminant**, and it determines the nature of the roots.

## Requirements
1. Create a function named `solveQuadraticEquation`.
2. The function must receive three parameters:
   - `a` (number)
   - `b` (number)
   - `c` (number)

3. The function should:
   - Calculate the discriminant: Δ = b² - 4ac
   - Based on the discriminant:
     - If Δ > 0 → return two real and distinct roots
     - If Δ = 0 → return one real root (both roots are equal)
     - If Δ < 0 → return a message indicating no real solutions

4. The function must return:
   - An object containing:
     - `discriminant`
     - `roots` (array of values or message)

## Example

### Input:
a = 1  
b = -3  
c = 2  

### Output:
discriminant = 1  
roots = [2, 1]