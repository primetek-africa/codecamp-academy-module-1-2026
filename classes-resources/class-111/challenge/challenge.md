# React.js Challenge: Create an About Page

## Objective

Practice working with:

- React Components
- React Router
- Navigation
- Props
- Custom CSS Styling
- Component Reusability

---

## Challenge Description

Your task is to add a new page to the React Movies Dashboard application.

Create an **About Page** that explains the purpose of the application and
introduces the technologies used to build it.

Students must create:

1. A new page called `AboutPage`
2. A new reusable component called `TechnologyCard`
3. A new route using React Router
4. A navigation link in the Navbar

---

## Requirements

### 1. Create a New Page

Create a new page:

```text
src/pages/AboutPage.jsx
```

The page must contain:

- A title
- A short description of the project
- A section displaying the technologies used

Example:

```text
About React Movies Dashboard

This application allows users to search and discover TV shows
using data from the TVMaze API.
```

---

### 2. Create a New Component

Create a reusable component:

```text
src/components/TechnologyCard.jsx
```

The component must receive props:

```jsx
<TechnologyCard
    name="React"
    description="JavaScript library for building user interfaces."
/>
```

The component should display:

- Technology name
- Technology description

---

### 3. Display Multiple Technologies

Inside the About Page, render multiple cards using an array and `.map()`.

Example technologies:

- React
- React Router
- Axios
- Bootstrap
- TVMaze API

---

### 4. Create a New Route

Add a new route:

```text
/about
```

When users navigate to:

```text
http://localhost:5173/about
```

they should see the About Page.

---

### 5. Update the Navbar

Add a new navigation link:

```text
Home
About
```

Users should be able to navigate between pages without refreshing
the browser.

---

## Bonus Challenge

If you finish early, add:

- Hover animations to the cards
- A responsive grid layout
- Technology icons
- A "Back to Home" button

---

## Example Layout

```text
----------------------------------------------------
About React Movies Dashboard
----------------------------------------------------

This application demonstrates modern React concepts.

----------------------------------------------------
| React          | React Router                  |
| UI Library     | SPA Navigation                |
----------------------------------------------------

----------------------------------------------------
| Axios          | Bootstrap                     |
| API Requests   | Responsive Design             |
----------------------------------------------------

----------------------------------------------------
| TVMaze API                                     |
| Public TV Shows Data                           |
----------------------------------------------------
```

---

## Concepts Practiced

By completing this challenge you will practice:

- Functional Components
- Props
- Component Reusability
- React Router
- Routing
- Navigation
- JSX
- Rendering Lists with `.map()`
- Responsive Design
- CSS Styling

---

## Deliverables

Submit:

1. Screenshot of the About Page
2. `AboutPage.jsx`
3. `TechnologyCard.jsx`
4. Updated Navbar
5. Updated Routes configuration

Good luck and have fun building your first multi-page React application!