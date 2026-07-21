// DOM Elements
const taskInput = document.querySelector("#taskInput");
const addTaskBtn = document.querySelector("#addTaskBtn");
const taskList = document.querySelector("#taskList");
const taskCounter = document.querySelector("#taskCounter");
const emptyMessage = document.querySelector("#emptyMessage");

// Initialize Events
initializeEvents();
updateTaskCounter();
checkEmptyState();

// Add Task Button
addTaskBtn.addEventListener("click", addTask);

// Press Enter to Add Task
taskInput.addEventListener("keydown", (event) => {
    if (event.key === "Enter") {
        addTask();
    }
});

// -------------------------------
// Functions
// -------------------------------
function initializeEvents() {
    const checkboxes = document.querySelectorAll(".task-checkbox");
    const deleteButtons = document.querySelectorAll(".delete-btn");
    checkboxes.forEach((checkbox) => {
        checkbox.addEventListener("change", toggleTask);
    });
    deleteButtons.forEach((button) => {
        button.addEventListener("click", deleteTask);
    });
}

function addTask() {
    const taskName = taskInput.value.trim();
    if (taskName === "") {
        alert("Please enter a task.");
        return;
    }
    const task = document.createElement("div");
    task.className =
        `flex justify-between items-center bg-gray-50 border border-gray-200 rounded-lg p-4`;
    task.innerHTML = `
        <div class="flex items-center gap-3">
            <input
                type="checkbox"
                class="task-checkbox w-5 h-5"
            />
            <span class="task-text text-gray-800">
                ${taskName}
            </span>
        </div>
        <button
            class="delete-btn bg-red-500 text-white px-4 py-2 rounded-lg hover:bg-red-600 transition">
            Delete
        </button>
    `;
    taskList.appendChild(task);
    task.querySelector(".task-checkbox")
        .addEventListener("change", toggleTask);
    task.querySelector(".delete-btn")
        .addEventListener("click", deleteTask);
    taskInput.value = "";
    taskInput.focus();
    updateTaskCounter();
    checkEmptyState();
}

function toggleTask(event) {
    const checkbox = event.target;
    const taskText =
        checkbox.parentElement.querySelector(".task-text");
    if (checkbox.checked) {
        taskText.classList.add("line-through", "text-gray-400");
        taskText.classList.remove("text-gray-800");
    } else {
        taskText.classList.remove("line-through", "text-gray-400");
        taskText.classList.add("text-gray-800");
    }
}

function deleteTask(event) {
    const task =
        event.target.parentElement;
    task.remove();
    updateTaskCounter();
    checkEmptyState();
}

function updateTaskCounter() {
    const totalTasks = taskList.children.length;
    if (totalTasks === 1) {
        taskCounter.textContent =
            `${totalTasks} Task`;
    } else {
        taskCounter.textContent =
            `${totalTasks} Tasks`;
    }
}

function checkEmptyState() {
    if (taskList.children.length === 0) {
        emptyMessage.classList.remove("hidden");
    } else {
        emptyMessage.classList.add("hidden");
    }
}