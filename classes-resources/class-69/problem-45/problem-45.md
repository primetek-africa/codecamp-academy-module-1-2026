# Programming Challenge: Inventory Restocking System

## Problem Overview

A small store needs a simple program to monitor the quantity of a specific product 
in its inventory. The store has defined a **minimum required stock level** 
for this product. If the inventory is below this minimum level, the system must 
simulate restocking the product until the required level is reached.

Your task is to design a program that repeatedly adds units of the product to the 
inventory until the minimum required stock level is satisfied.

This challenge focuses on understanding **repetition using the `while` statement**, 
which allows a program to execute a block of code multiple times as long as a 
condition remains true.

## Scenario

The store currently has **25 units** of a product in stock. The minimum required 
inventory level is **100 units**.

Each time the store restocks, **10 units** are added to the inventory.

The system must continue restocking until the inventory reaches or exceeds the 
required minimum stock level.

## Requirements

Your program should:

- Start with an initial stock value.
- Check if the inventory is below the required minimum level.
- If the inventory is below the minimum, simulate a restocking process that adds 
more units to the inventory.
- Repeat the restocking process until the required stock level is reached or exceeded.
- Display the inventory level after each restocking operation.

## Learning Objective

The goal of this exercise is to practice:

- Analyzing a programming problem
- Identifying variables and conditions
- Designing an algorithm before coding
- Using the **`while` loop** to control repetition in JavaScript

## Instructions

1. Carefully read and analyze the problem.
2. Identify the key elements:
   - Initial inventory
   - Minimum required inventory
   - Units added per restock
3. Design the solution using a **flowchart** that represents the program logic.
4. Once the flowchart is completed, implement the solution in **JavaScript** using a 
`while` loop.
5. Test your program to verify that the restocking process stops when the inventory 
reaches or exceeds the minimum requirement.

## Expected Outcome

Your program should simulate the restocking process and clearly show how the inventory 
increases step by step until the required level is satisfied.