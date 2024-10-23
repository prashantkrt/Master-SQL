CREATE TABLE Orders
(
    OrderID     INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID  INT            NOT NULL,
    OrderDate   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    TotalAmount DECIMAL(10, 2) NOT NULL
);

-- You want to add a ShippingAddress column to the Orders table.
ALTER TABLE Orders
ADD COLUMN ShippingAddress VARCHAR(255);

-- You want to modify the TotalAmount column to allow more precision (e.g., from DECIMAL(10, 2) to DECIMAL(12, 2)).
ALTER TABLE Orders
MODIFY COLUMN TotalAmount DECIMAL (12, 2);

-- You want to rename the OrderDate column to CreatedDate.
-- CHANGE COLUMN: Renames the OrderDate column to CreatedDate while keeping the TIMESTAMP type.
ALTER TABLE Orders
CHANGE COLUMN OrderDate CreatedDate TIMESTAMP;

-- You want to remove the ShippingAddress column from the Orders table.
ALTER TABLE Orders
DROP
COLUMN ShippingAddress;

-- You want to add a foreign key CustomerID referencing a Customers table.
ALTER TABLE Orders
ADD CONSTRAINT FK_Customer
FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID);

-- Add Multiple columns
-- You want to add two new columns: ShippingDate and Status.

ALTER TABLE Orders
ADD COLUMN ShippingDate DATE,
ADD COLUMN Status VARCHAR(50);

-- Change the default value
-- You want to change the default value of OrderDate to NOW() (current timestamp).
ALTER TABLE Orders
ALTER COLUMN OrderDate SET DEFAULT NOW();




