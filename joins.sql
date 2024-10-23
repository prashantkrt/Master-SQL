-- Very Very Important
CREATE TABLE Customers
(
    CustomerID   INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each customer
    CustomerName VARCHAR(100) NOT NULL,          -- Name of the customer
    Country      VARCHAR(50)                     -- Country of the customer
);

CREATE TABLE Orders
(
    OrderID    INT PRIMARY KEY AUTO_INCREMENT,                 -- Unique identifier for each order
    CustomerID INT            NOT NULL,                        -- Foreign key to the Customers table
    OrderDate  DATE           NOT NULL,                        -- Date of the order
    Amount     DECIMAL(10, 2) NOT NULL,                        -- Amount of the order
    FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID) -- Foreign key constraint
);

-- CustomerID	  CustomerName	  Country
-- 1	           Alice	      USA
-- 2	           Bob	          UK
-- 3	           Charlie	      USA
--
-- OrderID	CustomerID	OrderDate	Amount
-- 101	          1	     2024-01-10	150.00
-- 102	          2	     2024-01-11	200.00
-- 103	          1	     2024-01-12	250.00

SELECT c.CustomerID,
       c.CustomerName,
       o.OrderID,
       o.OrderDate,
       o.Amount
FROM Customers c
         INNER JOIN
     Orders o ON c.CustomerID = o.CustomerID;

-- CustomerID	CustomerName	OrderID	OrderDate	Amount
-- 1	            Alice	        1	2024-01-10	150.00
-- 1	            Alice	        3	2024-01-12	250.00
-- 2	            Bob	            2	2024-01-11	200.00

SELECT c.CustomerID,
       c.CustomerName,
       o.OrderID,
       o.OrderDate,
       o.Amount
FROM Customers c
         LEFT JOIN
     Orders o ON c.CustomerID = o.CustomerID;

-- CustomerID	CustomerName	OrderID	OrderDate	Amount
-- 1	        Alice	            1	2024-01-10	150.00
-- 1	        Alice	            3	2024-01-12	250.00
-- 2	        Bob	                2	2024-01-11	200.00
-- 3	        Charlie	            NULL	NULL	NULL

SELECT c.CustomerID,
       c.CustomerName,
       o.OrderID,
       o.OrderDate,
       o.Amount
FROM Customers c
         RIGHT JOIN
     Orders o ON c.CustomerID = o.CustomerID;

-- CustomerID	CustomerName	OrderID	    OrderDate	Amount
-- 1	            Alice	            1	2024-01-10	150.00
-- 2	             Bob	            2	2024-01-11	200.00
-- 1	            Alice	            3	2024-01-12	250.00

SELECT c.CustomerID,
       c.CustomerName,
       o.OrderID,
       o.OrderDate,
       o.Amount
FROM Customers c
         FULL OUTER JOIN
     Orders o ON c.CustomerID = o.CustomerID;

-- CustomerID	CustomerName	OrderID	OrderDate	Amount
-- 1	        Alice	            1	2024-01-10	150.00
-- 1	        Alice	            3	2024-01-12	250.00
-- 2	        Bob	                2	2024-01-11	200.00
-- 3	        Charlie	            NULL	NULL	NULL

CREATE TABLE Customers
(
    CustomerID   INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    ContactEmail VARCHAR(100)
);

CREATE TABLE Orders
(
    OrderID    INT PRIMARY KEY,
    CustomerID INT,
    OrderDate  DATE,
    Amount     DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
);

INSERT INTO Customers (CustomerID, CustomerName, ContactEmail)
VALUES (1, 'Alice', 'alice@example.com'),
       (2, 'Bob', 'bob@example.com'),
       (3, 'Charlie', 'charlie@example.com'),
       (4, 'David', 'david@example.com'); -- Extra customer

INSERT INTO Orders (OrderID, CustomerID, OrderDate, Amount)
VALUES (1, 1, '2024-01-10', 150.00),
       (2, 2, '2024-01-11', 200.00),
       (3, 1, '2024-01-12', 250.00),
       (4, 3, '2024-01-15', 300.00),
       (5, NULL, '2024-01-20', 100.00); -- Order with no customer


SELECT *
FROM Customers c
         INNER JOIN Orders o ON c.CustomerID = o.CustomerID;

-- CustomerID	CustomerName	ContactEmail	    OrderID	CustomerID	OrderDate	Amount
-- 1	                Alice	alice@example.com	1	        1	    2024-01-10	150.00
-- 1	                Alice	alice@example.com	3	        1	    2024-01-12	250.00
-- 2	                Bob	    bob@example.com	    2	        2	    2024-01-11	200.00
-- 3	                Charlie	charlie@example.com	4	        3	    2024-01-15	300.00

SELECT *
FROM Customers c
         LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;

-- CustomerID	CustomerName	ContactEmail	OrderID	CustomerID	OrderDate	Amount
-- 1	            Alice	    alice@example.com	1	   1	  2024-01-10	150.00
-- 1	            Alice	    alice@example.com	3	   1	  2024-01-12	250.00
-- 2	            Bob	        bob@example.com	    2	   2	  2024-01-11	200.00
-- 3	            Charlie	    charlie@example.com	4	   3	  2024-01-15	300.00
-- 4	            David	    david@example.com	NULL	NULL	NULL	NULL

SELECT *
FROM Customers c
         RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;

-- CustomerID	CustomerName	ContactEmail	        OrderID	CustomerID	OrderDate	Amount
-- 1	            Alice	      alice@example.com     	1	1	        2024-01-10	150.00
-- 2	            Bob	          bob@example.com	        2	2	        2024-01-11	200.00
-- 1	            Alice	      alice@example.com	        3	1	        2024-01-12	250.00
-- 3	            Charlie	      charlie@example.com	    4	3	        2024-01-15	300.00
-- NULL	            NULL	           NULL	                5	NULL	    2024-01-20	100.00

SELECT *
FROM Customers c
         FULL OUTER JOIN Orders o ON c.CustomerID = o.CustomerID;

-- CustomerID	CustomerName	ContactEmail	OrderID	CustomerID	OrderDate	Amount
-- 1	        Alice	        alice@example.com	1	    1	2024-01-10	150.00
-- 1	        Alice	        alice@example.com	3	    1	2024-01-12	250.00
-- 2	        Bob	            bob@example.com	    2	    2	2024-01-11	200.00
-- 3	        Charlie	        charlie@example.com	4	    3	2024-01-15	300.00
-- 4	        David	        david@example.com	NULL    NULL	NULL	NULL
-- NULL	        NULL	        NULL	            5	    NULL 2024-01-20	100.00