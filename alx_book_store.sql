-- database
CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

-- books table
CREATE TABLE Books(
    book_id  INT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT NOT NULL, 
    price DOUBLE NOT NULL,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id) ON DELETE CASCADE 
);

-- authors table
CREATE TABLE Authors(
    author_id INT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- Customers table
CREATE TABLE Customers(
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL,
    address TEXT 
);

-- Orders table
CREATE TABLE Orders(
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE
);

-- Order details table
CREATE TABLE Order_Details(
    order_detail_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity DOUBLE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE
);