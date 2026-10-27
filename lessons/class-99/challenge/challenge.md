# React.js Practice Challenge: Developer Certifications Component

## Objective

Create a new React component called `CertificationsList` that displays a list of 
professional certifications and allows the user to show or hide the list using a 
button.

This exercise will help you practice the following React concepts:

- Components
- JSX
- Arrays
- Rendering Lists with `.map()`
- Props
- State (`useState`)
- Event Handling
- Conditional Rendering
- CSS Styling
- Component Composition

---

## Scenario

You are building a developer portfolio website.

The portfolio should include a section where visitors can view the certifications 
earned by the developer.

The user should be able to:

- View a list of certifications.
- Hide the certifications.
- Show them again.

---

## Requirements

### 1. Create a New Component

Create a new file:

```text
src/components/CertificationsList.jsx
```

---

### 2. Create an Array of Certifications

Inside the component, create an array containing at least 5 certifications.

Each certification should have:

```javascript
{
  id: 1,
  title: "React Developer",
  provider: "Meta"
}
```

Example certifications:

- React Developer
- JavaScript Algorithms
- Python Programming
- Node.js Fundamentals
- AWS Cloud Practitioner

---

### 3. Display the Certifications

Render the certifications dynamically using `.map()`.

Each certification should display:

```text
React Developer - Meta
```

---

### 4. Use React State

Create a state variable that controls whether the certifications are visible or 
hidden.

Example:

```javascript
const [showCertifications, setShowCertifications] = useState(true);
```

---

### 5. Add a Button

Create a button that allows the user to:

```text
Hide Certifications
```

and

```text
Show Certifications
```

depending on the current state.

---

### 6. Implement Conditional Rendering

The certifications should only appear when the state variable indicates they 
should be visible.

When hidden, only the title and button should remain visible.

---

### 7. Add Basic Styling

Create a CSS file:

```text
src/components/CertificationsList.css
```

Your component should include:

- A card container
- Rounded corners
- Padding
- Shadow
- Hover effect on the button

Use your own creativity to improve the design.

---

### 8. Add the Component to App.jsx

Render the new component below the existing components:

```jsx
<ProfileCard />
<SkillsList />
<CertificationsList />
```
