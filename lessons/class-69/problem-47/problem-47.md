\# Programming Challenge: Machine Temperature Monitoring

## Problem Overview

In an industrial environment, machines must operate within safe temperature limits 
to avoid damage or malfunction. A monitoring system periodically checks the temperature 
of a machine and takes action if the temperature is above the safe operating level.

Your task is to design a program that simulates a cooling process for a machine 
that is currently overheating. The system must repeatedly reduce the temperature 
until it reaches a safe operating level.

This exercise focuses on using the **`while` statement** to repeat a process until 
a condition becomes false.

## Scenario

A machine is currently operating at **95°C**, which is above the safe temperature 
limit. The maximum safe operating temperature is **70°C**.

Each cooling cycle reduces the temperature by **5°C**.

The system must continue running cooling cycles until the temperature reaches or 
drops below the safe temperature level.

## Requirements

Your program should:

- Define a variable representing the **current temperature** of the machine.
- Define a variable representing the **maximum safe temperature**.
- Define how much the temperature decreases during each cooling cycle.
- Continuously simulate the cooling cycles while the machine temperature is above the safe limit.
- Display the temperature after each cooling cycle.
- Stop the process once the machine reaches a safe operating temperature.

## Learning Objective

The goal of this exercise is to practice:

- Analyzing a programming problem
- Identifying the variables and conditions involved
- Designing a logical solution using a **flowchart**
- Implementing repetition with the **`while` loop** in JavaScript

## Instructions

1. Carefully analyze the problem scenario.
2. Identify the key elements of the system:
   - Initial machine temperature
   - Safe temperature limit
   - Temperature reduction per cooling cycle
3. Design the algorithm using a **flowchart** that represents the logic of the program.
4. Implement the solution in **JavaScript** using a `while` loop.
5. Test the program to verify that the cooling process stops when the temperature reaches or goes below the safe limit.

## Expected Outcome

Your program should simulate the cooling process and clearly show how the temperature 
decreases step by step until the machine reaches a safe operating level.