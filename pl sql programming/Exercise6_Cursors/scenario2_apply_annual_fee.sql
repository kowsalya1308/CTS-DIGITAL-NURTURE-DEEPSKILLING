-- =============================================================
-- FILE: scenario2_apply_annual_fee.sql
-- EXERCISE 6 - SCENARIO 2: Cursors
-- PURPOSE: Deduct an annual maintenance fee from all accounts.
-- =============================================================

SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_accounts IS
        SELECT AccountID, Balance
        FROM   Accounts;

    v_fee_amount NUMBER := 50; -- annual maintenance fee
BEGIN
    DBMS_OUTPUT.PUT_LINE('=== Applying Annual Fee to All Accounts ===');

    FOR rec IN c_accounts LOOP
        UPDATE Accounts
        SET    Balance      = Balance - v_fee_amount,
               LastModified = SYSDATE
        WHERE  AccountID    = rec.AccountID;

        DBMS_OUTPUT.PUT_LINE(
            'Account ' || rec.AccountID ||
            ' fee deducted: $' || v_fee_amount ||
            ' | New Balance: $' || (rec.Balance - v_fee_amount)
        );
    END LOOP;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('=== Annual fee applied to all accounts ===');
END;
/
