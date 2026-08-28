import { runExamples } from "./examples.js";

const button = document.getElementById("runExamples");

button.addEventListener("click", () => {
    runExamples();
});