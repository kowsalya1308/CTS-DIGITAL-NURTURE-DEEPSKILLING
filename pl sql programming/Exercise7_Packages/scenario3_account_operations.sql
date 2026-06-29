-- =============================================================
-- FILE: scenario3_account_operations.sql
-- EXERCISE 7 - SCENARIO 3: Packages
-- PURPOSE: AccountOperations package for opening, closing,
--          and computing total customer balance.
-- =============================================================

SET SERVEROUTPUT ON;

CREATE OR REPLACE PACKAGE AccountOperations AS
    PROCEDURE OpenAccount(
        p_account_id   IN NUMBER,
        p_customer_id  IN NUMBER,
        p_account_type IN VARCHAR2,
        p_balance      IN NUMBER
    );

    PROCEDURE CloseAccount(
        p_account_id IN NUMBER
    );

    FUNCTION GetTotalBalance(
        p_customer_id IN NUMBER
    ) RETURN NUMBER;
END AccountOperations;
/

CREATE OR REPLACE PACKAGE BODY AccountOperations AS
    PROCEDURE OpenAccount(
        p_account_id   IN NUMBER,
        p_customer_id  IN NUMBER,
        p_account_type IN VARCHAR2,
        p_balance      IN NUMBER
    ) IS
    BEGIN
        INSERT INTO Accounts (
            AccountID, CustomerID, AccountType, Balance, LastModified
        ) VALUES (
            p_account_id, p_customer_id, p_account_type, p_balance, SYSDATE
        );
        COMMIT;
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            DBMS_OUTPUT.PUT_LINE('ERROR: Account ID ' || p_account_id || ' already exists.');
        WHEN OTHERS THEN
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE('ERROR: ' || SQLERRM);
    END OpenAccount;

    PROCEDURE CloseAccount(
        p_account_id IN NUMBER
    ) IS
    BEGIN
        DELETE FROM Accounts
        WHERE  AccountID = p_account_id;

        IF SQL%ROWCOUNT = 0 THEN
            DBMS_OUTPUT.PUT_LINE('ERROR: Account ID ' || p_account_id || ' not found.');
        ELSE
            COMMIT;
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE('ERROR: ' || SQLERRM);
    END CloseAccount;

    FUNCTION GetTotalBalance(
        p_customer_id IN NUMBER
    ) RETURN NUMBER IS
        v_total_balance NUMBER;
    BEGIN
        SELECT SUM(Balance)
        INTO   v_total_balance
        FROM   Accounts
        WHERE  CustomerID = p_customer_id;

        RETURN NVL(v_total_balance, 0);
    EXCEPTION
        WHEN OTHERS THEN
            RETURN NULL;
    END GetTotalBalance;
END AccountOperations;
/

-- ---- TEST BLOCK ----
BEGIN
    DBMS_OUTPUT.PUT_LINE('=== Test AccountOperations Package ===');
    AccountOperations.OpenAccount(60, 1, 'Checking', 500);
    DBMS_OUTPUT.PUT_LINE('Total balance for customer 1: ' || AccountOperations.GetTotalBalance(1));
    AccountOperations.CloseAccount(60);
END;
/
