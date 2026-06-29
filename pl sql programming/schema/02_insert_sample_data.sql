-- =============================================================
-- FILE: 02_insert_sample_data.sql
-- PURPOSE: Insert representative sample data for all exercises.
-- Run AFTER 01_create_tables.sql
-- =============================================================

-- ---- CUSTOMERS ----
-- Customer aged > 60 (DOB in 1950) — for Exercise 1 Scenario 1
INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified, IsVIP)
VALUES (1, 'John Doe', TO_DATE('1950-05-15', 'YYYY-MM-DD'), 1000, SYSDATE, 'N');

-- Customer aged < 60
INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified, IsVIP)
VALUES (2, 'Jane Smith', TO_DATE('1990-07-20', 'YYYY-MM-DD'), 1500, SYSDATE, 'N');

-- Customer aged > 60 (DOB in 1955)
INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified, IsVIP)
VALUES (3, 'Robert Brown', TO_DATE('1955-03-10', 'YYYY-MM-DD'), 500, SYSDATE, 'N');

-- High-balance customer > 10,000 — for Exercise 1 Scenario 2
INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified, IsVIP)
VALUES (4, 'Emily Davis', TO_DATE('1980-11-25', 'YYYY-MM-DD'), 15000, SYSDATE, 'N');

-- Another high-balance customer
INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified, IsVIP)
VALUES (5, 'Michael Wilson', TO_DATE('1975-08-30', 'YYYY-MM-DD'), 25000, SYSDATE, 'N');

-- ---- ACCOUNTS ----
INSERT INTO Accounts (AccountID, CustomerID, AccountType, Balance, LastModified)
VALUES (1, 1, 'Savings', 1000, SYSDATE);

INSERT INTO Accounts (AccountID, CustomerID, AccountType, Balance, LastModified)
VALUES (2, 2, 'Checking', 1500, SYSDATE);

INSERT INTO Accounts (AccountID, CustomerID, AccountType, Balance, LastModified)
VALUES (3, 3, 'Savings', 500, SYSDATE);

INSERT INTO Accounts (AccountID, CustomerID, AccountType, Balance, LastModified)
VALUES (4, 4, 'Savings', 15000, SYSDATE);

INSERT INTO Accounts (AccountID, CustomerID, AccountType, Balance, LastModified)
VALUES (5, 5, 'Savings', 25000, SYSDATE);

-- ---- TRANSACTIONS ----
INSERT INTO Transactions (TransactionID, AccountID, TransactionDate, Amount, TransactionType)
VALUES (1, 1, SYSDATE, 200, 'Deposit');

INSERT INTO Transactions (TransactionID, AccountID, TransactionDate, Amount, TransactionType)
VALUES (2, 2, SYSDATE, 300, 'Withdrawal');

INSERT INTO Transactions (TransactionID, AccountID, TransactionDate, Amount, TransactionType)
VALUES (3, 3, SYSDATE, 150, 'Deposit');

INSERT INTO Transactions (TransactionID, AccountID, TransactionDate, Amount, TransactionType)
VALUES (4, 4, SYSDATE, 500, 'Deposit');

-- ---- LOANS ----
-- Normal loan (not due within 30 days)
INSERT INTO Loans (LoanID, CustomerID, LoanAmount, InterestRate, StartDate, EndDate)
VALUES (1, 1, 5000, 5, SYSDATE, ADD_MONTHS(SYSDATE, 60));

-- Loan due within next 30 days — for Exercise 1 Scenario 3
INSERT INTO Loans (LoanID, CustomerID, LoanAmount, InterestRate, StartDate, EndDate)
VALUES (2, 2, 10000, 7, SYSDATE - 365, SYSDATE + 15);

INSERT INTO Loans (LoanID, CustomerID, LoanAmount, InterestRate, StartDate, EndDate)
VALUES (3, 3, 8000, 6, SYSDATE - 180, SYSDATE + 25);

-- Large loan for cursor interest rate update
INSERT INTO Loans (LoanID, CustomerID, LoanAmount, InterestRate, StartDate, EndDate)
VALUES (4, 4, 50000, 8, SYSDATE, ADD_MONTHS(SYSDATE, 120));

INSERT INTO Loans (LoanID, CustomerID, LoanAmount, InterestRate, StartDate, EndDate)
VALUES (5, 5, 20000, 6.5, SYSDATE, ADD_MONTHS(SYSDATE, 84));

-- ---- EMPLOYEES ----
INSERT INTO Employees (EmployeeID, Name, Position, Salary, Department, HireDate)
VALUES (1, 'Alice Johnson', 'Manager', 70000, 'HR', TO_DATE('2015-06-15', 'YYYY-MM-DD'));

INSERT INTO Employees (EmployeeID, Name, Position, Salary, Department, HireDate)
VALUES (2, 'Bob Brown', 'Developer', 60000, 'IT', TO_DATE('2017-03-20', 'YYYY-MM-DD'));

INSERT INTO Employees (EmployeeID, Name, Position, Salary, Department, HireDate)
VALUES (3, 'Carol White', 'Analyst', 55000, 'IT', TO_DATE('2019-09-10', 'YYYY-MM-DD'));

INSERT INTO Employees (EmployeeID, Name, Position, Salary, Department, HireDate)
VALUES (4, 'David Green', 'HR Specialist', 48000, 'HR', TO_DATE('2020-01-05', 'YYYY-MM-DD'));

COMMIT;
DBMS_OUTPUT.PUT_LINE('Sample data inserted successfully.');
