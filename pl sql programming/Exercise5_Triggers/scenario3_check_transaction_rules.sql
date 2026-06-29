-- =============================================================
-- FILE: scenario3_check_transaction_rules.sql
-- EXERCISE 5 - SCENARIO 3: Triggers
-- PURPOSE: Enforce withdrawal and deposit rules before transaction insert.
-- =============================================================

SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER CheckTransactionRules
BEFORE INSERT ON Transactions
FOR EACH ROW
DECLARE
    v_balance NUMBER;
BEGIN
    IF :NEW.TransactionType = 'Withdrawal' THEN
        SELECT Balance
        INTO   v_balance
        FROM   Accounts
        WHERE  AccountID = :NEW.AccountID;

        IF :NEW.Amount > v_balance THEN
            RAISE_APPLICATION_ERROR(
                -20040,
                'Withdrawal amount exceeds account balance. Account ' ||
                :NEW.AccountID || ', balance: $' || v_balance ||
                ', requested: $' || :NEW.Amount
            );
        END IF;
    ELSIF :NEW.TransactionType = 'Deposit' THEN
        IF :NEW.Amount <= 0 THEN
            RAISE_APPLICATION_ERROR(
                -20041,
                'Deposit amount must be positive. Amount: $' || :NEW.Amount
            );
        END IF;
    END IF;
END CheckTransactionRules;
/

-- ---- TEST BLOCK ----
BEGIN
    DBMS_OUTPUT.PUT_LINE('=== Test CheckTransactionRules ===');

    BEGIN
        INSERT INTO Transactions (TransactionID, AccountID, TransactionDate, Amount, TransactionType)
        VALUES (1000, 1, SYSDATE, 500, 'Withdrawal');
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Test withdrawal succeeded for transaction 1000.');
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Expected or actual failure: ' || SQLERRM);
            ROLLBACK;
    END;

    BEGIN
        INSERT INTO Transactions (TransactionID, AccountID, TransactionDate, Amount, TransactionType)
        VALUES (1001, 2, SYSDATE, -50, 'Deposit');
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Test deposit succeeded for transaction 1001.');
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Expected or actual failure: ' || SQLERRM);
            ROLLBACK;
    END;
END;
/
