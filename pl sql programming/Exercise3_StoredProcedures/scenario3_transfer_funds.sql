-- =============================================================
-- FILE: scenario3_transfer_funds.sql
-- EXERCISE 3 - SCENARIO 3: Stored Procedures
-- PURPOSE: TransferFunds procedure transfers a specified amount
--          from one account to another after checking the
--          source account balance.
-- =============================================================

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE TransferFunds (
    p_from_account_id IN NUMBER,
    p_to_account_id   IN NUMBER,
    p_amount          IN NUMBER
) AS
    v_from_balance    NUMBER;
    v_from_owner      VARCHAR2(100);
    v_to_owner        VARCHAR2(100);
BEGIN
    -- Validate transfer amount
    IF p_amount <= 0 THEN
        RAISE_APPLICATION_ERROR(-20030, 'Transfer amount must be positive.');
    END IF;

    -- Validate source account exists and lock it
    BEGIN
        SELECT a.Balance, c.Name
        INTO   v_from_balance, v_from_owner
        FROM   Accounts a
        JOIN   Customers c ON c.CustomerID = a.CustomerID
        WHERE  a.AccountID = p_from_account_id
        FOR UPDATE;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20031, 'Source account ' || p_from_account_id || ' not found.');
    END;

    -- Validate destination account exists
    BEGIN
        SELECT c.Name
        INTO   v_to_owner
        FROM   Accounts a
        JOIN   Customers c ON c.CustomerID = a.CustomerID
        WHERE  a.AccountID = p_to_account_id;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20032, 'Destination account ' || p_to_account_id || ' not found.');
    END;

    -- Check sufficient balance
    IF v_from_balance < p_amount THEN
        RAISE_APPLICATION_ERROR(
            -20033,
            'Insufficient balance. Available: $' || v_from_balance ||
            ', Requested: $' || p_amount
        );
    END IF;

    -- Perform transfer
    UPDATE Accounts
    SET    Balance = Balance - p_amount, LastModified = SYSDATE
    WHERE  AccountID = p_from_account_id;

    UPDATE Accounts
    SET    Balance = Balance + p_amount, LastModified = SYSDATE
    WHERE  AccountID = p_to_account_id;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE(
        'SUCCESS: $' || p_amount || ' transferred' ||
        ' from [' || v_from_owner || ' - Acc ' || p_from_account_id || ']' ||
        ' to ['   || v_to_owner   || ' - Acc ' || p_to_account_id   || ']'
    );

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('TRANSFER FAILED: ' || SQLERRM);
END TransferFunds;
/

-- ---- TEST BLOCK ----
BEGIN
    DBMS_OUTPUT.PUT_LINE('=== Test TransferFunds ===');

    -- Valid transfer
    DBMS_OUTPUT.PUT_LINE('-- Test 1: Transfer $500 from Acc 4 to Acc 1 --');
    TransferFunds(4, 1, 500);

    -- Insufficient funds
    DBMS_OUTPUT.PUT_LINE('-- Test 2: Transfer $999999 (insufficient) --');
    TransferFunds(1, 2, 999999);

    -- Invalid account
    DBMS_OUTPUT.PUT_LINE('-- Test 3: Source account does not exist --');
    TransferFunds(999, 1, 100);
END;
/
