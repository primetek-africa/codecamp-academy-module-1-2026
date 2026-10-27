# Problem: Delivery Cost Calculator

## Objective
A logistics company needs a function to calculate the total delivery cost based 
on distance traveled.

## Scenario
You are developing a system for a delivery service. The company charges:
- A fixed base fee of $5 for every delivery
- An additional $2 per kilometer traveled

Your task is to implement a function that calculates the total delivery cost for 
a given distance.

## Requirements
1. Create a function named `calculateDeliveryCost`.
2. The function must receive:
   - `distance` (number, in kilometers)

3. The function should:
   - Calculate the total cost using the formula:
     totalCost = baseFee + (costPerKm * distance)
   - Return the total cost

## Example
Input:
distance = 10

Output:
totalCost = 25