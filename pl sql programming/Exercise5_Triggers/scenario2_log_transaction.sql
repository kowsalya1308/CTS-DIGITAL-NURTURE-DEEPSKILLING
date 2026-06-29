-- =============================================================
-- FILE: scenario2_log_transaction.sql
-- EXERCISE 5 - SCENARIO 2: Triggers
-- PURPOSE: Insert an AuditLog record whenever a transaction
--          is inserted.
-- =============================================================

SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER LogTransaction
AFTER INSERT ON Transactions
FOR EACH ROW
BEGIN
    INSERT INTO AuditLog (
        TransactionID,
        AccountID,
        Amount,
        TransactionType,
        LogMessage
    ) VALUES (
        :NEW.TransactionID,
        :NEW.AccountID,
        :NEW.Amount,
        :NEW.TransactionType,
        'Transaction inserted for Account ' || :NEW.AccountID ||
        ': ' || :NEW.TransactionType || ' of $' || :NEW.Amount
    );
END LogTransaction;
/

-- ---- TEST BLOCK ----
BEGIN
    INSERT INTO Transactions (TransactionID, AccountID, TransactionDate, Amount, TransactionType)
    VALUES (999, 1, SYSDATE, 100, 'Deposit');
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Inserted transaction 999; AuditLog entry should be created.');
END;
/
