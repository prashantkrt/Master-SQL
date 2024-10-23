INSERT INTO Payments (OrderID, PaymentMethod, Amount, Receipt)
VALUES (1, 'CreditCard', 100.50, NULL);

INSERT INTO Payments (OrderID, PaymentMethod, Amount, Receipt)
VALUES (2, 'Paypal', 250.75, NULL);

-- LOAD_FILE(): This function is used to load a file (such as an image) into the BLOB column.
INSERT INTO Payments (OrderID, PaymentMethod, Amount, Receipt)
VALUES (3, 'Cash', 80.00, LOAD_FILE('/path/to/receipt.jpg'));

INSERT INTO Payments (OrderID, PaymentMethod, Amount, Receipt)
VALUES
    (1, 'CreditCard', 100.50, NULL),
    (2, 'Paypal', 250.75, NULL),
    (3, 'Cash', 80.00, LOAD_FILE('/path/to/receipt1.jpg')),
    (4, 'CreditCard', 150.00, NULL),
    (5, 'Paypal', 300.00, LOAD_FILE('/path/to/receipt2.jpg'));