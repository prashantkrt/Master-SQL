CREATE TABLE Product
(
    ProductID   INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100) NOT NULL,
    Category    VARCHAR(50),
    Price       DECIMAL(10, 2),
    Quantity    INT,
    SupplierID  INT
);

-- Delete a single record by ProductID:
-- You want to delete a specific product with ProductID = 10.
DELETE FROM Product
WHERE ProductID = 10;

-- Delete all products in a specific category:
-- You want to delete all products that belong to the Electronics category.
DELETE FROM Product
WHERE Category = 'Electronics';

-- Delete products with a price greater than a certain value:
-- You want to delete all products that have a price greater than $1000.
DELETE FROM Product
WHERE Price > 1000;

-- Delete products with zero quantity:
-- You want to remove all products that are out of stock (quantity is zero).
DELETE FROM Product
WHERE Quantity = 0;

-- Delete products based on SupplierID:
-- You want to delete all products supplied by a specific supplier with SupplierID = 5.
DELETE FROM Product
WHERE SupplierID = 5;

-- Delete all products (clear the table):
-- You want to remove all records from the Product table without dropping the table.
DELETE FROM Product;

-- Delete with a subquery:

-- You want to delete products supplied by a specific supplier based on another table, e.g., Supplier.
DELETE FROM Product
WHERE SupplierID IN (
    SELECT SupplierID FROM Supplier WHERE SupplierName = 'ABC Suppliers'
);

-- Delete products where price is lower than the average price:
-- You want to delete all products priced below the average price in the Product table.
DELETE FROM Product
WHERE Price < (SELECT AVG(Price) FROM Product);


-- Delete with a LIMIT:
-- You want to delete only the first 5 products in the table based on the ProductID (useful for testing).
DELETE FROM Product
ORDER BY ProductID
LIMIT 5;

-- Delete Using LIKE for Text Fields:
-- You can delete products based on a string condition.
DELETE FROM Product
WHERE ProductName LIKE 'Old%';  -- Deletes all products whose names start with 'Old'

-- Delete Products Based on a List:
-- You can delete products that match a list of specific product names.
DELETE FROM Product
WHERE ProductName IN ('ProductA', 'ProductB', 'ProductC');

-- Delete Based on a Range:
-- You can delete products in a price range.
DELETE FROM Product
WHERE Price BETWEEN 100 AND 200;



