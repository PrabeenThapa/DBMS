SHOW DATABASES;

CREATE DATABASE lab_01;

USE lab_01;

SHOW TABLES;

-- 1. Creating an Employees table

CREATE TABLE EMPLOYEES (
    Employee_Id INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Email VARCHAR(100),
    Phone_Number VARCHAR(20),
    Hire_Date DATE,
    Job_Id VARCHAR(10),
    Salary DECIMAL(10, 2),
    Commission_Pct DECIMAL(4, 2),
    Manager_Id INT,
    Department_Id INT
);

-- to check whether the table is created or not
SHOW TABLES;

-- to see the structure of table
SHOW COLUMNS FROM EMPLOYEES;

-- 2. inserting five records into table
INSERT INTO EMPLOYEES (Employee_Id, First_Name, Last_Name, Email, Phone_Number, Hire_Date, Job_Id, Salary, Commission_Pct, Manager_Id, Department_Id)
VALUES
(1, 'Ram', 'Shrestha', 'ram.shrestha@example.com', '9800000001', '2020-01-15', 'DEV01', 5000.00, 0.05, 101, 60),
(2, 'Sita', 'Rana', 'sita.rana@example.com', '9800000002', '2019-03-22', 'DEV02', 4800.00, 0.04, 102, 70),
(3, 'Hari', 'Lama', 'hari.lama@example.com', '9800000003', '2018-05-10', 'DEV03', 4500.00, 0.03, 103, 80),
(4, 'Gita', 'Austin', 'gita.austin@example.com', '9800000004', '2021-07-30', 'DEV04', 5200.00, 0.06, 104, 70),
(5, 'Kiran', 'Thapa', 'kiran.thapa@example.com', '9800000005', '2017-09-25', 'DEV05', 4700.00, 0.02, 105, 60);

-- 3. Display the table EMPLOYEES
SELECT * FROM EMPLOYEES;

-- 4. Find out the employee id, names, salaries of all the employees
SELECT Employee_Id, First_Name, Last_Name, Salary FROM EMPLOYEES;

-- 5. Find the names of the employees who have a salary greater than or equal to 4800
SELECT First_Name, Last_Name FROM EMPLOYEES WHERE Salary >= 4800;

-- 6. List out the employees whose last name is ‘AUSTIN’
SELECT * FROM EMPLOYEES WHERE Last_Name = 'Austin';

-- 7. Find the names of the employees who works in departments 60,70 and 80
SELECT First_Name, Last_Name FROM EMPLOYEES WHERE Department_Id IN (60, 70, 80);

-- 8. Display the unique Manager_Id from employees table
SELECT DISTINCT Manager_Id FROM EMPLOYEES;
