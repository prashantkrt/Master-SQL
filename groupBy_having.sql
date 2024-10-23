-- The HAVING clause in SQL is used in conjunction with the GROUP BY clause to filter groups based on a specified condition.
-- While the WHERE clause filters rows before grouping, the HAVING clause filters the grouped rows after the aggregation has been performed.

CREATE TABLE Users (
   UserID INT PRIMARY KEY,
   Username VARCHAR(50),
   Age INT,
   Country VARCHAR(50),
   RegistrationDate DATE
);

INSERT INTO Users (UserID, Username, Age, Country, RegistrationDate) VALUES
 (1, 'Alice', 25, 'USA', '2021-01-15'),
 (2, 'Bob', 30, 'UK', '2020-03-20'),
 (3, 'Charlie', 25, 'USA', '2021-05-10'),
 (4, 'David', 35, 'Canada', '2019-09-05'),
 (5, 'Eve', 30, 'UK', '2020-11-15');


+--------+----------+-----+---------+-----------------+
| UserID | Username  | Age | Country | RegistrationDate |
+--------+----------+-----+---------+-----------------+
| 1      | Alice    | 25  | USA     | 2021-01-15      |
| 2      | Bob      | 30  | UK      | 2020-03-20      |
| 3      | Charlie  | 25  | USA     | 2021-05-10      |
| 4      | David    | 35  | Canada  | 2019-09-05      |
| 5      | Eve      | 30  | UK      | 2020-11-15      |
+--------+----------+-----+---------+-----------------+


SELECT Country, COUNT(*) AS NumberOfUsers
FROM Users
GROUP BY Country
HAVING COUNT(*) > 1;

+---------+--------------+
| Country | NumberOfUsers|
+---------+--------------+
| USA     | 2            |
| UK      | 2            |
+---------+--------------+


SELECT Country, AVG(Age) AS AverageAge
FROM Users
GROUP BY Country
HAVING AVG(Age) > 28;

+---------+------------+
| Country | AverageAge |
+---------+------------+
| Canada  | 35         |
+---------+------------+


SELECT Age, COUNT(*) AS NumberOfUsers
FROM Users
GROUP BY Age
HAVING COUNT(*) >= 2;

+-----+--------------+
| Age | NumberOfUsers|
+-----+--------------+
| 25  | 2            |
| 30  | 2            |
+-----+--------------+

CREATE TABLE Users (
   UserID INT PRIMARY KEY,
   Username VARCHAR(50),
   Age INT,
   Country VARCHAR(50),
   RegistrationDate DATE,
   TotalSpent DECIMAL(10, 2)
);

INSERT INTO Users (UserID, Username, Age, Country, RegistrationDate, TotalSpent) VALUES
 (1, 'Alice', 25, 'USA', '2021-01-15', 100.00),
 (2, 'Bob', 30, 'UK', '2020-03-20', 150.00),
 (3, 'Charlie', 25, 'USA', '2021-05-10', 200.00),
 (4, 'David', 35, 'Canada', '2019-09-05', 300.00),
 (5, 'Eve', 30, 'UK', '2020-11-15', 250.00);

+--------+----------+-----+---------+-----------------+------------+
| UserID | Username | Age | Country | RegistrationDate | TotalSpent |
+--------+----------+-----+---------+-----------------+------------+
| 1      | Alice    | 25  | USA     | 2021-01-15      | 100.00     |
| 2      | Bob      | 30  | UK      | 2020-03-20      | 150.00     |
| 3      | Charlie  | 25  | USA     | 2021-05-10      | 200.00     |
| 4      | David    | 35  | Canada  | 2019-09-05      | 300.00     |
| 5      | Eve      | 30  | UK      | 2020-11-15      | 250.00     |
+--------+----------+-----+---------+-----------------+------------+


SELECT Country, SUM(TotalSpent) AS TotalSpending
FROM Users
GROUP BY Country
HAVING SUM(TotalSpent) > 300;

+---------+--------------+
| Country | TotalSpending|
+---------+--------------+
| UK      | 400.00       |
| Canada  | 300.00       |
+---------+--------------+

SELECT Age, SUM(TotalSpent) AS TotalSpending
FROM Users
GROUP BY Age
HAVING SUM(TotalSpent) >= 250;

+-----+--------------+
| Age | TotalSpending|
+-----+--------------+
| 30  | 400.00       |
| 25  | 300.00       |
+-----+--------------+

SELECT Age, Country, COUNT(*) AS NumberOfUsers
FROM Users
GROUP BY Age, Country
HAVING COUNT(*) > 1;

+-----+---------+--------------+
| Age | Country | NumberOfUsers|
+-----+---------+--------------+
| 30  | UK      | 2            |
+-----+---------+--------------+
