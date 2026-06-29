-- =============================================================
-- FILE: scenario3_add_new_customer.sql
-- EXERCISE 2 - SCENARIO 3: Error Handling
-- PURPOSE: Stored procedure AddNewCustomer that inserts a new
--          customer, handling duplicate CustomerID gracefully.
-- =============================================================

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE AddNewCustomer (
    p_customer_id IN NUMBER,
    p_name        IN VARCHAR2,
    p_dob         IN DATE,
    p_balance     IN NUMBER
) AS
BEGIN
    -- Attempt to insert new customer
    INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified, IsVIP)
    VALUES (p_customer_id, p_name, p_dob, p_balance, SYSDATE, 'N');

    COMMIT;
    DBMS_OUTPUT.PUT_LINE(
        'SUCCESS: Customer added -> ID: ' || p_customer_id ||
        ' | Name: ' || p_name
    );

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        -- Duplicate primary key — log and prevent insertion
        DBMS_OUTPUT.PUT_LINE(
            'ERROR: Customer with ID ' || p_customer_id ||
            ' already exists. Insertion prevented.'
        );
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('ERROR: ' || SQLERRM);
END AddNewCustomer;
/

-- ---- TEST BLOCK ----
BEGIN
    DBMS_OUTPUT.PUT_LINE('=== Test AddNewCustomer ===');

    -- New unique customer
    DBMS_OUTPUT.PUT_LINE('-- Test 1: Add new customer (ID 10) --');
    AddNewCustomer(10, 'Sarah Connor', TO_DATE('1995-04-12','YYYY-MM-DD'), 2000);

    -- Duplicate customer (ID 1 already exists)
    DBMS_OUTPUT.PUT_LINE('-- Test 2: Duplicate customer (ID 1) --');
    AddNewCustomer(1, 'Duplicate Person', TO_DATE('2000-01-01','YYYY-MM-DD'), 500);

    -- Add another new unique customer
    DBMS_OUTPUT.PUT_LINE('-- Test 3: Add another new customer (ID 11) --');
    AddNewCustomer(11, 'Tom Hardy', TO_DATE('1988-09-15','YYYY-MM-DD'), 5000);
END;
/
