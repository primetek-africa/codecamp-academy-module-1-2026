# Code Challenge: Create a New React Component with Bootstrap

---

# Objective

Congratulations! You have successfully built the first version of the
**FitLife** landing page using **React.js**, **Bootstrap 5**, and
**Bootstrap Icons**.

In this challenge, you will continue working as a **Front-End React
Developer** by expanding the application with a new reusable component.

The purpose of this activity is to reinforce the concepts learned during
today's lesson while giving you more practice creating React components and
styling them with Bootstrap.

---

# Scenario

The FitLife marketing team would like to highlight the benefits of joining
their fitness platform.

They have requested a new section that explains why customers should choose
FitLife over other fitness applications.

Your task is to build this section as a **new React component** and display
it on the home page.

---

# Your Mission

Create a new component named:

```text
Benefits.jsx
```

This component must be displayed **between the Services section and the
Footer**.

The new section should introduce the main advantages of becoming a FitLife
member.

---

# Requirements

Your solution must satisfy the following requirements.

---

## 1. Create a New Component

Inside the `components` folder create:

```text
Benefits.jsx
```

The component must return valid JSX.

---

## 2. Add a New Section

Create a Bootstrap section containing:

* A title
* A short introduction
* Three Bootstrap Cards

Example heading:

```text
Why Choose FitLife?
```

---

## 3. Use Bootstrap Grid

Organize the cards using Bootstrap's responsive Grid System.

Suggested classes:

```jsx
container
row
col-md-4
```

The cards should automatically stack on smaller devices.

---

## 4. Bootstrap Cards

Each card must include:

* Bootstrap Icon
* Card title
* Short description
* Button

Example topics:

* Certified Trainers
* Nutrition Plans
* Flexible Schedule

Feel free to create your own feature ideas.

---

## 5. Bootstrap Icons

Each card should display a different Bootstrap Icon.

Examples:

* `bi-heart-pulse`
* `bi-trophy`
* `bi-activity`
* `bi-stopwatch`
* `bi-person-check`
* `bi-fire`

Choose the icons that best represent your content.

---

## 6. Buttons

Each card must contain a Bootstrap button.

Examples:

```text
Learn More

Explore

Get Started
```

---

## 7. Responsive Design

Your component must work correctly on:

* Mobile phones
* Tablets
* Desktop computers

The layout should adapt automatically.

---

## 8. Display the Component

Import your new component into `App.jsx`.

Example:

```jsx
import Benefits from "./components/Benefits";
```

Then render it below the `Services` component.

---

# Bootstrap Concepts to Practice

Your solution should demonstrate your understanding of the following
Bootstrap classes.

## Layout

* `container`
* `row`
* `col-md-4`

---

## Cards

* `card`
* `card-body`
* `shadow`
* `rounded`

---

## Typography

* `display-5`
* `fw-bold`
* `lead`
* `text-center`

---

## Buttons

* `btn`
* `btn-primary`
* `btn-outline-primary`

---

## Colors

* `bg-light`
* `text-primary`
* `text-success`
* `text-danger`

---

## Utilities

* `py-5`
* `mb-5`
* `mt-4`
* `g-4`
* `w-100`

---

# Suggested Layout

```text
-------------------------------------------------------------

                Why Choose FitLife?

      Everything you need to reach your fitness goals.

-------------------------------------------------------------

+----------------+ +----------------+ +----------------+

|      Icon      | |      Icon      | |      Icon      |

| Certified      | | Nutrition      | | Flexible       |
| Trainers       | | Plans          | | Schedule       |

| Description    | | Description    | | Description    |

| [Learn More]   | | [Learn More]   | | [Learn More]   |

+----------------+ +----------------+ +----------------+

-------------------------------------------------------------
```

---

# Learning Objectives

By completing this activity, you will practice:

* Creating a new React component.
* Writing JSX.
* Importing and exporting components.
* Organizing components inside a React project.
* Building responsive layouts with Bootstrap.
* Creating Bootstrap Cards.
* Using Bootstrap Icons.
* Applying Bootstrap utility classes.
* Keeping a consistent visual design.

---

# Submission Checklist

Before submitting your project, verify that:

* `Benefits.jsx` has been created.
* The component is imported into `App.jsx`.
* The component appears between **Services** and **Footer**.
* Three Bootstrap Cards are displayed.
* Each card contains an icon, title, description, and button.
* The layout is responsive.
* Bootstrap classes are used instead of custom CSS whenever possible.
* The application runs without errors.

---

# Evaluation Criteria

| Criterion                               |  Points |
| --------------------------------------- | ------: |
| React component created correctly       |      20 |
| Proper Bootstrap Grid implementation    |      20 |
| Bootstrap Cards and Buttons             |      20 |
| Responsive layout                       |      15 |
| Code organization and readability       |      15 |
| Visual consistency with the application |      10 |
| **Total**                               | **100** |