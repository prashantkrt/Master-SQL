UPDATE Payments
SET PaymentMethod = 'Paypal', Amount = 120.75
WHERE PaymentID = 1;

UPDATE Payments
SET Amount = Amount * 1.10
WHERE PaymentMethod = 'CreditCard';

UPDATE Payments
SET Receipt = LOAD_FILE('/path/to/new_receipt.jpg')
WHERE PaymentID = 3;

UPDATE Payments
SET PaymentDate = CURRENT_TIMESTAMP
WHERE OrderID = 2;

UPDATE Payments
SET PaymentMethod = 'Cash', Amount = 50.00
WHERE OrderID IN (4, 5);

UPDATE Payments
SET Receipt = NULL
WHERE PaymentID = 2;
