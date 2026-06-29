-- =============================================================
-- FILE: scenario2_update_salary.sql
-- EXERCISE 2 - SCENARIO 2: Error Handling
-- PURPOSE: Stored procedure UpdateSalary that increases an
--          employee's salary by a given percentage.
--          Handles the case where the employee ID doesn't exist.
-- =============================================================

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE UpdateSalary (
    p_employee_id  IN NUMBER,
    p_percentage   IN NUMBER
) AS
    v_old_salary   NUMBER;
    v_new_salary   NUMBER;
    v_emp_name     VARCHAR2(100);
BEGIN
    -- Validate percentage
    IF p_percentage <= 0 THEN
        RAISE_APPLICATION_ERROR(-20010, 'Salary increment percentage must be positive.');
    END IF;

    -- Fetch employee (raises NO_DATA_FOUND if not found)
    SELECT Name, Salary
    INTO   v_emp_name, v_old_salary
    FROM   Employees
    WHERE  EmployeeID = p_employee_id;

    -- Calculate new salary
    v_new_salary := v_old_salary + (v_old_salary * p_percentage / 100);

    -- Update salary
    UPDATE Employees
    SET    Salary = v_new_salary
    WHERE  EmployeeID = p_employee_id;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE(
        'SUCCESS: Employee [' || v_emp_name || '] salary updated.' ||
        ' Old: $' || v_old_salary ||
        ' | New: $' || ROUND(v_new_salary, 2) ||
        ' (' || p_percentage || '% increase)'
    );

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE(
            'ERROR: Employee with ID ' || p_employee_id || ' does not exist.'
        );
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('ERROR: ' || SQLERRM);
END UpdateSalary;
/

-- ---- TEST BLOCK ----
BEGIN
    DBMS_OUTPUT.PUT_LINE('=== Test UpdateSalary ===');

    -- Valid update
    DBMS_OUTPUT.PUT_LINE('-- Test 1: 10% raise for Employee 1 --');
    UpdateSalary(1, 10);

    -- Employee not found
    DBMS_OUTPUT.PUT_LINE('-- Test 2: Employee 999 (does not exist) --');
    UpdateSalary(999, 15);

    -- Invalid percentage
    DBMS_OUTPUT.PUT_LINE('-- Test 3: Negative percentage --');
    UpdateSalary(2, -5);
END;
/
