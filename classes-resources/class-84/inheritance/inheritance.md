# Introduction to Inheritance in JavaScript

## What is Inheritance?

**Inheritance** is one of the fundamental concepts of 
**Object-Oriented Programming (OOP)**. It allows one class to 
**reuse the properties and methods of another class**, reducing duplicated code 
and making software easier to maintain.

In simple terms, inheritance allows a new class to be created based on an 
existing class.

Think of inheritance as a **parent-child relationship**:

* A **parent class** contains common characteristics.
* A **child class** inherits those characteristics and can add new ones.

### Real-World Example

Imagine a real-world scenario:

A dog and a cat are both animals.

They share common characteristics:

* They eat
* They sleep
* They breathe

However, they also have unique behaviors:

* A dog barks
* A cat meows

Instead of repeating the same shared code for each animal, we create a general 
`Animal` class and allow other classes to inherit from it.

This is exactly what inheritance solves.

---

## Why Do We Use Inheritance?

Inheritance is useful because it helps developers:

### 1. Reuse Code

Instead of rewriting the same logic multiple times, child classes can reuse 
functionality from parent classes.

### 2. Reduce Duplication

Common behaviors only need to be written once.

### 3. Improve Maintainability

If a shared behavior changes, it only needs to be updated in one place.

### 4. Model Real-World Relationships

Inheritance helps represent relationships between entities.

Examples:

* A car **is a** vehicle
* A dog **is an** animal
* A teacher **is a** person
* A motorcycle **is a** vehicle

This is known as an **"is-a relationship"**.

---

## Basic Terminology

Before learning inheritance in JavaScript, students must understand some key concepts.

### Parent Class (Base Class / Superclass)

The class that contains shared functionality.

Example:

```js
class Animal {
    eat() {
        console.log("Eating...");
    }
}
```

Here:

`Animal` is the **parent class**.

---

### Child Class (Subclass / Derived Class)

The class that inherits from another class.

Example:

```js
class Dog extends Animal {
}
```

Here:

`Dog` is the **child class** because it inherits from `Animal`.

---

## The `extends` Keyword

In JavaScript, inheritance is implemented using the `extends` keyword.

Syntax:

```js
class ChildClass extends ParentClass {

}
```

Example:

```js
class Animal {
    eat() {
        console.log("Eating...");
    }
}

class Dog extends Animal {
    bark() {
        console.log("Woof!");
    }
}
```

In this example:

* `Dog` inherits from `Animal`
* `Dog` automatically gains access to `eat()`
* `Dog` also defines its own method `bark()`

Creating an object:

```js
const dog = new Dog();

dog.eat();
dog.bark();
```

Output:

```text
Eating...
Woof!
```

### What Happened Here?

Even though the `Dog` class does not define the `eat()` method, it can still use 
it because it inherited it from `Animal`.

This is the power of inheritance.

---

## How Inheritance Works Internally

When JavaScript cannot find a property or method in the child class, it searches 
in the parent class.

For example:

```js
class Animal {
    sleep() {
        console.log("Sleeping...");
    }
}

class Cat extends Animal {
}

const cat = new Cat();

cat.sleep();
```

The `Cat` class does not contain `sleep()`.

JavaScript automatically checks the parent class (`Animal`) and finds the method 
there.

---

## Inheriting Properties with Constructors

Many classes have constructors.

When inheritance is involved, child classes often need to inherit parent properties.

Example:

```js
class Animal {
    constructor(name, age) {
        this.name = name;
        this.age = age;
    }

    eat() {
        console.log(`${this.name} is eating`);
    }
}
```

Now we create a child class:

```js
class Dog extends Animal {
    constructor(name, age, breed) {
        super(name, age);
        this.breed = breed;
    }

    bark() {
        console.log(`${this.name} says woof!`);
    }
}
```

Creating an object:

```js
const dog = new Dog("Max", 3, "Golden Retriever");

console.log(dog.name);
console.log(dog.age);
console.log(dog.breed);

dog.eat();
dog.bark();
```

Output:

```text
Max
3
Golden Retriever
Max is eating
Max says woof!
```

---

## The `super()` Keyword

The `super()` keyword is one of the most important parts of inheritance.

It allows the child class to call the constructor of the parent class.

Example:

```js
super(name, age);
```

This line sends values to the parent constructor.

Without `super()`, inherited properties will not be initialized.

### Important Rule

In JavaScript:

> `super()` must be called before using `this` in a child constructor.

Incorrect example:

```js
class Dog extends Animal {
    constructor(name) {
        this.name = name;
    }
}
```

This causes an error.

Correct version:

```js
class Dog extends Animal {
    constructor(name, age) {
        super(name, age);
    }
}
```

---

## Adding New Features in Child Classes

Child classes can introduce new properties and methods.

Example:

```js
class Vehicle {
    constructor(brand) {
        this.brand = brand;
    }

    start() {
        console.log("Vehicle started");
    }
}

class Motorcycle extends Vehicle {
    constructor(brand, engineSize) {
        super(brand);
        this.engineSize = engineSize;
    }

    doWheelie() {
        console.log("Doing a wheelie!");
    }
}
```

Usage:

```js
const bike = new Motorcycle("Honda", "190cc");

bike.start();
bike.doWheelie();
```

The child class keeps everything from the parent and adds more functionality.

---

## Method Overriding

A child class can replace a parent method with its own implementation.

This is called **method overriding**.

Example:

```js
class Animal {
    makeSound() {
        console.log("Some generic sound");
    }
}

class Dog extends Animal {
    makeSound() {
        console.log("Woof!");
    }
}

class Cat extends Animal {
    makeSound() {
        console.log("Meow!");
    }
}
```

Usage:

```js
const dog = new Dog();
const cat = new Cat();

dog.makeSound();
cat.makeSound();
```

Output:

```text
Woof!
Meow!
```

Even though both classes inherited from `Animal`, they customized the inherited 
behavior.

This concept is strongly related to **polymorphism**.

---

## Advantages of Inheritance

### Code Reusability

Write code once and reuse it.

### Cleaner Architecture

Keeps code organized and structured.

### Easier Maintenance

Fixing shared logic happens in one place.

### Scalability

New classes can easily be added.

---

## Common Beginner Mistakes

### 1. Forgetting `extends`

Incorrect:

```js
class Dog Animal {
}
```

Correct:

```js
class Dog extends Animal {
}
```

---

### 2. Forgetting `super()`

Incorrect:

```js
class Dog extends Animal {
    constructor(name) {
        this.name = name;
    }
}
```

Correct:

```js
class Dog extends Animal {
    constructor(name) {
        super(name);
    }
}
```

---

### 3. Overusing Inheritance

Not everything should use inheritance.

Ask this question:

> Does this class truly represent an "is-a" relationship?

Good example:

* Dog → Animal

Bad example:

* Engine → Car

An engine is **not a car**.
A car **has an engine**.

This is **composition**, not inheritance.

---

## Mental Model for Students

When deciding whether to use inheritance, ask:

### Is this object a type of another object?

If yes → inheritance may make sense.

Examples:

* Teacher → Person
* Cat → Animal
* Truck → Vehicle

If the object merely contains another object:

* Car has an engine
* House has rooms

Then composition is probably better.

---

## Summary

Inheritance in JavaScript allows one class to reuse the functionality of another.

Key concepts students must remember:

* `extends` creates inheritance
* Parent class contains shared logic
* Child class inherits behaviors and properties
* `super()` calls the parent constructor
* Child classes can add new functionality
* Methods can be overridden
* Inheritance models **"is-a" relationships**

### Simple Formula

> Child Class = Parent Features + New Features
