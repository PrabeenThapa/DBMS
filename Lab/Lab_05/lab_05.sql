-- Show existing databases
SHOW DATABASES;

-- Create a new database
CREATE DATABASE lab_05;

-- Use the created database
USE lab_05;

-- 1. Create the Emp table with the following fields: (Emp_No, Emp_Name, Designation, Basic, DA, HRA, PF, GrossPay, NetPay)
CREATE TABLE Emp (
    Emp_No INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Designation VARCHAR(50),
    Basic DECIMAL(10, 2),
    DA DECIMAL(10, 2),
    HRA DECIMAL(10, 2),
    PF DECIMAL(10, 2),
    GrossPay DECIMAL(10, 2),
    NetPay DECIMAL(10, 2)
);
SHOW TABLES;
SHOW COLUMNS FROM Emp;

-- 2. Insert Five Records and calculate GrossPay and NetPay
INSERT INTO Emp (Emp_No, Emp_Name, Designation, Basic, DA, HRA, PF, GrossPay, NetPay)
VALUES
(1, 'Ramesh Thapa', 'Manager', 20000.00, 5000.00, 3000.00, 2000.00, 0, 0),
(2, 'Sita Rana', 'Clerk', 15000.00, 4000.00, 2000.00, 1500.00, 0, 0),
(3, 'Hari Shrestha', 'Sales', 18000.00, 4500.00, 2500.00, 1800.00, 0, 0),
(4, 'Gita Gurung', 'Admin', 16000.00, 4200.00, 2200.00, 1600.00, 0, 0),
(5, 'Ram Adhikari', 'HR', 17000.00, 4300.00, 2300.00, 1700.00, 0, 0);

-- Calculate GrossPay and NetPay
UPDATE Emp
SET GrossPay = Basic + DA + HRA,
    NetPay = Basic + DA + HRA - PF
WHERE Basic IS NOT NULL;

-- Display the employee table
SELECT * FROM Emp;

-- 3. Adding column to table and Updating Attributes DA
ALTER TABLE Emp ADD COLUMN NewDA DECIMAL(10, 2);
UPDATE Emp SET NewDA = DA;
SELECT * FROM Emp;

-- 4. Adding column to table and Updating Attributes HRA
ALTER TABLE Emp ADD COLUMN NewHRA DECIMAL(10, 2);
UPDATE Emp SET NewHRA = HRA;
SELECT * FROM Emp;

-- 5. Adding column to table and Updating Attributes PF
ALTER TABLE Emp ADD COLUMN NewPF DECIMAL(10, 2);
UPDATE Emp SET NewPF = PF;
SELECT * FROM Emp;

-- 6. Adding column to table and Updating Attributes Gross Pay
ALTER TABLE Emp ADD COLUMN NewGrossPay DECIMAL(10, 2);
UPDATE Emp SET NewGrossPay = GrossPay;
SELECT * FROM Emp;

-- 7. Adding column to table and Updating Attributes Net Pay
ALTER TABLE Emp ADD COLUMN NewNetPay DECIMAL(10, 2);
UPDATE Emp SET NewNetPay = NetPay;
SELECT * FROM Emp;

-- 8. Display the employee table
SELECT * FROM Emp;

-- 9. Display the employees whose Basic is lowest in each department.
-- Note: Since there's no department field, assuming the question needs basic calculation for all
SELECT Emp_Name, Designation, Basic
FROM Emp
WHERE Basic = (SELECT MIN(Basic) FROM Emp);

-- 10. If NetPay is less than Rs. 10,000 add Rs. 1200 as special allowance
UPDATE Emp
SET NetPay = NetPay + 1200
WHERE NetPay < 10000;
SELECT * FROM Emp;

-- 11. Display the employees whose GrossPay lies between 10,000 & 20,000
SELECT * FROM Emp
WHERE GrossPay BETWEEN 10000 AND 20000;

-- 12. Display all the employees who earn maximum salary
SELECT * FROM Emp
WHERE GrossPay = (SELECT MAX(GrossPay) FROM Emp);
