-- 1.) second-highest salary from the Employees

SELECT MAX(Salary) AS SecondMaxSalary
FROM Employees
WHERE Salary < (SELECT MAX(Salary) FROM Employees);

-- or

SELECT Salary
FROM Employees
ORDER BY Salary DESC
LIMIT 1 OFFSET 1;

-- LIMIT 1: This limits the result to one row.
-- OFFSET 1: This skips the first row (which is the highest salary), effectively returning the second-highest salary.


-- 2.) Query to Delete Duplicate name of the employee
-- Given Employees Table
+------------+--------------+------------+--------+-----------+
| EmployeeID | EmployeeName | Department | Salary | ManagerID |
+------------+--------------+------------+--------+-----------+
|      1     |     John     |     HR     | 60000  |    NULL   |
|      2     |    Alice     |     IT     | 50000  |     1     |
|      3     |    Alice     |     HR     | 55000  |     2     |
|      4     |     Bob      |     IT     | 70000  |     1     |
|      5     |   Charlie    |     IT     | 80000  |     2     |
+------------+--------------+------------+--------+-----------+


DELETE FROM Employees
WHERE EmployeeID NOT IN (
    SELECT MIN(EmployeeID)
    FROM Employees
    GROUP BY EmployeeName
);

-- 3.)  Find Departments with Total Salary Greater Than a Certain Amount
-- Tables:
-- Employees(EmployeeID, EmployeeName, Department, Salary)
-- Departments(DepartmentID, DepartmentName)

SELECT D.DepartmentName, SUM(E.Salary) AS TotalSalary
FROM Employees E
JOIN Departments D ON E.Department = D.DepartmentID
GROUP BY D.DepartmentName
HAVING SUM(E.Salary) > 100000;


-- 4. Count the number of employees in each department and only show departments with more than 2 employees.
-- Employees(EmployeeID, EmployeeName, Department, Salary)
SELECT E.Department, COUNT(*) AS NumberOfEmployees
FROM Employees E
GROUP BY E.Department
HAVING COUNT(*) > 2;

+------------+--------------+--------+------------+
| EmployeeID | EmployeeName | Salary | Department |
+------------+--------------+--------+------------+
|      1     | John         | 60000  | HR         |
|      2     | Alice        | 50000  | IT         |
|      3     | Bob          | 55000  | HR         |
|      4     | Charlie      | 80000  | IT         |
+------------+--------------+--------+------------+

-- 5.)Find Employees with Salaries Above Average in Their Department
-- Get the names and salaries of employees whose salary is above the average salary of their respective departments.

-- Employees with Salaries Above Average in Their Department
-- correct answer and approach
SELECT E1.EmployeeName, E1.Salary, E1.Department
FROM Employees E1
WHERE E1.Salary > (
    SELECT AVG(E2.Salary)
    FROM Employees E2
    WHERE E1.Department = E2.Department
);

-- For John (HR)
-- Department: HR
-- Average Salary in HR: (60000 + 55000) / 2 = 57500
-- Comparison: 60000 > 57500 (True)

-- For Bob (HR)
-- Department: HR
-- Average Salary in HR: (60000 + 55000) / 2 = 57500
-- Comparison: 55000 > 57500 (False)

-- For Alice (IT)
-- Department: IT
-- Average Salary in IT: (50000 + 80000) / 2 = 65000
-- Comparison: 50000 > 65000 (False)

-- etc...


-- Not same as below query gives
-- Employees with Salaries Above Overall Average Salary
SELECT EmployeeName, Salary, Department
FROM Employees
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees
);

-- Overall Average Salary:
-- (60000 + 50000 + 55000 + 80000) / 4 = 61250

-- For John (60000)
-- Comparison: 60000 > 61250 (False)

-- For Alice (50000)
-- Comparison: 50000 > 61250 (False) like this ....


+------------+--------------+------------+--------+-----------+
| EmployeeID | EmployeeName | Department | Salary | ManagerID |
+------------+--------------+------------+--------+-----------+
|     1      |     John     |     HR     | 60000  |   NULL    |
|     2      |    Alice     |     IT     | 50000  |     1     |
|     3      |      Bob     |     HR     | 55000  |     1     |
|     4      |   Charlie    |     IT     | 80000  |     2     |
|     5      |    David     |     HR     | 60000  |     2     |
+------------+--------------+------------+--------+-----------+

-- 6.) Find Departments with More Than One Manager
-- Question: List departments that have more than one unique manager.

SELECT E.Department, COUNT(DISTINCT E.ManagerID) AS NumberOfManagers
FROM Employees E
GROUP BY E.Department
HAVING COUNT(DISTINCT E.ManagerID) > 1;


-- 7.) Retrieve Employees and Their Departments with Specific Criteria
-- Question: Get the names of employees and their departments for those earning more than 50,000 in the IT department.
-- Tables:
-- Employees(EmployeeID, EmployeeName, Department, Salary)
-- Departments(DepartmentID, DepartmentName)

SELECT E.EmployeeName, D.DepartmentName
FROM Employees E
JOIN Departments D ON E.Department = D.DepartmentID
WHERE E.Salary > 50000 AND D.DepartmentName = 'IT';


+-------------+---------------+------------+--------+-----------+
| EmployeeID  | EmployeeName  | Department | Salary | ManagerID |
+-------------+---------------+------------+--------+-----------+
|      1      | John          | HR         | 60000  |    NULL   |
|      2      | Alice         | IT         | 50000  |     1     |
|      3      | Alice         | HR         | 55000  |     2     |
|      4      | Bob           | IT         | 70000  |     1     |
|      5      | Charlie       | IT         | 80000  |     2     |
+-------------+---------------+------------+--------+-----------+


--8.)  Find the average salary of each department.

SELECT Department, AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY Department;

--9.) List all employees who earn more than the average salary in their department.

-- Employees Earning More Than the Average in Their Department
SELECT E1.EmployeeName, E1.Salary, E1.Department
FROM Employees E1
WHERE E1.Salary > (
    SELECT AVG(E2.Salary)
    FROM Employees E2
    WHERE E1.Department = E2.Department
);

--   both are not same as below compare for overall average : Employees Earning More Than the Overall Average Salary

SELECT E1.EmployeeName, E1.Salary, E1.Department
FROM Employees E1
WHERE E1.Salary > (
    SELECT AVG(Salary)
    FROM Employees
);

--10.) Count the number of employees in each department.

SELECT Department, COUNT(*) AS NumberOfEmployees
FROM Employees
GROUP BY Department;

-- 11.) Find employees with the same name but different salaries.

-- <> means not equal in sql
SELECT E1.EmployeeName, E1.Salary
FROM Employees E1
JOIN Employees E2 ON E1.EmployeeName = E2.EmployeeName
WHERE E1.EmployeeID <> E2.EmployeeID AND E1.Salary <> E2.Salary;

-- 12.) List the employees with the highest salary in each department.
-- note imp.
-- When using aggregate functions like MAX() in conjunction with other columns (like EmployeeName in your case),
-- you need to ensure that all selected columns are either part of an aggregate function or included in the GROUP BY clause.
SELECT EmployeeName, Salary, Department
FROM Employees
WHERE (Department, Salary) IN (
    SELECT Department, MAX(Salary)
    FROM Employees
    GROUP BY Department
);

+--------------+--------+------------+
| EmployeeName | Salary | Department |
+--------------+--------+------------+
| John         | 60000  | HR         |
| Charlie      | 80000  | IT         |
+--------------+--------+------------+

-- 13.) Find departments that have more than two employees.

SELECT Department
FROM Employees
GROUP BY Department
HAVING COUNT(*) > 2;
