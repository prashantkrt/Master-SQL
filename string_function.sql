-- Sample Employee Table
-- Assume we have an Employee table with the following structure:

CREATE TABLE Employees (
   EmployeeID INT PRIMARY KEY,
   FirstName VARCHAR(50),
   LastName VARCHAR(50),
   Email VARCHAR(100),
   Department VARCHAR(50)
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, Department) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', 'Sales'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', 'Marketing'),
(3, 'Alice', 'Johnson', 'alice.j@example.com', 'IT'),
(4, 'Bob', 'Brown', 'bob.brown@example.com', 'HR');


+------------+-----------+----------+-------------------------+-------------+
| EmployeeID | FirstName | LastName | Email                   | Department  |
+------------+-----------+----------+-------------------------+-------------+
| 1          | John      | Doe      | john.doe@example.com    | Sales       |
| 2          | Jane      | Smith    | jane.smith@example.com  | Marketing   |
| 3          | Alice     | Johnson  | alice.j@example.com     | IT          |
| 4          | Bob       | Brown    | bob.brown@example.com   | HR          |
+------------+-----------+----------+-------------------------+-------------+


-- CONCAT
-- Concatenates two or more strings together.
-- Example: Concatenate First and Last Names
SELECT EmployeeID, CONCAT(FirstName, ' ', LastName) AS FullName
FROM Employee;

-- LENGTH
-- Returns the length of a string.
-- Example: Get Length of Last Names
SELECT EmployeeID, LastName, LENGTH(LastName) AS LastNameLength
FROM Employee;

-- LOWER
-- Converts a string to lower case.
-- Example: Convert Emails to Lower Case
SELECT EmployeeID, LOWER(Email) AS LowerEmail
FROM Employee;

-- UPPER
-- Converts a string to upper case.
-- Example: Convert First Names to Upper Case
SELECT EmployeeID, UPPER(FirstName) AS UpperFirstName
FROM Employee;

-- SUBSTRING
-- Extracts a substring from a string.
-- Example: Get the First Three Characters of First Names
SELECT EmployeeID, FirstName, SUBSTRING(FirstName, 1, 3) AS ShortFirstName
FROM Employee;

-- REPLACE
-- Replaces occurrences of a substring within a string.
-- Example: Replace Domain in Emails
SELECT EmployeeID, Email, REPLACE(Email, '@example.com', '@company.com') AS UpdatedEmail
FROM Employee;

-- TRIM
-- Removes leading and trailing spaces from a string.
-- Example: Trim Spaces from First Names
SELECT EmployeeID, TRIM(FirstName) AS TrimmedFirstName
FROM Employee;
