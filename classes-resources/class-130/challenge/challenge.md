# Code Challenge 2: Build the Benefits Component

---

# Objective

Congratulations! You have successfully built the first version of the
**TravelHub** landing page using **Vue.js**, **Bootstrap 5**, and
**Bootstrap Icons**.

During today's lesson, we completed most of the application. However, we
did not have enough time to implement one of the remaining sections.

Your mission is to finish the project by creating a new reusable Vue
component named **Benefits**.

This challenge will reinforce your understanding of **Vue components** and
how Bootstrap can be used to build professional, responsive user interfaces.

---

# Scenario

The TravelHub marketing team wants to convince visitors that their travel
agency is the best choice.

To accomplish this, they need a section highlighting the main advantages of
booking vacations with TravelHub.

As a Front-End Developer, you have been assigned to design and implement
this section.

---

# Your Mission

Create a new Vue component named:

```text
Benefits.vue
```

The component must be displayed **between the Destinations section and the
Footer**.

The design should follow the same visual style as the rest of the
application.

---

# Requirements

Your solution must include the following elements.

---

## 1. Create the Component

Inside the `components` folder create:

```text
Benefits.vue
```

Use the following Vue structure:

* `<template>`
* `<script setup>`
* `<style scoped>` (optional)

---

## 2. Create a Responsive Section

The section should include:

* A Bootstrap container
* A title
* A short introductory paragraph
* Three responsive Bootstrap Cards

Example title:

```text
Why Choose TravelHub?
```

---

## 3. Use Bootstrap Grid

Organize the cards using Bootstrap's Grid System.

Suggested classes:

* `container`
* `row`
* `col-md-4`
* `g-4`

The cards must automatically stack on smaller screens.

---

## 4. Bootstrap Cards

Each card must include:

* Bootstrap Icon
* Card Title
* Short Description
* Bootstrap Button

Suggested topics:

* Secure Booking
* Best Prices
* 24/7 Customer Support

You may create your own travel-related features if you prefer.

---

## 5. Bootstrap Icons

Each card should display a different icon.

Examples:

* `bi-shield-check`
* `bi-cash-coin`
* `bi-headset`
* `bi-globe`
* `bi-airplane`
* `bi-stars`

---

## 6. Buttons

Every card should contain a Bootstrap button.

Examples:

* Learn More
* Explore
* Contact Us

---

## 7. Equal Card Heights

All cards should have the same height regardless of their content.

Use Bootstrap utilities such as:

* `d-flex`
* `flex-column`
* `h-100`
* `mt-auto`

---

## 8. Display the Component

Import the component into `App.vue`.

Example:

```vue
import Benefits from "./components/Benefits.vue";
```

Render it below the `Destinations` component.

---

# Bootstrap Concepts to Practice

Your solution should demonstrate the correct use of the following Bootstrap
classes.

### Layout

* `container`
* `row`
* `col-md-4`

### Cards

* `card`
* `card-body`
* `shadow`
* `h-100`

### Typography

* `display-5`
* `fw-bold`
* `lead`
* `text-center`

### Buttons

* `btn`
* `btn-primary`
* `btn-outline-primary`

### Utilities

* `py-5`
* `mb-5`
* `mt-auto`
* `g-4`
* `w-100`

### Colors

* `bg-light`
* `text-primary`
* `text-success`
* `text-warning`

---

# Suggested Layout

```text
-------------------------------------------------------------

                 Why Choose TravelHub?

     Discover why thousands of travelers trust us.

-------------------------------------------------------------

+----------------+ +----------------+ +----------------+

|      🛡️       | |      💰       | |      🎧       |

| Secure Booking | | Best Prices   | | 24/7 Support  |

| Description    | | Description   | | Description   |

| [Learn More]   | | [Explore]     | | [Contact Us]  |

+----------------+ +----------------+ +----------------+

-------------------------------------------------------------
```

---

# Learning Objectives

By completing this challenge, you will practice:

* Creating Vue Single File Components
* Organizing applications into reusable components
* Building responsive layouts with Bootstrap
* Creating Bootstrap Cards
* Using Bootstrap Icons
* Applying Bootstrap utility classes
* Importing components into another Vue component
* Maintaining a consistent application design

---

# Submission Checklist

Before submitting your project, verify that:

* `Benefits.vue` has been created.
* The component is imported into `App.vue`.
* The component appears between **Destinations** and **Footer**.
* Three responsive Bootstrap Cards are displayed.
* Each card includes an icon, title, description, and button.
* All cards have the same height.
* The application remains fully responsive.
* The project runs without errors.

---

# Evaluation Criteria

| Criterion                         |  Points |
| --------------------------------- | ------: |
| Vue component structure           |      20 |
| Bootstrap Grid implementation     |      20 |
| Bootstrap Cards and Buttons       |      20 |
| Responsive layout                 |      15 |
| Equal-height cards                |      10 |
| Code organization and readability |      15 |
| **Total**                         | **100** |

---

Read the official Bootstrap documentation and integrate the new component
into your design while keeping the application clean, responsive, and
consistent.

Good luck, and remember: **great Vue applications are built from small,
reusable components combined with responsive Bootstrap layouts.**
