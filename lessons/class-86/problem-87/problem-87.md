# JavaScript OOP Challenge

## Problem: Streaming Platform Content System

A streaming platform similar to Netflix or Disney+ wants to improve its software
 system to manage different types of entertainment content.

The platform contains:

* Movies
* TV Series
* Documentaries

All content shares common information, but each type of content behaves 
differently when played.

As a software developer, your task is to create the system using 
**Object-Oriented Programming (OOP)**, **inheritance**, and 
**polymorphism in JavaScript**.

The goal is to create a scalable system where new content types can be added 
easily in the future.

---

# Requirements

## 1. Create a Parent Class

Create a parent class called:

```js
StreamingContent
```

The class must include the following properties:

* `title`
* `genre`
* `duration`

Example:

```text
Title: Interstellar
Genre: Science Fiction
Duration: 169 minutes
```

---

## 2. Add Methods to the Parent Class

Create a method called:

```js
showInformation()
```

This method must display all content information.

---

Create another method called:

```js
play()
```

This method must exist in the parent class.

At the parent level, display:

```text
Playing content...
```

---

## 3. Create Child Classes

### Movie

Create a child class called:

```js
Movie
```

The class must inherit from:

```js
StreamingContent
```

Add a property:

* `director`

Override:

```js
play()
```

Example output:

```text
Playing movie in cinematic mode.
```

---

### Series

Create a child class called:

```js
Series
```

Add a property:

* `numberOfEpisodes`

Override:

```js
play()
```

Example output:

```text
Playing next episode automatically.
```

---

### Documentary

Create a child class called:

```js
Documentary
```

Add a property:

* `topic`

Override:

```js
play()
```

Example output:

```text
Playing educational documentary.
```

---

## 4. Create Objects

Create:

* One `Movie` object
* One `Series` object
* One `Documentary` object

---

## 5. Store Objects in an Array

Create an array called:

```js
platformContent
```

Store all created objects.

---

## 6. Apply Polymorphism

Loop through the array.

For each object:

1. Show the content information.
2. Execute:

```js
play()
```

The same method call must behave differently depending on the object.

---

## Expected Concepts to Practice

Students should practice:

* Classes
* Constructors
* Objects
* Inheritance
* `extends`
* `super()`
* Method overriding
* Polymorphism
* Arrays
* Loops
* Real-world software modeling