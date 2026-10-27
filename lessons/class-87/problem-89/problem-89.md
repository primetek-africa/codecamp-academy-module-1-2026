# OOP Code Challenge: Access Modifiers in a Smart Home Security System

## Problem Description

A technology company is developing a **Smart Home Security System** that allows 
homeowners to monitor and control the security of their house.

As a software engineer, your task is to design a system using 
**Object-Oriented Programming (OOP)** principles in **JavaScript**, applying:

* Public methods
* Private methods
* Protected methods (by convention)
* Static methods
* Encapsulation
* Inheritance

You must create a class system that models how a smart home security platform works.

## Requirements

### 1. Create a Parent Class: `SmartDevice`

The class should contain:

#### Properties

* `deviceName`
* `brand`
* `isOnline`

#### Protected Method (Convention)

Create a protected method:

```javascript
_connectToNetwork()
```

This method should return:

```text
Device connected to secure network.
```

The method should only be used internally or by child classes.

---

### 2. Create a Child Class: `SecurityCamera`

The class should inherit from `SmartDevice`.

#### Additional Properties

* `cameraResolution`
* `recording`

#### Private Method

Create a private method:

```javascript
#validateStorageSpace()
```

This method should:

* Simulate checking whether enough storage exists.
* Return `true`.

#### Public Methods

Create the following public methods:

### `startRecording()`

Requirements:

* Use `_connectToNetwork()`.
* Use `#validateStorageSpace()`.
* Change recording status to `true`.
* Return a success message.

### `stopRecording()`

Requirements:

* Change recording status to `false`.
* Return a message indicating recording has stopped.

### `showCameraInformation()`

Return all camera information inside an object.

---

### 3. Create a Static Method

Create a static method inside `SecurityCamera`:

```javascript
static convertResolutionToPixels(width, height)
```

This method should:

Return:

```text
width × height
```

Example:

```javascript
SecurityCamera.convertResolutionToPixels(1920, 1080)
```

Output:

```text
2073600
```

---

## Expected Concepts to Apply

Students must correctly apply:

* OOP classes
* Constructors
* Inheritance (`extends`)
* Public methods
* Private methods (`#`)
* Protected methods by convention (`_`)
* Encapsulation
* Static methods
* Object creation

---


# Expected Output

```text
Device connected to secure network. Recording started successfully.

{
  deviceName: 'Outdoor Camera',
  brand: 'Samsung',
  isOnline: true,
  cameraResolution: '4K',
  recording: true
}

Recording stopped successfully.

2073600
```

---

# Reflection Questions

1. Why should `#validateStorageSpace()` be private?

2. Why is `_connectToNetwork()` considered protected instead of public?

3. Why does `convertResolutionToPixels()` use `static`?

4. What OOP principle is demonstrated by hiding internal validation logic?

5. What advantages does inheritance provide in this exercise?

6. What would happen if every method were public?

7. How does this exercise simulate a real-world software system?
