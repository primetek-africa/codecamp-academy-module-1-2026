# Code Challenge 3: Expand the AeroVision Dashboard

---

## Challenge Overview

The **Statistics** section of the **AeroVision** dashboard currently
contains only a few statistic cards. Your challenge is to improve this
section and expand the dashboard by creating a **new reusable React
component**.

Your objective is to practice **React component composition** while
improving the application's user interface with **Tailwind CSS**.

---

## Part 1 — Improve the Statistics Section

Enhance the existing `Statistics.tsx` component.

Requirements:

- Improve the section title
- Add a descriptive subtitle
- Add a modern background container
- Improve spacing and alignment
- Add hover effects
- Add smooth transitions
- Improve the responsive layout
- Use a more attractive color palette

---

## Part 2 — Add More Statistics

Create **four new** `StatisticCard` components.

Examples:

- Aircraft Delivered
- Flight Hours
- Airports Served
- Daily Flights
- Countries Served
- Active Routes
- Fleet Age
- Safety Rating

Use different background colors for each card.

---

## Part 3 — Create a New Component

Create a brand-new React component named:

```text
AircraftComparison.tsx
```

This component will display a comparison between **Airbus** and
**Boeing**.

Your component should include:

- A section title
- A short introduction
- Two comparison cards
- One card for **Airbus**
- One card for **Boeing**
- A button on each card

Each comparison card should display information such as:

- Manufacturer
- Country
- Founded Year
- Popular Aircraft
- Number of Employees
- Headquarters

Use Tailwind CSS to create a professional card layout.

---

## Example Layout

```text
-------------------------------------------------------

Aircraft Manufacturers

Compare the world's largest aircraft manufacturers.

-------------------------------------------------------

+----------------------+   +----------------------+

| Airbus               |   | Boeing              |

| France               |   | United States       |

| A320neo              |   | 787 Dreamliner      |

| 150,000 Employees    |   | 170,000 Employees   |

| [Explore]            |   | [Explore]           |

+----------------------+   +----------------------+

-------------------------------------------------------
```

---

## Part 4 — Display the Component

Import your new component into `App.tsx`.

Place it between the following sections:

```text
Statistics

↓

AircraftComparison

↓

Fleet
```

---

## Tailwind Concepts to Practice

### Layout

- `grid`
- `flex`
- `justify-between`
- `justify-center`
- `items-center`
- `gap-*`

### Spacing

- `p-*`
- `px-*`
- `py-*`
- `m-*`
- `mt-*`
- `mb-*`

### Typography

- `text-*`
- `font-bold`
- `font-black`
- `tracking-wide`

### Colors

- `bg-*`
- `text-*`
- `from-*`
- `to-*`

### Borders

- `rounded-lg`
- `rounded-xl`
- `rounded-2xl`

### Effects

- `shadow-lg`
- `shadow-xl`
- `hover:scale-105`
- `hover:-translate-y-2`
- `transition`
- `duration-300`

### Responsive Design

- `sm:*`
- `md:*`
- `lg:*`
- `xl:*`

---

## Rules

- Do **not** modify the datasets.
- Do **not** add JavaScript or TypeScript logic.
- Do **not** use external UI libraries.
- Create the new component using React and TypeScript.
- Use only Tailwind CSS for styling.
- Keep the application fully responsive.

---

## Expected Learning Outcomes

By completing this challenge, you will practice creating new React
components, composing them into an existing application, improving a
responsive dashboard layout, and applying Tailwind CSS utilities to
build modern, professional user interfaces. You will also reinforce the
use of reusable components and strengthen your understanding of React's
component-based architecture.