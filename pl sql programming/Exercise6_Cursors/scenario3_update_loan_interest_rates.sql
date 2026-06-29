-- =============================================================
-- FILE: scenario3_update_loan_interest_rates.sql
-- EXERCISE 6 - SCENARIO 3: Cursors
-- PURPOSE: Update loan interest rates for all loans using an explicit cursor.
-- =============================================================

SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_loans IS
        SELECT LoanID, LoanAmount, InterestRate
        FROM   Loans;

    v_new_rate NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('=== Updating Loan Interest Rates Based on New Policy ===');

    FOR rec IN c_loans LOOP
        IF rec.LoanAmount < 10000 THEN
            v_new_rate := rec.InterestRate - 0.5;
        ELSE
            v_new_rate := rec.InterestRate - 0.25;
        END IF;

        IF v_new_rate < 0 THEN
            v_new_rate := 0;
        END IF;

        UPDATE Loans
        SET    InterestRate = v_new_rate
        WHERE  LoanID       = rec.LoanID;

        DBMS_OUTPUT.PUT_LINE(
            'Loan ' || rec.LoanID ||
            ' updated from ' || rec.InterestRate ||
            '% to ' || v_new_rate || '%'
        );
    END LOOP;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('=== Loan interest rate policy update complete ===');
END;
/
