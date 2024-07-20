-- Show existing databases
SHOW DATABASES;

-- Create a new database
CREATE DATABASE lab_02;

-- Use the created database
USE lab_02;

-- Show existing tables
SHOW TABLES;

-- 1. create a client master table with attributes
CREATE TABLE Client_Master (
    ClientNO VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(50),
    Address VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    bal_due DECIMAL(10, 2)
);

-- Check if the table is created
SHOW TABLES;

-- See the structure of the table
SHOW COLUMNS FROM Client_Master;

-- 2. insert five records into the Client_Master
INSERT INTO Client_Master (ClientNO, Name, Address, City, State, bal_due)
VALUES
('C101', 'Nabin Shrestha', 'Kathmandu-1', 'Kathmandu', 'Bagmati', 3000.00),
('C102', 'Sanjay Rana', 'Lalitpur-2', 'Lalitpur', 'Bagmati', 4500.00),
('C103', 'Bina Lama', 'Bhaktapur-3', 'Bhaktapur', 'Bagmati', 5500.00),
('C104', 'Anita Thapa', 'Pokhara-4', 'Pokhara', 'Gandaki', 6000.00),
('C105', 'Keshav Adhikari', 'Chitwan-5', 'Chitwan', 'Bagmati', 7000.00);

-- 3. Display Client Master Table
SELECT * FROM Client_Master;

-- 4. Find the name of Clients whose balance_due >5000
SELECT Name FROM Client_Master WHERE bal_due > 5000;

-- 5. Change the bal_due of ClientNO “C123” to Rs. 5100
UPDATE Client_Master SET bal_due = 5100 WHERE ClientNO = 'C103';

-- 6. Change the name of Client_Master to Client12
ALTER TABLE Client_Master RENAME TO Client12;

SHOW TABLES;

--7. Display the bal_due heading as “BALANCE” in the Client12 table
SELECT ClientNO, Name, Address, City, State, bal_due AS BALANCE FROM Client12;
