CREATE TABLE Product
(
    ProductID   INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
    Price       DECIMAL(10, 2)
);

-- To remove all products from the table:
TRUNCATE TABLE Product;

-- Cannot Use a WHERE Clause:
-- TRUNCATE cannot delete specific rows based on conditions. It will remove all rows in the table.
-- You cannot do:

--Truncate removes all the rows it won't work for individual rows
TRUNCATE TABLE Product WHERE Price < 50; -- This is invalid


