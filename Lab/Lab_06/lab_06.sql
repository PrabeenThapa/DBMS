-- Show existing databases
SHOW DATABASES;

-- Create a new database
CREATE DATABASE lab_06;

-- Use the created database
USE lab_06;

-- Step 1: Create the Dept table
CREATE DATABASE EnterpriseDB;
USE EnterpriseDB;

CREATE TABLE Dept (
    deptno INT PRIMARY KEY,
    dname VARCHAR(50),
    loc VARCHAR(50)
);
SHOW TABLES;
SHOW COLUMNS FROM Dept;

-- Step 2: Create the Emp table
CREATE TABLE Emp (
    empno INT PRIMARY KEY,
    ename VARCHAR(50),
    job VARCHAR(50),
    mgr INT,
    hiredate DATE,
    sal DECIMAL(10, 2),
    comm DECIMAL(10, 2),
    deptno INT,
    FOREIGN KEY (deptno) REFERENCES Dept(deptno),
    FOREIGN KEY (mgr) REFERENCES Emp(empno)
);
SHOW TABLES;
SHOW COLUMNS FROM Emp;

-- Step 3: Insert data into Dept and Emp tables

-- Inserting data into Dept table
INSERT INTO Dept (deptno, dname, loc)
VALUES
(10, 'Human Resources', 'Kathmandu'),
(20, 'Finance', 'Pokhara'),
(30, 'Information Technology', 'Biratnagar'),
(40, 'Marketing', 'Lalitpur');

-- Inserting data into Emp table
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES
(1, 'Sanjay Sharma', 'Manager', NULL, '1990-01-15', 90000.00, 5000.00, 10),
(2, 'Poonam Rai', 'Assistant Manager', 1, '2000-03-22', 60000.00, 3000.00, 20),
(3, 'Rajesh Thapa', 'Senior Developer', 1, '1995-05-10', 80000.00, 4000.00, 30),
(4, 'Anita Koirala', 'Developer', 3, '2010-07-30', 70000.00, 3500.00, 30),
(5, 'Rita Joshi', 'Marketing Specialist', 1, '2005-09-25', 75000.00, 2500.00, 40),
(6, 'Deepak Adhikari', 'Finance Analyst', 2, '2015-11-12', 65000.00, 2000.00, 20);

-- Step 4: Update the employee salary by 15%, whose experience is greater than 30 years
UPDATE Emp
SET sal = sal * 1.15
WHERE YEAR(CURDATE()) - YEAR(hiredate) > 30;

-- Step 5: Delete the employees, who completed 30 years of service
DELETE FROM Emp
WHERE YEAR(CURDATE()) - YEAR(hiredate) >= 30;

-- Step 6: Display the manager who is having maximum number of employees working under him
SELECT mgr, COUNT(*) AS num_employees
FROM Emp
GROUP BY mgr
ORDER BY num_employees DESC
LIMIT 1;

-- Step 7: Create a view, which contains employee names and their manager
CREATE VIEW EmployeeManager AS
SELECT e1.ename AS Employee_Name, e2.ename AS Manager_Name
FROM Emp e1
LEFT JOIN Emp e2 ON e1.mgr = e2.empno;

-- Display the view
SELECT * FROM EmployeeManager;
