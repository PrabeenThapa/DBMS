-- Show existing databases
SHOW DATABASES;

-- Create a new database
CREATE DATABASE lab_04;

-- Use the created database
USE lab_04;

--1. Create the Sales table
CREATE TABLE Sales (
    Sales_No INT PRIMARY KEY,
    Sales_Name VARCHAR(50),
    Branch VARCHAR(50),
    Sales_Amount DECIMAL(10, 2),
    DOB DATE
);

--2. Insert 5 records
INSERT INTO Sales (Sales_No, Sales_Name, Branch, Sales_Amount, DOB)
VALUES
(1, 'Ramesh Thapa', 'Kathmandu', 10000.00, '1990-12-15'),
(2, 'Sita Rana', 'Lalitpur', 15000.00, '1985-07-10'),
(3, 'Hari Shrestha', 'Bhaktapur', 20000.00, '1992-12-05'),
(4, 'Gita Gurung', 'Pokhara', 25000.00, '1988-03-20'),
(5, 'Ram Adhikari', 'Kathmandu', 18000.00, '1991-12-25');

SELECT * FROM Sales;

--3. Calculate total Sales_Amount in each branch
SELECT Branch, SUM(Sales_Amount) AS Total_Sales_Amount
FROM Sales
GROUP BY Branch;

--4. Calculate average Sales_Amount in each branch
SELECT Branch, AVG(Sales_Amount) AS Average_Sales_Amount
FROM Sales
GROUP BY Branch;

--5. Display all the salesmen, DOB who are born in the month of December as day in character format i.e. 21-Dec-09
SELECT Sales_Name, DATE_FORMAT(DOB, '%d-%b-%y') AS DOB
FROM Sales
WHERE MONTH(DOB) = 12;

--6. Display the name and DOB of salesmen in alphabetical order of the month
SELECT Sales_Name, DOB
FROM Sales
ORDER BY MONTH(DOB), DAY(DOB);
