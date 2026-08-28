# JavaScript Inheritance Challenge

## Problem: Banking Account Management System

A bank wants to modernize its software system to manage customer accounts.

As a software developer, your task is to create a system using 
**Object-Oriented Programming (OOP)** and **inheritance in JavaScript**.

The bank offers different types of accounts. All accounts share common 
information, but each account type also has unique features.

---

## Requirements

### 1. Create a Parent Class

Create a parent class called:

```js
BankAccount
```

The class must include the following properties:

* `ownerName`
* `accountNumber`
* `balance`

---

### 2. Add Methods to the Parent Class

Create the following methods:

```js
deposit(amount)
```

This method must increase the account balance.

Example:

```text
Deposit successful. New balance: $1500
```

---

Create another method:

```js
withdraw(amount)
```

This method must reduce the balance if enough money exists.

Example:

```text
Withdrawal successful. Remaining balance: $1200
```

If there is insufficient balance:

```text
Insufficient funds.
```

---

Create another method:

```js
showInformation()
```

This method must display the account information.

Example output:

```text
Owner: Cristian
Account Number: 123456
Balance: $1000
```

---

### 3. Create a Child Class

Create a child class called:

```js
SavingsAccount
```

The class must inherit from `BankAccount`.

Add a new property:

* `interestRate`

Create a method:

```js
addInterest()
```

This method must calculate and add interest to the account balance.

Example:

```text
Interest added successfully.
```

---

### 4. Create Another Child Class

Create a child class called:

```js
CheckingAccount
```

The class must inherit from `BankAccount`.

Add a new property:

* `monthlyFee`

Create a method:

```js
chargeFee()
```

This method must subtract the monthly fee from the account balance.

Example:

```text
Monthly fee charged.
```

---

### 5. Create Objects

Create:

* One `SavingsAccount` object
* One `CheckingAccount` object

---

### 6. Test the Program

You must:

* Show account information
* Deposit money
* Withdraw money
* Test inherited methods
* Test child-specific methods

---

## Hints

### Hint 1

Remember to use:

```js
extends
```

to create inheritance.

---

### Hint 2

Use:

```js
super()
```

inside child constructors.

---

### Hint 3

Ask yourself:

> Is a savings account a bank account?

If yes, inheritance is a good choice.

## Expected Concepts to Practice

Students should practice:

* Classes
* Constructors
* Objects
* Inheritance
* `extends`
* `super()`
* Methods
* Conditional logic
* Reusing parent methods
* Child-specific behavior
* Real-world modeling