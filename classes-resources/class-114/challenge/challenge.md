# Vue.js Code Challenge - Create a Skills Page

## Challenge Overview

Now that you have successfully built the Dashboard and Projects pages,
your next challenge is to expand the application by creating a new page
called **Skills**.

The goal of this challenge is to reinforce the Vue.js concepts we have
learned so far while giving you additional practice working with
components, props, reactive state, computed properties, forms, and
Vue Router.

---

# Challenge Requirements

You must create a new page named:

```text
Skills
```

and add it to the application navigation menu.

The new page should display a collection of professional skills and allow
the user to search and filter them dynamically.

---

# Step 1 - Create a New Route

Create a new page:

```text
src/pages/SkillsView.vue
```

Register the page in the Vue Router configuration.

Add a new navigation link:

```text
Dashboard
Projects
Skills
```

The application should allow navigation between all three pages without
reloading the browser.

---

# Step 2 - Create Skills Data

Create a new file:

```text
src/data/skills.js
```

Store at least 10 skills.

Example:

```javascript
{
  id: 1,
  name: "JavaScript",
  category: "Frontend",
  level: "Advanced"
}
```

Possible categories:

* Frontend
* Backend
* Database
* DevOps

You may add additional categories if desired.

---

# Step 3 - Create a Reusable Skill Component

Create:

```text
src/components/SkillCard.vue
```

Each card should display:

* Skill Name
* Category
* Skill Level

Example:

```text
+--------------------+
| JavaScript         |
| Frontend           |
| Advanced           |
+--------------------+
```

Use Props to receive the skill information.

---

# Step 4 - Display Skills

Render all skills using:

```vue
v-for
```

Every skill must appear inside a reusable SkillCard component.

---

# Step 5 - Add Search Functionality

Create a search input:

```html
<input type="text">
```

Use:

```vue
v-model
```

to capture user input.

The page should update automatically as the user types.

Example:

```text
Search: jav
```

Results:

```text
JavaScript
```

Only matching skills should be displayed.

---

# Step 6 - Add Category Filtering

Create a dropdown menu:

```html
<select>
```

Categories:

```text
All Categories
Frontend
Backend
Database
DevOps
```

Use:

```vue
v-model
```

to store the selected category.

---

# Step 7 - Create a Computed Property

Use:

```javascript
computed()
```

to combine both filters:

* Search Filter
* Category Filter

The displayed skills should update automatically whenever the user:

* Types in the search box
* Changes the category

---

# Step 8 - Conditional Rendering

If no skills match the filters, display:

```text
No skills found.
```

Use:

```vue
v-if
```

and

```vue
v-else
```

to handle this situation.

---

# Step 9 - Add Dynamic Styling

Use Vue's dynamic class binding.

Example:

```vue
:class=""
```

Skill levels should have different visual styles:

```text
Beginner     → Style A
Intermediate → Style B
Advanced     → Style C
```

Students are free to choose colors and designs.

---

# Step 10 - Improve the UI

Create a professional-looking interface that matches the style of the
Dashboard and Projects pages.

Your page should include:

* Page title
* Search box
* Category filter
* Responsive card grid
* Hover effects
* Modern card design
* Consistent spacing
* Mobile-friendly layout

---

# Concepts You Must Practice

This challenge must demonstrate the use of:

* Vue Router
* Components
* Props
* Reactive State with `ref()`
* Computed Properties
* `v-for`
* `v-if`
* `v-else`
* `v-model`
* Dynamic Classes
* Custom CSS Styling

---

# Expected Outcome

At the end of this challenge, you should have a Vue.js application with:

* Dashboard Page
* Projects Page
* Skills Page

All pages should be connected through Vue Router and maintain a
consistent modern UI design.

This challenge is designed to strengthen your understanding of the core
Vue.js concepts that professional developers use every day when building
real-world Single Page Applications (SPAs).
