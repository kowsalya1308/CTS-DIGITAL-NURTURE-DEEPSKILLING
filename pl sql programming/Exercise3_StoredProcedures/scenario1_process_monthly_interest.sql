-- =============================================================
-- FILE: scenario1_process_monthly_interest.sql
-- EXERCISE 3 - SCENARIO 1: Stored Procedures
-- PURPOSE: ProcessMonthlyInterest applies 1% interest to all
--          Savings accounts by updating their balance.
-- =============================================================

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest AS
    v_updated_count NUMBER := 0;
BEGIN
    DBMS_OUTPUT.PUT_LINE('=== Processing Monthly Interest for Savings Accounts ===');

    UPDATE Accounts
    SET    Balance      = ROUND(Balance * 1.01, 2),
           LastModified = SYSDATE
    WHERE  AccountType  = 'Savings';

    v_updated_count := SQL%ROWCOUNT;
    COMMIT;

    DBMS_OUTPUT.PUT_LINE(
        'SUCCESS: Monthly interest (1%) applied to ' ||
        v_updated_count || ' Savings account(s).'
    );

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('ERROR: ' || SQLERRM);
END ProcessMonthlyInterest;
/

-- ---- TEST BLOCK ----
DECLARE
BEGIN
    DBMS_OUTPUT.PUT_LINE('-- Before ProcessMonthlyInterest --');
    FOR r IN (SELECT AccountID, AccountType, Balance FROM Accounts WHERE AccountType = 'Savings') LOOP
        DBMS_OUTPUT.PUT_LINE('  Acc ' || r.AccountID || ' | Balance: $' || r.Balance);
    END LOOP;

    ProcessMonthlyInterest;

    DBMS_OUTPUT.PUT_LINE('-- After ProcessMonthlyInterest --');
    FOR r IN (SELECT AccountID, AccountType, Balance FROM Accounts WHERE AccountType = 'Savings') LOOP
        DBMS_OUTPUT.PUT_LINE('  Acc ' || r.AccountID || ' | Balance: $' || r.Balance);
    END LOOP;
END;
/
