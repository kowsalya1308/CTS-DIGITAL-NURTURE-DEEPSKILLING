-- Exercise 3: Stored Procedures

-- Scenario 1: Process monthly interest for all savings accounts.
CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest IS
BEGIN
    UPDATE accounts
    SET balance = balance * 1.01
    WHERE account_type = 'SAVINGS';
    COMMIT;
END;
/

-- Scenario 2: Update employee salary based on bonus percentage for a given department.
CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus(
    p_department_id IN NUMBER,
    p_bonus_pct    IN NUMBER
) IS
BEGIN
    UPDATE employees
    SET salary = salary + (salary * p_bonus_pct / 100)
    WHERE department_id = p_department_id;
    COMMIT;
END;
/

-- Scenario 3: Transfer funds between accounts with sufficient balance check.
CREATE OR REPLACE PROCEDURE TransferFunds(
    p_source_account_id      IN NUMBER,
    p_destination_account_id IN NUMBER,
    p_amount                 IN NUMBER
) IS
    v_source_balance accounts.balance%TYPE;
BEGIN
    SELECT balance INTO v_source_balance
    FROM accounts
    WHERE account_id = p_source_account_id
    FOR UPDATE;

    IF v_source_balance < p_amount THEN
        RAISE_APPLICATION_ERROR(-20001, 'Insufficient funds in source account.');
    END IF;

    UPDATE accounts
    SET balance = balance - p_amount
    WHERE account_id = p_source_account_id;

    UPDATE accounts
    SET balance = balance + p_amount
    WHERE account_id = p_destination_account_id;

    COMMIT;
END;
/
