# Problem: Electricity Bill Calculator (Using switch in JavaScript)

## Introduction

Many real-world systems perform calculations depending on a selected option or 
category. One way to implement this type of decision structure in JavaScript is 
by using the **`switch` statement**.

In this exercise, you will create a small program that calculates the 
**total electricity bill** based on the **type of customer**.

Each customer type has a **different price per kWh**, and the program must apply 
the correct calculation using a **numeric code**.

This exercise helps you practice:

- Using **`switch` statements with numeric options**
- Applying **basic mathematical calculations**
- Writing **clear and structured control flow**

---

## Problem Description

An electricity company charges different prices depending on the **customer type**.

Your program must calculate the **total cost** based on the number of 
**kilowatt-hours (kWh)** consumed and the **customer type code**.

### Customer Type Codes

| Code | Customer Type | Price per kWh |
|-----|---------------|---------------|
| 1 | Residential | $0.12 |
| 2 | Commercial | $0.20 |
| 3 | Industrial | $0.35 |

If the customer type code does **not match any valid option**, the program should 
display an error message.

---

## Given Variables

```javascript
const kwhUsed = 350;
const customerType = 2;
```

- `kwhUsed` → total electricity consumption
- `customerType` → numeric code representing the customer category

---

## Expected Behavior

Your program must:

1. Use a switch statement based on customerType.
2. Determine the price per kWh.
3. Calculate the total electricity bill.
4. Print the result using `console.log()`.
5. Handle invalid codes using the default case.

---

## Example

If:

```
kwhUsed = 350
customerType = 2
```

> Price per kWh = $0.20

```
350 * 0.20 = 70
```

**Output:**

```
Total Bill: $70 USD.
```

---

## Requirements

- Create the flowchart
- Use a switch statement
- Do not request CLI input
- The customer type must be selected only by the numeric code
- Display the result with `console.log()`