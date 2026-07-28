-- This is a SQL comment

-- Command to create a database
CREATE DATABASE library_db;

-- Connect to the database before executing the
-- remaining statements.

-- Command to create a table
-- Create the table 'Author'
CREATE TABLE author (
    id          INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name   VARCHAR(50) NOT NULL,
    country     VARCHAR(30) NOT NULL,
    birth_year  INT NOT NULL,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

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

-- Create the table 'Member'
CREATE TABLE member (
    id          INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name  VARCHAR(50) NOT NULL,
    last_name   VARCHAR(50) NOT NULL,
    email       VARCHAR(100) UNIQUE NOT NULL,
    phone       VARCHAR(20) UNIQUE NOT NULL,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the table 'Loan'
CREATE TABLE loan (
    id              INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,          
    member_id       INT NOT NULL,
    book_id         INT NOT NULL,
    loan_date       DATE NOT NULL,
    return_date     DATE,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);