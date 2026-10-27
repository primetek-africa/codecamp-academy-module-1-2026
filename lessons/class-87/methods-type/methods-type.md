# Object-Oriented Programming (OOP): Public, Private, and Other Method Access Options

## Introduction

In Object-Oriented Programming (OOP), **methods** are functions that belong to a 
class and define the behavior of an object. However, not all methods should be 
accessible in the same way.

Some methods are designed to be used freely from anywhere in the program, while 
others should remain hidden and accessible only inside the class to protect the 
integrity of the object.

This concept is known as **access control** or **access modifiers**.

Access modifiers define **who can access a method or property** and help 
developers:

* Protect sensitive internal logic.
* Prevent accidental misuse of objects.
* Improve software maintainability.
* Create clear boundaries between what users of a class should use and what should remain internal.
* Follow software engineering principles such as **encapsulation** and **information hiding**.

In modern OOP, the most common access levels are:

1. **Public Methods**
2. **Private Methods**
3. **Protected Methods**
4. **Static Methods**

Although JavaScript does not implement all access modifiers exactly like languages 
such as Java or C#, modern JavaScript provides mechanisms to simulate or implement 
similar behavior.

---

# 1. Public Methods

## Definition

A **public method** is a method that can be accessed from **anywhere in the program**.

This means:

* The object itself can use the method.
* Other objects can use the method.
* External code can call the method.

Public methods represent the **visible interface** of a class.

Think of public methods as the **buttons of a machine**. People can interact with 
the machine only through those buttons, without knowing what happens internally.

## Characteristics

Public methods:

* Are accessible from outside the class.
* Represent actions available to users of the object.
* Expose safe and controlled functionality.
* Are commonly used for CRUD operations, calculations, validations, or displaying information.

## Example in JavaScript

```javascript
class BankAccount {

    constructor(owner, balance) {
        this.owner = owner;
        this.balance = balance;
    }

    deposit(amount) {
        this.balance += amount;
        return `Deposit successful. New balance: ${this.balance}`;
    }

    withdraw(amount) {
        if (amount > this.balance) {
            return 'Insufficient funds';
        }

        this.balance -= amount;
        return `Withdrawal successful. New balance: ${this.balance}`;
    }
}

const account = new BankAccount('Cristian', 1000);

console.log(account.deposit(500));
console.log(account.withdraw(200));
```

## Explanation

In this example:

* `deposit()` is public.
* `withdraw()` is public.

Why?

Because users should be able to perform these actions from outside the class.

Example:

```javascript
account.deposit(500);
```

This is valid because the method is publicly accessible.

---

# 2. Private Methods

## Definition

A **private method** is a method that can only be accessed 
**inside the class where it was created**.

External code cannot call it directly.

Its purpose is to:

* Hide internal logic.
* Protect sensitive operations.
* Prevent developers from incorrectly using internal methods.
* Improve security and maintainability.

Private methods support one of the most important OOP principles:

## Encapsulation

**Encapsulation** means hiding internal implementation details and exposing only 
what is necessary.

Users should not need to know how the system works internally.

They only need to know how to use it.

## Real-Life Analogy

Imagine an ATM machine.

You can:

* Withdraw money
* Check balance
* Deposit money

But internally, the ATM performs hidden operations such as:

* Validating PINs
* Encrypting communication
* Connecting to banking servers

These internal processes are not directly accessible to the customer.

They behave like **private methods**.

## Private Methods in Modern JavaScript

JavaScript uses the `#` symbol to declare private members.

### Example

```javascript
class BankAccount {

    constructor(owner, balance) {
        this.owner = owner;
        this.balance = balance;
    }

    #validateAmount(amount) {
        return amount > 0;
    }

    deposit(amount) {

        if (!this.#validateAmount(amount)) {
            return 'Invalid amount';
        }

        this.balance += amount;
        return `Deposit successful. New balance: ${this.balance}`;
    }
}

const account = new BankAccount('Cristian', 1000);

console.log(account.deposit(500));
```

## Explanation

The method:

```javascript
#validateAmount()
```

is **private**.

This means it can only be used inside the class.

Valid:

```javascript
this.#validateAmount(500)
```

Invalid:

```javascript
account.#validateAmount(500)
```

This produces an error because external code cannot access private methods.

## Why Use Private Methods?

Private methods help:

### 1. Reduce Complexity

Users only interact with important methods.

They do not need to understand internal implementation.

### 2. Improve Security

Sensitive operations remain protected.

### 3. Prevent Incorrect Usage

Developers cannot accidentally call internal logic.

### 4. Make Code Easier to Maintain

You can modify internal logic without affecting external code.

---

# 3. Protected Methods

## Definition

A **protected method** is a method intended to be:

* Accessible inside the class.
* Accessible by child classes (inheritance).
* Not intended for public access.

Many OOP languages support `protected` directly.

Examples:

* Java
* C#
* C++
* PHP

However, JavaScript does **not have a true protected keyword**.

Instead, developers usually follow a naming convention using an underscore (`_`).

This convention means:

> “This method should not be used outside the class hierarchy.”

Although JavaScript technically allows access, it signals that the method is 
meant for internal or inherited usage.

## Example

```javascript
class Vehicle {

    constructor(brand) {
        this.brand = brand;
    }

    _startEngine() {
        return 'Engine started';
    }
}

class Car extends Vehicle {

    drive() {
        return `${this._startEngine()} - Car moving`;
    }
}

const car = new Car('Toyota');

console.log(car.drive());
```

## Explanation

The method:

```javascript
_startEngine()
```

is considered **protected by convention**.

Why?

Because:

* The child class (`Car`) uses it.
* External code should avoid using it directly.

Although this technically works:

```javascript
car._startEngine();
```

it is considered **bad practice** because the underscore communicates that it is 
not part of the public interface.

---

# 4. Static Methods

## Definition

A **static method** belongs to the **class itself**, not to an object instance.

This means:

You do not need to create an object.

Instead, you call the method directly from the class.

Static methods are useful for:

* Utility functions
* Calculations
* Data formatting
* Helper methods

## Example

```javascript
class MathHelper {

    static square(number) {
        return number * number;
    }
}

console.log(MathHelper.square(5));
```

## Explanation

This works:

```javascript
MathHelper.square(5)
```

This does not:

```javascript
const helper = new MathHelper();

helper.square(5);
```

because static methods belong to the class itself.

---

# Comparison Table

| Method Type | Accessible Outside Class | Accessible Inside Class | Accessible by Child Classes | Purpose                    |
| ----------- | ------------------------ | ----------------------- | --------------------------- | -------------------------- |
| Public      | Yes                      | Yes                     | Yes                         | Expose functionality       |
| Private     | No                       | Yes                     | No                          | Hide internal logic        |
| Protected   | Not recommended          | Yes                     | Yes                         | Internal inheritance logic |
| Static      | Through class only       | No instance required    | Yes                         | Utility/helper methods     |

---

# Best Practices

## Use Public Methods For

* Main functionality
* Actions users should perform
* External interaction

Examples:

* `login()`
* `register()`
* `deposit()`
* `withdraw()`

## Use Private Methods For

* Validation
* Sensitive operations
* Internal calculations
* Hidden implementation details

Examples:

* `#validatePassword()`
* `#encryptData()`
* `#calculateTax()`

## Use Protected Methods For

* Shared logic between parent and child classes.
* Internal inheritance behavior.

Examples:

* `_initialize()`
* `_connectDatabase()`
* `_startEngine()`

## Use Static Methods For

* Helper utilities.
* Mathematical calculations.
* Formatting functions.

Examples:

* `Math.max()`
* `Number.parseInt()`
* `Date.now()`

---

# Final Thoughts

Understanding **method accessibility** is essential for writing professional 
software.

A good software engineer carefully decides:

> “Should this method be visible to everyone or only used internally?”

Making proper decisions about access modifiers improves:

* Security
* Scalability
* Maintainability
* Readability
* Software architecture quality

In professional software development, exposing everything publicly is 
considered poor design.

Instead, developers expose only what is necessary and keep internal implementation 
hidden whenever possible.

This approach leads to cleaner, safer, and more maintainable applications.
