CREATE
DATABASE testtb;

CREATE TABLE CUSTOMER
(
    ID     INT PRIMARY KEY,
    NAME   VARCHAR(255) NOT NULL,
    AGE    INT          NOT NULL,
    CITY   CHAR(50),
    SALARY NUMERIC
)

CREATE TABLE Employee
(
    EmployeeID   INT PRIMARY KEY,     -- EmployeeID is the primary key
    FirstName    VARCHAR(50),         -- First name of the employee, up to 50 characters
    LastName     VARCHAR(50),         -- Last name of the employee, up to 50 characters
    Email        VARCHAR(100) UNIQUE, -- Email, must be unique for each employee
    HireDate     DATE,                -- Date the employee was hired
    Salary       DECIMAL(10, 2),      -- Salary with two decimal places (e.g., 10000.50)
    DepartmentID INT                  -- DepartmentID references department the employee belongs to
);

CREATE TABLE Users
(
    UserID       INT AUTO_INCREMENT PRIMARY KEY,     -- Integer with auto-increment as the primary key
    UserName     VARCHAR(50)         NOT NULL,       -- Variable-length string up to 50 characters
    Email        VARCHAR(100) UNIQUE NOT NULL,       -- Unique email addresses
    PasswordHash CHAR(64)            NOT NULL,       -- Fixed-length string for storing hashed password (64 chars)
    CreatedAt    TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Timestamp to store account creation time
);

CREATE TABLE Orders
(
    OrderID         INT PRIMARY KEY,                      -- Primary key for orders
    CustomerID      INT            NOT NULL,              -- Foreign key linking to customers (not null)
    OrderAmount     DECIMAL(12, 2) NOT NULL,              -- Stores monetary amounts with 2 decimal places
    OrderDate       DATE           NOT NULL,              -- Date of the order (without time)
    Shipped         BOOLEAN   DEFAULT FALSE,              -- Indicates if the order has been shipped (boolean)
    ShippingAddress VARCHAR(255),                         -- Variable-length string for the shipping address
    DeliveryDate    DATE,                                 -- Date the order was delivered
    PaymentMethod   ENUM('CreditCard', 'Paypal', 'Cash'), -- Enumerated type for payment method
    CreatedAt       TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Products
(
    ProductID     INT PRIMARY KEY AUTO_INCREMENT,     -- Unique identifier for the product
    ProductName   VARCHAR(100)  NOT NULL,             -- Name of the product
    Price         DECIMAL(8, 2) NOT NULL,             -- Product price with 2 decimal places
    StockQuantity INT       DEFAULT 0,                -- Quantity of product in stock (default is 0)
    Categories    JSON,                               -- JSON data to store categories in flexible format
    SupplierID    INT,                                -- Foreign key referencing Suppliers table
    IsActive      BOOLEAN   DEFAULT TRUE,             -- Whether the product is active or not
    CreatedAt     TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Timestamp for when the product was added
);



CREATE TABLE Employee
(
    EmployeeID   INT AUTO_INCREMENT PRIMARY KEY,     -- Unique identifier for the employee
    FirstName    VARCHAR(50) NOT NULL,               -- Employee's first name
    LastName     VARCHAR(50) NOT NULL,               -- Employee's last name
    BirthDate    DATE,                               -- Employee's date of birth
    HireDate     DATE,                               -- Date of hire
    ShiftStart   TIME,                               -- Start time of the employee's work shift
    ShiftEnd     TIME,                               -- End time of the employee's work shift
    JobTitle     ENUM('Manager', 'Developer', 'HR'), -- Job title restricted to specific values
    Salary       DECIMAL(10, 2),                     -- Salary with 2 decimal places
    FullTime     BOOLEAN   DEFAULT TRUE,             -- Full-time or part-time flag
    DepartmentID INT,                                -- Foreign key referencing Department table
    CreatedAt    TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Timestamp for record creation
);


CREATE TABLE Invoices
(
    InvoiceID   INT PRIMARY KEY,                               -- Unique identifier for the invoice
    CustomerID  INT            NOT NULL,                       -- Foreign key to the customer table
    InvoiceDate DATE           NOT NULL,                       -- Date the invoice was created
    DueDate     DATE,                                          -- Due date for payment
    Amount      DECIMAL(12, 2) NOT NULL,                       -- Amount of the invoice
    Description TEXT,                                          -- Detailed description of the invoice
    Paid        BOOLEAN DEFAULT FALSE,                         -- Whether the invoice has been paid or not
    FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID) -- Foreign key to customers
);

CREATE TABLE Payments
(
    PaymentID     INT PRIMARY KEY AUTO_INCREMENT,       -- Unique identifier for each payment
    OrderID       INT            NOT NULL,              -- Foreign key to the Orders table
    PaymentDate   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Timestamp for the payment
    PaymentMethod ENUM('CreditCard', 'Paypal', 'Cash'), -- Type of payment method
    Amount        DECIMAL(10, 2) NOT NULL,              -- Payment amount
    Receipt       BLOB,                                 -- Binary large object to store receipt images
    FOREIGN KEY (OrderID) REFERENCES Orders (OrderID)   -- Foreign key to orders
);



