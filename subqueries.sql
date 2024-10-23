-- Employee Table
+-------------+---------------+-------------+--------+-----------+
| EmployeeID  | EmployeeName   | Department  | Salary | ManagerID |
+-------------+---------------+-------------+--------+-----------+
|      1      | John           | HR          | 60000  |    NULL   |
|      2      | Jane           | IT          | 70000  |      1    |
|      3      | Alice          | IT          | 50000  |      1    |
|      4      | Bob            | HR          | 55000  |      2    |
|      5      | Charlie        | IT          | 80000  |      2    |
+-------------+---------------+-------------+--------+-----------+

-- Department Table
+--------------+----------------+--------+
| DepartmentID | DepartmentName  | Budget|
+--------------+----------------+--------+
|      1       | HR             | 500000 |
|      2       | IT             | 700000 |
|      3       | Marketing      | 300000 |
+--------------+----------------+--------+


-- Find employees whose salary is higher than the average salary of all employees.

SELECT EmployeeName, Salary
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);


-- Find employees who work in departments with a budget greater than 600000.
SELECT EmployeeName, Department
FROM Employees
WHERE Department IN (SELECT DepartmentName
                     FROM Departments
                     WHERE Budget > 600000);

-- Find departments that have employees.
SELECT DepartmentName
FROM Departments D
WHERE EXISTS (SELECT *
              FROM Employees E
              WHERE D.DepartmentName = E.Department);



