-- This is a SQL comment

-------------------------------------------------------------------------------
-- Command to create a database
CREATE DATABASE library_db;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Connect to the database before executing the
-- remaining statements.
-------------------------------------------------------------------------------

-- Command to create a table
-- Create the table 'Author'
CREATE TABLE author (
    id          INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name   VARCHAR(50) NOT NULL,
    country     VARCHAR(30) NOT NULL,
    birth_year  INT NOT NULL,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-------------------------------------------------------------------------------

-- Create the table 'Book'
CREATE TABLE book (
    id                  INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title               VARCHAR(100) NOT NULL,
    isbn                VARCHAR(30) UNIQUE NOT NULL,
    publication_year    INT NOT NULL,
    available           BOOLEAN DEFAULT TRUE,
    author_id           INT NOT NULL,
    created_at          TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-------------------------------------------------------------------------------

-- Create the table 'Member'
CREATE TABLE member (
    id          INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name  VARCHAR(50) NOT NULL,
    last_name   VARCHAR(50) NOT NULL,
    email       VARCHAR(100) UNIQUE NOT NULL,
    phone       VARCHAR(20) UNIQUE NOT NULL,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-------------------------------------------------------------------------------

-- Create the table 'Loan'
CREATE TABLE loan (
    id              INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,          
    member_id       INT NOT NULL,
    book_id         INT NOT NULL,
    loan_date       DATE NOT NULL,
    return_date     DATE,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-------------------------------------------------------------------------------

-- Command to insert data (rows) in a table
-- Insert rows in the table 'author'
INSERT INTO author (full_name, country, birth_year)
VALUES ('J.K Rowling', 'United Kingdom', 1965);

INSERT INTO author (full_name, country, birth_year)
VALUES ('George Orwell', 'United Kingdom', 1903);

INSERT INTO author (full_name, country, birth_year)
VALUES 
('Gabriel Garcia Marquez', 'Colombia', 1927),
('Jane Austen', 'United Kingdom', 1775),
('Stephen King', 'United States', 1947);
-------------------------------------------------------------------------------

-- Insert rows in the table 'book'
INSERT INTO book (title, isbn, publication_year, available, author_id)
VALUES
('Harry Potter and the Philosopher''s Stone', '9780747532743', 1997, TRUE, 1),
('1984', '9780451524935', 1949, TRUE, 2),
('One hundred years of solitude', '9780307474728', 1967, TRUE, 3),
('Pride and Prejudice', '9780141439518', 1813, FALSE, 4),
('The Shining', '9780307743657', 1977, FALSE, 5);
-------------------------------------------------------------------------------

-- Display the records from a table
SELECT * FROM author;
-------------------------------------------------------------------------------
SELECT * FROM book;
-------------------------------------------------------------------------------

-- Insert rows in the table 'member'
INSERT INTO member (first_name, last_name, email, phone)
VALUES
('Olivia', 'Martinez', 'olivia.martinez@email.com', '555-2001'),
('Ethan', 'Walker', 'ethan.walker@email.com', '555-2002'),
('Isabella', 'Hall', 'isabella.hall@email.com', '555-2003'),
('Liam', 'Young', 'liam.young@email.com', '555-2004'),
('Mia', 'Allen', 'mia.allen@email.com','555-2005');
-------------------------------------------------------------------------------

-- Insert rows in the table 'loan'
INSERT INTO loan (member_id, book_id, loan_date, return_date)
VALUES
(6, 2, '2026-08-01', NULL),
(7, 5, '2026-08-02', NULL),
(8, 1, '2026-08-03', '2026-08-10'),
(9, 4, '2026-08-04', NULL),
(10, 3, '2026-08-05', '2026-08-12');
-------------------------------------------------------------------------------

-- Display the records from a table
SELECT * FROM member;
-------------------------------------------------------------------------------
SELECT * FROM loan;
-------------------------------------------------------------------------------