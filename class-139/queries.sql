-------------------------------------------------------------------------------
-- SQL Query Practice Solutions
-- Library Management System
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Basic Queries

-------------------------------------------------------------------------------
-- Exercise 1
-- Display all authors.
SELECT * FROM author;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Exercise 2
-- Display all books.
SELECT * FROM book;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Exercise 3
-- Display all members.
SELECT * FROM member;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Exercise 4
-- Display all loans.
SELECT * FROM loan;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Exercise 5
-- Display only the title and publication year of every book.
SELECT title, publication_year FROM book;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Exercise 6
-- Display the first name, last name, and email of every member.
SELECT first_name, last_name, email FROM member;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Filtering Data

-- Exercise 7
-- Display all books that are currently available.
SELECT * FROM book WHERE available = TRUE;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Exercise 8
-- Display all books that are currently unavailable.
SELECT * FROM book WHERE available = FALSE;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Exercise 9
-- Display all authors from the United Kingdom.
SELECT * FROM author WHERE country = 'United Kingdom';
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Exercise 10
-- Display all authors born after 1940.
SELECT * FROM author WHERE birth_year > 1940;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Exercise 11
-- Display all books published after 1950.
SELECT * FROM book WHERE publication_year > 1950;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Exercise 12
-- Display all members whose first name is "Olivia".
SELECT * FROM member WHERE first_name = 'Olivia';
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Exercise 13
-- Display all loans that have not yet been returned.
SELECT * FROM loan WHERE return_date IS NULL;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Exercise 14
-- Display all completed loans (those with a return date).
SELECT * FROM loan WHERE return_date IS NOT NULL;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Sorting Data

-- Exercise 15
-- Display all authors ordered alphabetically by full name.
SELECT * FROM author ORDER BY full_name ASC;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Exercise 16
-- Display all books ordered by publication year from oldest to newest.
SELECT * FROM book ORDER BY publication_year ASC;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Exercise 17
-- Display all books ordered by publication year from newest to oldest.
SELECT * FROM book ORDER BY publication_year DESC;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Exercise 18
-- Display all members ordered by last name.
SELECT * FROM member ORDER BY last_name;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Exercise 19
-- Display all loans ordered by loan date.
SELECT * FROM loan ORDER BY loan_date ASC;
-------------------------------------------------------------------------------


-------------------------------------------------------------------------------
-- Limiting Results

-- Exercise 20
-- Display only the first three books.
SELECT * FROM book LIMIT 3;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Exercise 21
-- Display only the first two authors.
SELECT * FROM author LIMIT 2;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Exercise 22
-- Display the newest two published books.
SELECT * FROM book ORDER BY publication_year DESC LIMIT 2;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Aggregate Functions

-- Exercise 23
-- Count the total number of authors.
SELECT COUNT(*) FROM author;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Exercise 24
-- Count the total number of books.
SELECT COUNT(*) FROM book;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Exercise 25
-- Count the total number of members.
SELECT COUNT(*) FROM member;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Exercise 26
-- Count the total number of loans.
SELECT COUNT(*) FROM loan;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Exercise 27
-- Find the oldest publication year.
SELECT MIN(publication_year) FROM book;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Exercise 28
-- Find the newest publication year.
SELECT MAX(publication_year) FROM book;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Exercise 28
-- Find the newest publication year.
SELECT MAX(publication_year) FROM book;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Exercise 29
-- Calculate the average publication year of all books.
SELECT AVG(publication_year) FROM book;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Pattern Matching

-- Exercise 30
-- Display all authors whose name starts with the letter "J".
SELECT * FROM author WHERE full_name LIKE 'J%';
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Exercise 31
-- Display all books whose title contains the word "Harry".
SELECT * FROM book WHERE title LIKE 'Harry%';
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Exercise 32
-- Display all members whose last name ends with "er".
SELECT * FROM member WHERE last_name LIKE '%er';
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Exercise 33
-- Display books published after 1950 that are available.
SELECT * FROM book WHERE publication_year > 1950 AND available = TRUE;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Exercise 34
-- Display authors who are from the United Kingdom or the United States.
SELECT * FROM author WHERE country = 'United Kingdom' OR country = 'United States';
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Exercise 35
-- Display members whose first name is "Olivia" or "Mia".
SELECT * FROM member WHERE first_name = 'Olivia' OR first_name = 'Mia';
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Bonus

-- Bonus 1
-- Display all books published between 1900 and 2000.
SELECT * FROM book WHERE publication_year BETWEEN 1900 AND 2000;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Bonus 2
-- Display all authors who are not from the United Kingdom.
SELECT * FROM author WHERE country <> 'United Kingdom';
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Bonus 3
-- Display all books whose title contains the letter "o".
SELECT * FROM book WHERE title LIKE '%o%';
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Bonus 4
-- Count how many books are currently available.
SELECT COUNT(*) FROM book WHERE available = 'TRUE';
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Bonus 5
-- Count how many books are currently unavailable.
SELECT COUNT(*) FROM book WHERE available = 'FALSE';
-------------------------------------------------------------------------------