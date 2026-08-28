// Author: Cristian Camilo Cortes Ortiz

// Select DOM elements
const taskInput = document.getElementById("taskInput");
const addTaskBtn = document.getElementById("addTaskBtn");
const taskList = document.getElementById("taskList");

// Add click event listener
addTaskBtn.addEventListener("click", function() {

    // Read input value
    const task = taskInput.value;

    // Prevent empty task
    if (task.trim() === "") {
        alert("Please enter a task.");
        return;
    }

    // Create list Item
    const newTask = document.createElement("li");

    // Add task text
    newTask.textContent = task;

    // Add task to list
    taskList.appendChild(newTask);

    // Clear input
    taskInput.value = "";
});