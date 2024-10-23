-- The UNION operator in SQL is used to combine the results of two or more SELECT statements into a single result set.
-- The UNION operator removes duplicate rows from the combined result set, while UNION ALL includes all rows, including duplicates.

-- Union Removes Duplicate while Union All include all with duplicates also


-- Requirements
-- Each SELECT statement within the UNION must have the same number of columns.
-- The columns must have similar data types.
-- The columns in each SELECT statement are matched by their position.

-- Employees Table
+------------+--------------+
| EmployeeID | EmployeeName |
+------------+--------------+
| 1          | John         |
| 2          | Jane         |
| 3          | Alice        |
| 4          | John         |  -- Duplicate name
+------------+--------------+


-- Contractor Table
+--------------+-----------------+
| ContractorID | ContractorName  |
+--------------+-----------------+
| 1            | Bob             |
| 2            | Charlie         |
| 3            | Jane            |  -- Duplicate name from Employees
+--------------+-----------------+


-- Using UNION: To get a combined list of all employees and contractors (without duplicates):
SELECT EmployeeName AS Name FROM Employees
UNION
SELECT ContractorName AS Name FROM Contractors;

--answer
+------------+
| Name       |
+------------+
| John       |
| Jane       |
| Alice      |
| Bob        |
| Charlie    |
+------------+


SELECT EmployeeName AS Name FROM Employees
UNION ALL
SELECT ContractorName AS Name FROM Contractors;

+------------+
| Name       |
+------------+
| John       |
| Jane       |
| Alice      |
| John       |  -- Duplicate from Employees
| Bob        |
| Charlie    |
| Jane       |  -- Duplicate from Contractors
+------------+


