CREATE TABLE Orders
(
    OrderID     INT PRIMARY KEY AUTO_INCREMENT,                                -- Unique identifier for each order
    CustomerID  INT            NOT NULL,                                       -- Foreign key to the Customers table
    OrderDate   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,                           -- Date and time of the order
    Status      ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled') NOT NULL, -- Order status
    TotalAmount DECIMAL(10, 2) NOT NULL                                        -- Total amount of the order
);

-- Select All Columns from the Orders Table:
SELECT * FROM Orders;

-- Select Specific Columns:
SELECT OrderID, CustomerID, OrderDate, TotalAmount FROM Orders;

-- Select Orders with a Specific Status:
SELECT * FROM Orders WHERE Status = 'Shipped';

-- Select Orders Placed After a Certain Date:
SELECT * FROM Orders WHERE OrderDate > '2024-01-01';

-- Select Orders with a Total Amount Greater Than a Certain Value:
SELECT * FROM Orders WHERE TotalAmount > 100.00;

-- Count the Total Number of Orders:
SELECT COUNT(*) AS TotalOrders FROM Orders;

-- Select Orders Grouped by Status:
SELECT Status, COUNT(*) AS Count FROM Orders GROUP BY Status;

-- Example Data in the Orders Table
-- Assuming the Orders table contains the following data:

+---------+------------+---------------------+----------+-------------+
| OrderID | CustomerID | OrderDate           | Status   | TotalAmount |
+---------+------------+---------------------+----------+-------------+
| 1       | 101        | 2024-01-05 10:00:00 | Shipped   | 50.00      |
| 2       | 102        | 2024-01-06 11:30:00 | Pending   | 30.00      |
| 3       | 103        | 2024-01-07 14:20:00 | Delivered | 75.00      |
| 4       | 101        | 2024-01-08 09:15:00 | Shipped   | 45.00      |
| 5       | 104        | 2024-01-09 12:45:00 | Cancelled | 60.00      |
| 6       | 102        | 2024-01-10 15:00:00 | Pending   | 25.00      |
| 7       | 103        | 2024-01-11 18:00:00 | Delivered | 100.00     |
| 8       | 101        | 2024-01-12 20:30:00 | Shipped   | 80.00      |
+---------+------------+---------------------+----------+-------------+


-- Expected Output
-- After executing the above query, the output would look like this:

+----------+-------+
| Status   | Count |
+----------+-------+
| Shipped  | 3     |
| Pending  | 2     |
| Delivered| 2     |
| Cancelled| 1     |
+----------+-------+

-- Explanation of the Output
-- Shipped: There are 3 orders with the status 'Shipped'.
-- Pending: There are 2 orders with the status 'Pending'.
-- Delivered: There are 2 orders with the status 'Delivered'.
-- Cancelled: There is 1 order with the status 'Cancelled'.

-- Select Orders with Customer ID and Total Amount:
SELECT CustomerID, SUM(TotalAmount) AS TotalSpent FROM Orders GROUP BY CustomerID;

-- Example Data in the Orders Table
-- Let's assume the Orders table contains the following data:

+---------+------------+---------------------+----------+-------------+
| OrderID | CustomerID | OrderDate           | Status   | TotalAmount |
+---------+------------+---------------------+----------+-------------+
| 1       | 101        | 2024-01-05 10:00:00 | Shipped   | 50.00      |
| 2       | 102        | 2024-01-06 11:30:00 | Pending   | 30.00      |
| 3       | 101        | 2024-01-08 09:15:00 | Shipped   | 45.00      |
| 4       | 103        | 2024-01-07 14:20:00 | Delivered | 75.00      |
| 5       | 102        | 2024-01-10 15:00:00 | Pending   | 25.00      |
| 6       | 104        | 2024-01-09 12:45:00 | Cancelled | 60.00      |
| 7       | 101        | 2024-01-12 20:30:00 | Shipped   | 80.00      |
| 8       | 103        | 2024-01-11 18:00:00 | Delivered | 100.00     |
+---------+------------+---------------------+----------+-------------+


-- Expected Output
-- After executing the query, the output would look like this:

+------------+-------------+
| CustomerID | TotalSpent  |
+------------+-------------+
| 101        | 175.00      |
| 102        | 55.00       |
| 103        | 175.00      |
| 104        | 60.00       |
+------------+-------------+

-- Explanation of the Output
-- CustomerID 101: The total amount spent is
-- 50.00+45.00+80.00=175.00
-- 50.00+45.00+80.00=175.00.
-- CustomerID 102: The total amount spent is
-- 30.00+25.00=55.00
-- 30.00+25.00=55.00.
-- CustomerID 103: The total amount spent is
-- 75.00+100.00=175.00
-- 75.00+100.00=175.00.
-- CustomerID 104: The total amount spent is
-- 60.00
-- 60.00.

-- Select Recent Orders Ordered by Order Date:
SELECT * FROM Orders ORDER BY OrderDate DESC LIMIT 10;

-- Select Distinct Statuses:
SELECT DISTINCT Status FROM Orders;



