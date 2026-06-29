-- =============================================================
-- FILE: scenario3_has_sufficient_balance.sql
-- EXERCISE 4 - SCENARIO 3: Functions
-- PURPOSE: Return TRUE if an account has sufficient balance
--          for a specified amount.
-- =============================================================

SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION HasSufficientBalance (
    p_account_id IN NUMBER,
    p_amount     IN NUMBER
) RETURN BOOLEAN AS
    v_balance NUMBER;
BEGIN
    IF p_account_id IS NULL OR p_amount IS NULL OR p_amount < 0 THEN
        RETURN FALSE;
    END IF;

    SELECT Balance
    INTO   v_balance
    FROM   Accounts
    WHERE  AccountID = p_account_id;

    RETURN v_balance >= p_amount;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN FALSE;
    WHEN OTHERS THEN
        RETURN FALSE;
END HasSufficientBalance;
/

-- ---- TEST BLOCK ----
BEGIN
    DBMS_OUTPUT.PUT_LINE('=== Test HasSufficientBalance ===');
    IF HasSufficientBalance(1, 500) THEN
        DBMS_OUTPUT.PUT_LINE('Account 1, amount 500: TRUE');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Account 1, amount 500: FALSE');
    END IF;
    IF HasSufficientBalance(2, 2000) THEN
        DBMS_OUTPUT.PUT_LINE('Account 2, amount 2000: TRUE');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Account 2, amount 2000: FALSE');
    END IF;
    IF HasSufficientBalance(999, 100) THEN
        DBMS_OUTPUT.PUT_LINE('Account 999, amount 100: TRUE');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Account 999, amount 100: FALSE');
    END IF;
END;
/

-- ---- TEST BLOCK ----
BEGIN
    DBMS_OUTPUT.PUT_LINE('=== Test HasSufficientBalance ===');
    DBMS_OUTPUT.PUT_LINE('Account 1, amount 500: ' || HasSufficientBalance(1, 500));
    DBMS_OUTPUT.PUT_LINE('Account 2, amount 2000: ' || HasSufficientBalance(2, 2000));
    DBMS_OUTPUT.PUT_LINE('Account 999, amount 100: ' || HasSufficientBalance(999, 100));
END;
/
