-- Create 'library' database
CREATE DATABASE library;
USE library;

-- create table 'Branch'
CREATE TABLE Branch
(
Branch_no VARCHAR(10) PRIMARY KEY,
Manager_id VARCHAR(10),
Branch_address VARCHAR(30),
Contact_no VARCHAR(15)
);
-- Describe the structure of the table Branch
DESC branch;

-- Create table "Employee"
CREATE TABLE Employee
(
Emp_id VARCHAR(10) PRIMARY KEY,
Emp_name VARCHAR(30),
Position VARCHAR(30),
Salary DECIMAL(10,2)
);
-- Describe the structure of the table Employee
DESC employee;

-- Create table "Customer"
CREATE TABLE Customer
(
Customer_Id VARCHAR(10) PRIMARY KEY,
Customer_name VARCHAR(30),
Customer_address VARCHAR(30),
Reg_date DATE
);
-- Describe the structure of the table Customer
DESC customer;

-- Create table "Books"
CREATE TABLE Books
(
ISBN VARCHAR(10) PRIMARY KEY,
Book_title VARCHAR(50),
Category VARCHAR(30),
Rental_Price DECIMAL(10,2),
Status ENUM('Yes','No'),
Author VARCHAR(30),
Publisher VARCHAR(30)
);
DESC Books;
alter TABLE books MODIFY COLUMN ISBN VARCHAR(25);
alter TABLE books MODIFY COLUMN Book_title VARCHAR(80);

-- Create table "IssueStatus"
CREATE TABLE IssueStatus
(
Issue_Id VARCHAR(10) PRIMARY KEY,
Issued_cust VARCHAR(30),
Issued_book_name VARCHAR(50),
Issue_date DATE,
Isbn_book VARCHAR(15),
FOREIGN KEY (Issued_cust) REFERENCES customer(Customer_id) on DELETE CASCADE,
FOREIGN KEY (Isbn_book) REFERENCES books(ISBN) on DELETE CASCADE
);
-- Describe the structure of the table IssueStatus
DESC issuestatus;
ALTER TABLE issuestatus MODIFY COLUMN Issued_book_name VARCHAR(80);
ALTER TABLE issuestatus MODIFY COLUMN Isbn_book VARCHAR(25);

-- Create table "ReturnStatus"
CREATE TABLE ReturnStatus
(
Return_id VARCHAR(10) PRIMARY KEY,
Return_cust VARCHAR(30),
Return_book_name VARCHAR(50),
Return_date DATE,
isbn_book2 VARCHAR(15),
FOREIGN KEY (isbn_book2) REFERENCES books(ISBN) on DELETE CASCADE
);
DESC returnstatus;
ALTER TABLE returnstatus MODIFY COLUMN Return_book_name VARCHAR(80);
ALTER TABLE returnstatus MODIFY COLUMN isbn_book2 VARCHAR(25);

SHOW TABLES;

-- Insert values into each table
INSERT INTO branch VALUES
('B001', 'M101', 'MG Road, Bangalore', '+919099988676'),
('B002', 'M102', 'Indiranagar, Bangalore', '+919099988677'),
('B003', 'G-2', 'Hyderabad, Telangana', '+919099988678'),
('B004', '123/4', 'Rajaji Salai, Chennai', '+919099988679'),
('B005', '22', 'Connaught Place, New Delhi', '+919099988680');
SELECT * FROM branch;

-- Insert values into the employee table
INSERT INTO employee VALUES
('E101', 'Amit Sharma', 'Manager', 60000.00),
('E102', 'Anjali Patel', 'Clerk', 45000.00),
('E103', 'Ravi Kumar', 'Librarian', 55000.00),
('E104', 'Priya Singh', 'Assistant', 40000.00),
('E105', 'Rakesh Gupta', 'Assistant', 42000.00),
('E106', 'Sneha Desai', 'Assistant', 43000.00),
('E107', 'Arjun Reddy', 'Manager', 62000.00),
('E108', 'Neha Kapoor', 'Clerk', 46000.00),
('E109', 'Vikram Patel', 'Librarian', 57000.00),
('E110', 'Maya Menon', 'Assistant', 41000.00),
('E111', 'Rajesh Kumar', 'Manager', 65000.00);
SELECT * FROM employee;

-- Insert values into the customer table
INSERT INTO customer VALUES
('C101', 'Aarav Sharma', '12 MG Road, Bangalore', '2023-05-15'),
('C102', 'Isha Patel', '45 Church Street, Mumbai', '2023-06-20'),
('C103', 'Vivaan Gupta', '78 Brigade Road, Bangalore', '2023-07-10'),
('C104', 'Ananya Rao', '56 Park Street, Kolkata', '2023-08-05'),
('C105', 'Reyansh Kapoor', '89 Connaught Place, Delhi', '2023-09-25'),
('C106', 'Mira Joshi', '23 Banjara Hills, Hyderabad', '2023-10-15'),
('C107', 'Arjun Singh', '34 Sector 15, Chandigarh', '2023-11-20'),
('C108', 'Saanvi Mehta', '45 Nehru Place, Delhi', '2023-12-10'),
('C109', 'Kabir Reddy', '56 MG Road, Pune', '2024-01-05'),
('C110', 'Kiara Patel', '67 Ashoka Road, Bangalore', '2024-02-25');
SELECT * FROM customer;

-- Insert values into the books table
INSERT INTO books VALUES
('978-0-06-112008-4', 'To Kill a Mockingbird', 'Classic', 7.50, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.'),
('978-1-9848-6990-1', 'Where the Crawdads Sing', 'Mystery', 8.00, 'yes', 'Delia Owens', 'G.P. Putnam\'s Sons'),
('978-1-5011-9370-0', 'Little Fires Everywhere', 'Drama', 6.75, 'yes', 'Celeste Ng', 'Penguin Press'),
('978-0-451-52993-8', 'Fahrenheit 451', 'Dystopian', 5.50, 'yes', 'Ray Bradbury', 'Ballantine Books'),
('978-0-06-231611-0', 'The Silent Patient', 'Thriller', 7.25, 'yes', 'Alex Michaelides', 'Celadon Books'),
('978-0-06-233818-1', 'Educated', 'Memoir', 9.00, 'yes', 'Tara Westover', 'Random House'),
('978-0-7352-2207-2', 'Becoming', 'Memoir', 8.50, 'yes', 'Michelle Obama', 'Crown Publishing Group'),
('978-0-316-49018-6', 'The Night Circus', 'Fantasy', 7.75, 'yes', 'Erin Morgenstern', 'Doubleday'),
('978-1-250-20678-7', 'The Tattooist of Auschwitz', 'Historical Fiction', 8.25, 'yes', 'Heather Morris', 'HarperCollins'),
('978-0-06-284337-5', 'Circe', 'Fantasy', 7.50, 'yes', 'Madeline Miller', 'Little, Brown and Company');
SELECT * FROM books;

UPDATE books SET status = 'No' WHERE isbn in ('978-0-06-112008-4','978-0-06-231611-0','978-0-316-49018-6');

-- Insert values into the IssueStatus table
INSERT INTO IssueStatus VALUES
('IS101', 'C101', 'To Kill a Mockingbird', '2023-05-01', '978-0-06-112008-4'),
('IS102', 'C102', 'The Night Circus', '2023-05-02', '978-0-7352-2207-2'),
('IS103', 'C103', 'Little Fires Everywhere', '2023-05-03', '978-1-5011-9370-0'),
('IS104', 'C104', 'Educated', '2023-05-04', '978-0-06-233818-1'),
('IS105', 'C105', 'Circe', '2023-05-05', '978-0-06-284337-5');
SELECT * FROM IssueStatus;

-- Insert values into the ReturnStatus table
INSERT INTO ReturnStatus VALUES
('RS101', 'C101', 'To Kill a Mockingbird', '2023-06-06', '978-0-06-112008-4'),
('RS102', 'C102', 'The Night Circus', '2023-06-07', '978-0-7352-2207-2'),
('RS103', 'C105', 'Circe', '2023-06-08', '978-0-06-284337-5'),
('RS104', 'C108', 'The Silent Patient', '2023-06-09', '978-0-451-52993-8'),
('RS105', 'C110', 'Little Fires Everywhere', '2023-06-10', '978-1-5011-9370-0');
SELECT * FROM ReturnStatus;

/*QUERIES*/

/* 1. Retrieve the book title, category, and rental price of all available books.*/
SELECT book_title, category, rental_price FROM books WHERE Status = 'Yes';

/* 2.  Find the names and positions of all employees who are Managers and earn more than
 $60,000. Sort the results by salary in descending order.*/
 SELECT emp_name, position, salary
FROM employee
WHERE position = 'Manager' AND salary > 60000
ORDER BY salary DESC;

/* 3. Retrieve the book titles and the corresponding customers who have issued those books.*/
SELECT issuestatus.Issued_book_name, customer.Customer_name FROM issuestatus INNER JOIN
customer on issuestatus.Issued_cust = customer.Customer_Id;

/* 4. Display the total count of books in each category.*/
SELECT Category, COUNT(Book_title) FROM books GROUP BY Category;

/* 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.*/
SELECT emp_name, position FROM employee WHERE Salary > 50000;

/* 6. List the customer names who registered before 2024-10-01 and have not issued any books yet.*/
SELECT customer_name FROM customer WHERE Reg_date < '2024-10-01' AND Customer_Id NOT IN
(SELECT issued_cust FROM issuestatus);

/* 7. Display the names of customers who have issued books in the month of may 2023.*/
SELECT customer.Customer_name FROM customer INNER JOIN issuestatus ON 
customer.Customer_Id = issuestatus.Issued_cust WHERE issuestatus.Issue_date >= '2023-05-01' AND 
issuestatus.Issue_date <= '2023-05-30';

/* 8. List the employee names and their respective salaries in descending order of salary.*/
SELECT emp_name, salary FROM employee ORDER BY Salary DESC;

/* 9. Retrieve book_title from book table containing 'classsic'.*/
SELECT book_title FROM books WHERE Category = 'classic';

/* 10. Retrieve book_title from book table containing 'history'.*/
SELECT book_title FROM books WHERE Category = 'thriller';





 



