-- Show existing databases
SHOW DATABASES;

-- Create a new database
CREATE DATABASE lab_07;

-- Use the created database
USE lab_07;

-- a) Determine the names of employees who earn more than their managers
SELECT e1.ename AS Employee_Name, e2.ename AS Manager_Name
FROM Emp e1
JOIN Emp e2 ON e1.mgr = e2.empno
WHERE e1.sal > e2.sal;

-- b) Determine the names of employees who take the highest salary in their departments
SELECT e1.ename AS Employee_Name, e1.deptno, e1.sal
FROM Emp e1
JOIN (
    SELECT deptno, MAX(sal) AS max_sal
    FROM Emp
    GROUP BY deptno
) e2 ON e1.deptno = e2.deptno AND e1.sal = e2.max_sal;

-- c) Determine the employees who are located at the same place
SELECT e1.ename AS Employee1, e2.ename AS Employee2, d.loc
FROM Emp e1
JOIN Emp e2 ON e1.deptno = e2.deptno AND e1.empno <> e2.empno
JOIN Dept d ON e1.deptno = d.deptno
GROUP BY e1.ename, e2.ename, d.loc;

-- d) Determine the employees whose total salary is like the minimum salary of any department
SELECT e1.ename, e1.sal
FROM Emp e1
JOIN (
    SELECT deptno, MIN(sal) AS min_sal
    FROM Emp
    GROUP BY deptno
) e2 ON e1.deptno = e2.deptno AND e1.sal = e2.min_sal;

-- e) Determine the department which does not contain any employees
SELECT d.dname, d.loc
FROM Dept d
LEFT JOIN Emp e ON d.deptno = e.deptno
WHERE e.deptno IS NULL;
