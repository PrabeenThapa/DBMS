-- Show existing databases
SHOW DATABASES;

-- Create a new database
CREATE DATABASE lab_03;

-- Use the created database
USE lab_03;

--1. Create the Teacher table
CREATE TABLE Teacher (
    Id INT PRIMARY KEY,
    Name VARCHAR(50),
    DeptNo INT,
    Date_of_joining DATE,
    DeptName VARCHAR(50),
    Location VARCHAR(100),
    Salary DECIMAL(10, 2)
);

-- Check if the table is created
SHOW TABLES;

-- 2. Insert 5 records 
INSERT INTO Teacher (Id, Name, DeptNo, Date_of_joining, DeptName, Location, Salary)
VALUES
(1, 'Bishal Sharma', 101, '2015-06-01', 'Mathematics', 'Kathmandu', 40000.00),
(2, 'Sanjay Adhikari', 102, '2016-07-15', 'Commerce', 'Lalitpur', 35000.00),
(3, 'Rita Gurung', 103, '2017-08-10', 'Science', 'Bhaktapur', 45000.00),
(4, 'Sunita Koirala', 101, '2018-09-05', 'Mathematics', 'Pokhara', 42000.00),
(5, 'Prakash Thapa', 102, '2019-10-20', 'Commerce', 'Chitwan', 37000.00);

-- See the structure of the table
SHOW COLUMNS FROM Teacher;

--3. Give Increment of 25% salary for Mathematics Department.
START TRANSACTION;
UPDATE Teacher
SET Salary = Salary * 1.25
WHERE DeptName = 'Mathematics';
SELECT * FROM Teacher WHERE DeptName = 'Mathematics';

--4. Perform Rollback command
ROLLBACK;
SELECT * FROM Teacher WHERE DeptName = 'Mathematics';

--5. Give Increment of 15% salary for Commerce Department
START TRANSACTION;
UPDATE Teacher
SET Salary = Salary * 1.15
WHERE DeptName = 'Commerce';
SELECT * FROM Teacher WHERE DeptName = 'Commerce';

--6. Perform commit command
COMMIT;
SELECT * FROM Teacher WHERE DeptName = 'Commerce';
