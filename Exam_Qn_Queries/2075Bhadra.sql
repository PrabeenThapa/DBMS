-- Active: 1721413435893@@127.0.0.1@3306
SHOW DATABASES;
CREATE DATABASE 2075Bhadra;

SHOW DATABASES;

USE 2075Bhadra;

SHOW TABLES;

-- inserting tables
CREATE TABLE Student (
    crn INT PRIMARY KEY,
    name VARCHAR(100),
    address VARCHAR(255),
    phone VARCHAR(15),
    dob DATE
);

CREATE TABLE Course (
    courseid INT PRIMARY KEY,
    crn INT,
    duration INT,
    fee DECIMAL(10, 2),
    FOREIGN KEY (crn) REFERENCES Student(crn)
);

CREATE TABLE Enroll (
    enrolled INT PRIMARY KEY,
    cname VARCHAR(100),
    courseid INT,
    enrolldata DATE,
    completedata DATE,
    FOREIGN KEY (courseid) REFERENCES Course(courseid)
);

-- check the tables
SHOW COLUMNS FROM Student;
SHOW COLUMNS FROM Course;
SHOW COLUMNS FROM Enroll;
-- inserting data
INSERT INTO Student (crn, name, address, phone, dob) VALUES
(1, 'John Doe', '123 Maple St', '555-1234', '2000-05-15'),
(2, 'Jane Smith', '456 Oak Ave', '555-5678', '1999-11-22'),
(3, 'Emily Johnson', '789 Pine Rd', '555-8765', '2001-01-30');

INSERT INTO Course (courseid, crn, duration, fee) VALUES
(101, 1, 12, 300.00),
(102, 2, 6, 150.00),
(103, 3, 8, 200.00);


INSERT INTO Enroll (enrolled, cname, courseid, enrolldata, completedata) VALUES
(1, 'java', 101, '2024-01-10', '2024-03-10'),
(2, 'linux', 102, '2024-02-15', '2024-04-15'),
(3, 'java', 101, '2024-01-20', '2024-03-20'),
(4, 'linux', 102, '2024-02-25', NULL);

-- to truncate if necessary
TRUNCATE TABLE Enroll;

-- Now it's time to have some query
-- i> already done during initialization of table
-- ii> 

SELECT s.crn, s.name, e.enrolldata
FROM Student s
INNER JOIN Course c ON s.crn = c.crn 
INNER JOIN Enroll e ON c.courseid = e.courseid
WHERE e.cname = 'JAVA'

-- iii>

SELECT s.name, s.address
FROM Student s
INNER JOIN Enroll e1 ON s.crn = e1.courseid
INNER JOIN Course c1 ON c1.courseid = e1.courseid
INNER JOIN Enroll e2 ON s.crn = e2.enrolled
INNER JOIN Course c2 ON c2.courseid = e2.courseid
WHERE
e1.courseid = 'JAVA' AND e2.courseid = 'Linux'