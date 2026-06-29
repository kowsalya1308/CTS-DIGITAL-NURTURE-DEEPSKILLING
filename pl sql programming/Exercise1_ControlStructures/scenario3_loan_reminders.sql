-- =============================================================
-- FILE: scenario3_loan_reminders.sql
-- EXERCISE 1 - SCENARIO 3: Control Structures
-- PURPOSE: Fetch all loans due within the next 30 days and
--          print a reminder message for each customer.
-- =============================================================

SET SERVEROUTPUT ON;

DECLARE
    v_reminder_count NUMBER := 0;
    v_days_left      NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('=== Loan Due Reminders (Next 30 Days) ===');
    DBMS_OUTPUT.PUT_LINE('Today: ' || TO_CHAR(SYSDATE, 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('------------------------------------------');

    -- Loop through loans due within the next 30 days
    FOR rec IN (
        SELECT l.LoanID,
               l.LoanAmount,
               l.InterestRate,
               l.EndDate,
               c.Name       AS CustomerName,
               c.CustomerID
        FROM   Loans     l
        JOIN   Customers c ON c.CustomerID = l.CustomerID
        WHERE  l.EndDate BETWEEN SYSDATE AND SYSDATE + 30
        ORDER BY l.EndDate
    ) LOOP
        v_days_left := TRUNC(rec.EndDate - SYSDATE);

        DBMS_OUTPUT.PUT_LINE(
            'REMINDER >> Customer: '  || rec.CustomerName      ||
            ' | Loan ID: '            || rec.LoanID            ||
            ' | Amount: $'            || rec.LoanAmount        ||
            ' | Due In: '             || v_days_left || ' day(s)' ||
            ' | Due Date: '           || TO_CHAR(rec.EndDate, 'DD-MON-YYYY')
        );

        v_reminder_count := v_reminder_count + 1;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('------------------------------------------');

    IF v_reminder_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No loans are due within the next 30 days.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Total reminders sent: ' || v_reminder_count);
    END IF;

    DBMS_OUTPUT.PUT_LINE('=== Done ===');
END;
/
