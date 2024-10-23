-- A self join is a type of join in SQL where a table is joined with itself.
-- This is useful when you want to compare rows within the same table or to establish a hierarchical relationship among records.

CREATE TABLE Employees (
   EmployeeID INT PRIMARY KEY,
   EmployeeName VARCHAR(50),
   ManagerID INT
);
INSERT INTO Employees (EmployeeID, EmployeeName, ManagerID) VALUES
(1, 'John', NULL),
(2, 'Jane', 1),
(3, 'Alice', 1),
(4, 'Bob', 2),
(5, 'Charlie', 2);

+------------+--------------+-----------+
| EmployeeID | EmployeeName | ManagerID |
+------------+--------------+-----------+
| 1          | John         | NULL      |
| 2          | Jane         | 1         |
| 3          | Alice        | 1         |
| 4          | Bob          | 2         |
| 5          | Charlie      | 2         |
+------------+--------------+-----------+

-- Self Join Query
-- To find each employee along with their manager’s name, you can use a self join like this:
SELECT
    e.EmployeeID,
    e.EmployeeName AS Employee,
    m.EmployeeName AS Manager
FROM
    Employees e
        JOIN                 /*we can use Join By Default(Inner Join)  , Left Join*/
    Employees m ON e.ManagerID = m.EmployeeID;

+------------+----------+---------+
| EmployeeID | Employee | Manager |
+------------+----------+---------+
| 1          | John     | NULL    |
| 2          | Jane     | John    |
| 3          | Alice    | John    |
| 4          | Bob      | Jane    |
| 5          | Charlie  | Jane    |
+------------+----------+---------+



