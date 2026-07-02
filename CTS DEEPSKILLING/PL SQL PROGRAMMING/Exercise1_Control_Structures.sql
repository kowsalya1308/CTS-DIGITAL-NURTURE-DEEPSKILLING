-- Exercise 1: Control Structures
-- Scenario 1: Apply a 1% discount to loan interest rates for customers above 60 years old.
DECLARE
    CURSOR c_customers IS
        SELECT customer_id, age, loan_interest_rate
        FROM customers;
BEGIN
    FOR customer_rec IN c_customers LOOP
        IF customer_rec.age > 60 THEN
            UPDATE customers
            SET loan_interest_rate = customer_rec.loan_interest_rate - 1
            WHERE customer_id = customer_rec.customer_id;
        END IF;
    END LOOP;
    COMMIT;
END;
/

-- Scenario 2: Set IsVIP to TRUE for customers with a balance over 10,000.
DECLARE
    CURSOR c_customers IS
        SELECT customer_id, balance
        FROM customers;
BEGIN
    FOR customer_rec IN c_customers LOOP
        IF customer_rec.balance > 10000 THEN
            UPDATE customers
            SET isvip = 'Y'
            WHERE customer_id = customer_rec.customer_id;
        ELSE
            UPDATE customers
            SET isvip = 'N'
            WHERE customer_id = customer_rec.customer_id;
        END IF;
    END LOOP;
    COMMIT;
END;
/

-- Scenario 3: Print reminders for loans due within the next 30 days.
DECLARE
    CURSOR c_due_loans IS
        SELECT loan_id, customer_id, due_date
        FROM loans
        WHERE due_date BETWEEN SYSDATE AND SYSDATE + 30;
BEGIN
    FOR loan_rec IN c_due_loans LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Reminder: Loan ' || loan_rec.loan_id ||
            ' for customer ' || loan_rec.customer_id ||
            ' is due on ' || TO_CHAR(loan_rec.due_date, 'DD-MON-YYYY')
        );
    END LOOP;
END;
/
