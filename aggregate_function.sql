-- COUNT(): Counts the number of rows that match a specified condition.
-- SUM(): Calculates the total sum of a numeric column.
-- AVG(): Computes the average value of a numeric column.
-- MAX(): Finds the maximum value in a set.
-- MIN(): Finds the minimum value in a set.

-- Let's consider a sample Employees table with the following structure:

EmployeeID	Name	Department	Salary	JoiningDate
        1	Alice	  HR	    60000	2020-01-15
        2	Bob	      IT	    70000	2019-03-20
        3	Charlie	  HR	    50000	2021-07-10
        4	David	  IT	    80000	2018-09-05
        5	Eve	      Marketing	75000	2019-11-15

-- COUNT()

-- Count the total number of employees:
SELECT COUNT(*) AS TotalEmployees FROM Employees;

-- Count the number of employees in each department:
SELECT Department, COUNT(*) AS NumberOfEmployees
FROM Employees
GROUP BY Department;

-- Department	NumberOfEmployees
-- HR	        2
-- IT	        2
-- Marketing	1


-- SUM()

-- Calculate the total salary of all employees:
SELECT SUM(Salary) AS TotalSalary FROM Employees;

-- Calculate the total salary in each department:
SELECT Department, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY Department;

-- Department	TotalSalary
-- HR	         110000
-- IT	         150000
-- Marketing	 75000

-- AVG()

-- Find the average salary of all employees:
SELECT AVG(Salary) AS AverageSalary FROM Employees;

-- Find the average salary in each department:
SELECT Department, AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY Department;

-- Department	AverageSalary
-- HR	        55000
-- IT	        75000
-- Marketing	75000

-- MAX()
-- Find the highest salary among all employees:
SELECT MAX(Salary) AS HighestSalary FROM Employees;

-- Find the highest salary in each department:
SELECT Department, MAX(Salary) AS HighestSalary
FROM Employees
GROUP BY Department;

-- Department	HighestSalary
-- HR       	60000
-- IT	        80000
-- Marketing	75000

-- MIN()
-- Find the lowest salary among all employees:
SELECT MIN(Salary) AS LowestSalary FROM Employees;

-- Find the lowest salary in each department:
SELECT Department, MIN(Salary) AS LowestSalary
FROM Employees
GROUP BY Department;

-- Department	LowestSalary
-- HR	         50000
-- IT	         70000
-- Marketing	 75000