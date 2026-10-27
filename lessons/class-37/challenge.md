### 🎯 CSS Interaction Challenge

You are given an HTML + CSS example that displays several **feature cards**.  
Each card uses the `.feature` class and already has a hover effect that **moves 
the card up** using `translateY(-4px)` and changes the background color.

Your task is to extend this interface.

---

### 🧩 Challenge

1. **Add a new feature card in the HTML**

Inside the `.features` section, create a new `<div>` that contains **two classes**:

- `feature`
- `challenge`

Example:

```html
<div class="feature challenge">Custom Integration</div>
```

2. **Create a CSS selector for the new class**

Create a selector that targets the element when the mouse pointer is over it.

Requirements:

- Change the background color to a different one.

- Move the element down on the Y axis.

- Use transform: translateY().

3. **Override the default hover behavior**

The .feature:hover rule already moves cards upward.

Your .challenge:hover rule must:

- Override that behavior

- Move the element downward instead

Example structure:

```CSS
.challenge:hover {
  background-color: ...;
  transform: translateY(...);
}
```

## ✅ Expected Result

- Normal `.feature` cards → move up on hover

- `.feature.challenge` card → moves down on hover and uses a different color

## 🎯 Goal

Practice:

- CSS selectors

- `:hover` pseudo-class

- `transform` and `translateY()`

- CSS cascade and overriding styles