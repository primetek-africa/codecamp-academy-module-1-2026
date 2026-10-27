/*
    Author: Cristian Camilo Cortes Ortiz <Cristianco9>
    Problem: Library Book Manager
*/

// Initial catalog
let books = [
    "The Hobbit",
    "1984",
    "To Kill a Mockingbird",
    "The Great Gatsby",
    "Moby Dick"
];

// 1. Print total number of books
console.log(`Total books: ${books.length}`);

// 2. Add new books to the catalog
books.push("Brave New World");
books.push("The Catcher in the Rye");

console.log(`\nCatalog after adding new books: ${books}`);


// 3. Remove the first book
const removedBook = books.shift();
console.log(`\nRemoved first book: ${removedBook}`);

// 4. Check if "1984" exist in the catalog
let bookFound = false;

for (let i = 0; i < books.length; i++) {
    if(books[i] === "1984") {
        bookFound = true;
        break;
    }
}

if (bookFound) {
    console.log(`\nBook found in the catalog`);
} else {
    console.log(`\nBook not found`);
}

// 5. Print all books with position numbers
console.log(`\nBooks in the library:`);

for (let i = 0; i < books.length; i++) {
    console.log(`${i + 1} - ${books[i]}`);
}

// 6. Count books containing "the"
let booksWithThe = 0;

for (let i = 0; i < books.length; i++) {
    const bookTitle = books[i];

    if(bookTitle.includes("The")) {
        booksWithThe++;
    }
}

// 7. Print result
console.log(`\nBooks containing 'The': ${booksWithThe}`);