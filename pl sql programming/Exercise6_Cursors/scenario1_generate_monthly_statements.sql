-- =============================================================
-- FILE: scenario1_generate_monthly_statements.sql
-- EXERCISE 6 - SCENARIO 1: Cursors
-- PURPOSE: Generate monthly statements using an explicit cursor.
-- =============================================================

SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_transactions IS
        SELECT t.TransactionID,
               t.AccountID,
               t.TransactionDate,
               t.Amount,
               t.TransactionType,
               a.CustomerID,
               c.Name AS CustomerName
        FROM   Transactions t
        JOIN   Accounts a ON a.AccountID = t.AccountID
        JOIN   Customers c ON c.CustomerID = a.CustomerID
        WHERE  TRUNC(t.TransactionDate, 'MM') = TRUNC(SYSDATE, 'MM')
        ORDER BY c.CustomerID, t.TransactionDate;

    v_prev_customer_id NUMBER := NULL;
BEGIN
    DBMS_OUTPUT.PUT_LINE('=== Monthly Statements for Current Month ===');

    FOR rec IN c_transactions LOOP
        IF v_prev_customer_id IS NULL OR rec.CustomerID != v_prev_customer_id THEN
            DBMS_OUTPUT.PUT_LINE('');
            DBMS_OUTPUT.PUT_LINE('Customer: ' || rec.CustomerName || ' (ID: ' || rec.CustomerID || ')');
            DBMS_OUTPUT.PUT_LINE('-------------------------------------------------');
            v_prev_customer_id := rec.CustomerID;
        END IF;

        DBMS_OUTPUT.PUT_LINE(
            'Txn ID: ' || rec.TransactionID ||
            ' | Date: ' || TO_CHAR(rec.TransactionDate, 'DD-MON-YYYY') ||
            ' | Type: ' || rec.TransactionType ||
            ' | Amount: $' || rec.Amount
        );
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('=== End of Statements ===');
END;
/
