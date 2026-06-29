-- =============================================================
-- FILE: scenario1_safe_transfer_funds.sql
-- EXERCISE 2 - SCENARIO 1: Error Handling
-- PURPOSE: Stored procedure SafeTransferFunds that transfers
--          funds between two accounts safely with rollback
--          on any error (e.g., insufficient funds).
-- =============================================================

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE SafeTransferFunds (
    p_from_account_id IN NUMBER,
    p_to_account_id   IN NUMBER,
    p_amount          IN NUMBER
) AS
    v_from_balance NUMBER;
BEGIN
    -- Validate amount
    IF p_amount <= 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Transfer amount must be positive.');
    END IF;

    -- Lock source account row and read balance
    SELECT Balance
    INTO   v_from_balance
    FROM   Accounts
    WHERE  AccountID = p_from_account_id
    FOR UPDATE;

    -- Check sufficient funds
    IF v_from_balance < p_amount THEN
        RAISE_APPLICATION_ERROR(
            -20002,
            'Insufficient funds in Account ' || p_from_account_id ||
            '. Available: $' || v_from_balance ||
            ', Required: $'  || p_amount
        );
    END IF;

    -- Debit source account
    UPDATE Accounts
    SET    Balance       = Balance - p_amount,
           LastModified  = SYSDATE
    WHERE  AccountID     = p_from_account_id;

    -- Credit destination account
    UPDATE Accounts
    SET    Balance       = Balance + p_amount,
           LastModified  = SYSDATE
    WHERE  AccountID     = p_to_account_id;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE(
        'SUCCESS: Transferred $' || p_amount ||
        ' from Account ' || p_from_account_id ||
        ' to Account '   || p_to_account_id
    );

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('TRANSFER FAILED: ' || SQLERRM);
END SafeTransferFunds;
/

-- ---- TEST BLOCK ----
BEGIN
    DBMS_OUTPUT.PUT_LINE('=== Test SafeTransferFunds ===');

    -- Valid transfer
    DBMS_OUTPUT.PUT_LINE('-- Test 1: Valid transfer $200 from Acc 4 to Acc 1 --');
    SafeTransferFunds(4, 1, 200);

    -- Insufficient funds
    DBMS_OUTPUT.PUT_LINE('-- Test 2: Transfer $999999 (insufficient) --');
    SafeTransferFunds(1, 2, 999999);

    -- Negative amount
    DBMS_OUTPUT.PUT_LINE('-- Test 3: Negative amount --');
    SafeTransferFunds(1, 2, -100);
END;
/
