-- The GROUP BY clause in SQL is used to arrange identical data into groups.
-- It is often used with aggregate functions to summarize information within each group.

CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Username VARCHAR(50),
    Age INT,
    Country VARCHAR(50),
    RegistrationDate DATE
);

+--------+----------+-----+---------+-----------------+
| UserID | Username  | Age | Country | RegistrationDate |
+--------+----------+-----+---------+-----------------+
| 1      | Alice    | 25  | USA     | 2021-01-15      |
| 2      | Bob      | 30  | UK      | 2020-03-20      |
| 3      | Charlie  | 25  | USA     | 2021-05-10      |
| 4      | David    | 35  | Canada  | 2019-09-05      |
| 5      | Eve      | 30  | UK      | 2020-11-15      |
+--------+----------+-----+---------+-----------------+


-- Count Users by Country
-- To count the number of users from each country, you can use:
SELECT Country, COUNT(*) AS NumberOfUsers
FROM Users
GROUP BY Country;

+---------+--------------+
| Country | NumberOfUsers|
+---------+--------------+
| USA     | 2            |
| UK      | 2            |
| Canada  | 1            |
+---------+--------------+

-- Average Age of Users by Country
-- To find the average age of users from each country, you can use:
SELECT Country, AVG(Age) AS AverageAge
FROM Users
GROUP BY Country;

+---------+------------+
| Country | AverageAge |
+---------+------------+
| USA     | 25         |
| UK      | 30         |
| Canada  | 35         |
+---------+------------+

-- Count Users by Age
-- To count the number of users for each age group:

SELECT Age, COUNT(*) AS NumberOfUsers
FROM Users
GROUP BY Age;

+-----+--------------+
| Age | NumberOfUsers|
+-----+--------------+
| 25  | 2            |
| 30  | 2            |
| 35  | 1            |
+-----+--------------+

-- Group by Registration Year
-- To count users based on the year of registration, you can extract the year from the RegistrationDate:
SELECT YEAR(RegistrationDate) AS RegistrationYear, COUNT(*) AS NumberOfUsers
FROM Users
GROUP BY YEAR(RegistrationDate);
+-------------------+--------------+
| RegistrationYear  | NumberOfUsers|
+-------------------+--------------+
| 2020              | 2            |
| 2021              | 2            |
| 2019              | 1            |
+-------------------+--------------+
