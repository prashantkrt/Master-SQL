-- Question 1: second-highest salary from the Employees

SELECT MAX(Salary) AS SecondMaxSalary
FROM Employees
WHERE Salary < (SELECT MAX(Salary) FROM Employees);

-- or -- only salary

SELECT Salary
FROM Employees
ORDER BY Salary DESC
LIMIT 1 OFFSET 1; -- when LIMIT is used with a single parameter, it specifies only the count of rows to return.

-- or -- when want all the entry data

SELECT * FROM EMPLOYEE
GROUP BY SALARY
ORDER BY SALARY DESC
LIMIT 1,1;  -- LIMIT offset, count
-- LIMIT offset, count => the offset is 1, and the count is 1
--when LIMIT is used with a single parameter, it specifies only the count of rows to return.

-- LIMIT 1: This limits the result to one row.
-- OFFSET 1: This skips the first row (which is the highest salary), effectively returning the second-highest salary.


-- Question 2: Query to Delete Duplicate name of the employee
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

-- Question 3: Find Departments with Total Salary Greater Than a Certain Amount
-- Tables:
-- Employees(EmployeeID, EmployeeName, Department, Salary)
-- Departments(DepartmentID, DepartmentName)

SELECT D.DepartmentName, SUM(E.Salary) AS TotalSalary
FROM Employees E
JOIN Departments D ON E.Department = D.DepartmentID
GROUP BY D.DepartmentName
HAVING SUM(E.Salary) > 100000;


-- Question 4: Count the number of employees in each department and only show departments with more than 2 employees.
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

-- Question 5: Find Employees with Salaries Above Average in Their Department
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

-- Question 6: Find Departments with More Than One Manager
-- Question: List departments that have more than one unique manager.

SELECT E.Department, COUNT(DISTINCT E.ManagerID) AS NumberOfManagers
FROM Employees E
GROUP BY E.Department
HAVING COUNT(DISTINCT E.ManagerID) > 1;


-- Question 7: Retrieve Employees and Their Departments with Specific Criteria
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


--Question 8:  Find the average salary of each department.

SELECT Department, AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY Department;

--Question 9:List all employees who earn more than the average salary in their department.

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

--Question 10: Count the number of employees in each department.

SELECT Department, COUNT(*) AS NumberOfEmployees
FROM Employees
GROUP BY Department;

-- Question 11: Find employees with the same name but different salaries.

-- <> means not equal in sql
SELECT E1.EmployeeName, E1.Salary
FROM Employees E1
JOIN Employees E2 ON E1.EmployeeName = E2.EmployeeName
WHERE E1.EmployeeID <> E2.EmployeeID AND E1.Salary <> E2.Salary;

-- Question 12: List the employees with the highest salary in each department.
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

-- output :
+--------------+--------+------------+
| EmployeeName | Salary | Department |
+--------------+--------+------------+
| John         | 60000  | HR         |
| Charlie      | 80000  | IT         |
+--------------+--------+------------+


-- Question 13: Find departments that have more than two employees.

SELECT Department
FROM Employees
GROUP BY Department
HAVING COUNT(*) > 2;


+------------+--------------+-------------+--------+
| EmployeeID | EmployeeName | DepartmentID| Salary |
+------------+--------------+-------------+--------+
|     1      |     John     |      1      | 60000  |
|     2      |    Alice     |      2      | 50000  |
|     3      |      Bob     |      1      | 55000  |
|     4      |   Charlie    |      2      | 80000  |
|     5      |    David     |      3      | 60000  |
+------------+--------------+-------------+--------+

-- Question 14: Find Departments with More Than One Employee

SELECT DepartmentID, COUNT(*) AS NumberOfEmployees
FROM Employees
GROUP BY DepartmentID
HAVING COUNT(*) > 1;

+------------+--------------+-------------+--------+
| EmployeeID | EmployeeName | DepartmentID| Salary |
+------------+--------------+-------------+--------+
|     1      |     John     |      1      | 60000  |
|     2      |    Alice     |      2      | 50000  |
|     3      |      Bob     |      1      | 55000  |
|     4      |   Charlie    |      2      | 80000  |
|     5      |    David     |      3      | 60000  |
+------------+--------------+-------------+--------+

-- Question 15: Write a SQL query to find departments with an average salary greater than 55000.

SELECT DepartmentID, AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY DepartmentID
HAVING AVG(Salary) > 55000;

+------------+--------------+-------------+--------+-----------+
| EmployeeID | EmployeeName | DepartmentID| Salary | ManagerID |
+------------+--------------+-------------+--------+-----------+
|     1      |     John     |      1      | 60000  |   NULL    |
|     2      |    Alice     |      2      | 50000  |     1     |
|     3      |      Bob     |      1      | 55000  |     1     |
|     4      |   Charlie    |      2      | 80000  |     1     |
|     5      |    David     |      3      | 60000  |     2     |
+------------+--------------+-------------+--------+-----------+


-- Question 16: Write a SQL query to find managers who have more than one subordinate.

SELECT ManagerID, COUNT(*) AS NumberOfSubordinates
FROM Employees
WHERE ManagerID IS NOT NULL
GROUP BY ManagerID
HAVING COUNT(*) > 1;

-- or both are same

SELECT ManagerID, COUNT(*) AS NumberOfSubordinates
FROM Employees
GROUP BY ManagerID
HAVING COUNT(*) > 1;



Table: Customers
+------------+--------------+
| CustomerID | CustomerName |
+------------+--------------+
|     1      |     Alice    |
|     2      |      Bob     |
|     3      |   Charlie    |
+------------+--------------+

Table: Orders
+---------+------------+-------------+
| OrderID | CustomerID | TotalAmount |
+---------+------------+-------------+
|    1    |     1      |     100     |
|    2    |     2      |     200     |
|    3    |     1      |     300     |
|    4    |     3      |     150     |
|    5    |     2      |     50      |
+---------+------------+-------------+

-- Question 17: Write a SQL query to count the number of orders per customer and show only customers with more than one order.

SELECT C.CustomerID, C.CustomerName, COUNT(O.OrderID) AS NumberOfOrders
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, C.CustomerName
HAVING COUNT(O.OrderID) > 1;

Employees
+------------+--------------+-------------+--------+
| EmployeeID | EmployeeName | DepartmentID| Salary |
+------------+--------------+-------------+--------+
|     1      |     John     |      1      | 60000  |
|     2      |    Alice     |      2      | 50000  |
|     3      |      Bob     |      1      | 55000  |
|     4      |   Charlie    |      2      | 80000  |
|     5      |    David     |      3      | 60000  |
+------------+--------------+-------------+--------+

Departments
+-------------+-----------------+
| DepartmentID| DepartmentName  |
+-------------+-----------------+
|      1      |       HR        |
|      2      |       IT        |
|      3      |   Marketing     |
+-------------+-----------------+

-- Question: List all employees along with their respective department names.
SELECT E.EmployeeName, D.DepartmentName
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.DepartmentID;

-- Question: Find the number of employees in each department.
SELECT D.DepartmentName, COUNT(E.EmployeeID) AS NumberOfEmployees
FROM Departments D
LEFT JOIN Employees E ON D.DepartmentID = E.DepartmentID
GROUP BY D.DepartmentName;

-- Question: Find all employees who have the same salary as at least one other employee.
SELECT E1.EmployeeName, E1.Salary
FROM Employees E1
JOIN Employees E2 ON E1.Salary = E2.Salary AND E1.EmployeeID <> E2.EmployeeID;


+------------+--------------+-------------+--------+------------+
| EmployeeID | EmployeeName | DepartmentID| Salary | ManagerID  |
+------------+--------------+-------------+--------+------------+
|     1      |     John     |      1      | 60000  |   NULL     |  -- No manager (Top-level)
|     2      |    Alice     |      2      | 50000  |      1     |  -- Managed by John
|     3      |      Bob     |      1      | 55000  |      1     |  -- Managed by John
|     4      |   Charlie    |      2      | 80000  |      1     |  -- Managed by John
|     5      |    David     |      3      | 60000  |      2     |  -- Managed by Alice
|     6      |     Eve      |      2      | 70000  |      2     |  -- Managed by Alice
+------------+--------------+-------------+--------+------------+

-- Question: List employees who earn more than their manager.
SELECT E1.EmployeeName, E1.Salary, E2.EmployeeName AS ManagerName
FROM Employees E1
JOIN Employees E2 ON E1.ManagerID = E2.EmployeeID
WHERE E1.Salary > E2.Salary;






