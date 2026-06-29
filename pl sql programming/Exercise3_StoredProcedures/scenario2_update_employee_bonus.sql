-- =============================================================
-- FILE: scenario2_update_employee_bonus.sql
-- EXERCISE 3 - SCENARIO 2: Stored Procedures
-- PURPOSE: UpdateEmployeeBonus adds a bonus percentage to
--          the salary of all employees in a given department.
-- =============================================================

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus (
    p_department  IN VARCHAR2,
    p_bonus_pct   IN NUMBER
) AS
    v_updated_count NUMBER := 0;
BEGIN
    IF p_bonus_pct <= 0 THEN
        RAISE_APPLICATION_ERROR(-20020, 'Bonus percentage must be greater than 0.');
    END IF;

    UPDATE Employees
    SET    Salary = ROUND(Salary + (Salary * p_bonus_pct / 100), 2)
    WHERE  UPPER(Department) = UPPER(p_department);

    v_updated_count := SQL%ROWCOUNT;

    IF v_updated_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE(
            'WARNING: No employees found in department: ' || p_department
        );
    ELSE
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(
            'SUCCESS: ' || p_bonus_pct || '% bonus applied to ' ||
            v_updated_count || ' employee(s) in [' || p_department || '] department.'
        );
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('ERROR: ' || SQLERRM);
END UpdateEmployeeBonus;
/

-- ---- TEST BLOCK ----
BEGIN
    DBMS_OUTPUT.PUT_LINE('=== Test UpdateEmployeeBonus ===');

    -- Valid department bonus
    DBMS_OUTPUT.PUT_LINE('-- Test 1: 15% bonus to IT department --');
    UpdateEmployeeBonus('IT', 15);

    -- Department that exists
    DBMS_OUTPUT.PUT_LINE('-- Test 2: 10% bonus to HR department --');
    UpdateEmployeeBonus('HR', 10);

    -- Non-existent department
    DBMS_OUTPUT.PUT_LINE('-- Test 3: Bonus for non-existent department --');
    UpdateEmployeeBonus('FINANCE', 20);
END;
/
