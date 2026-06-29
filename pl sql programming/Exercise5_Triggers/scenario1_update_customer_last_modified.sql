-- =============================================================
-- FILE: scenario1_update_customer_last_modified.sql
-- EXERCISE 5 - SCENARIO 1: Triggers
-- PURPOSE: Automatically update LastModified when a customer
--          record changes.
-- =============================================================

SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER UpdateCustomerLastModified
BEFORE UPDATE ON Customers
FOR EACH ROW
BEGIN
    :NEW.LastModified := SYSDATE;
END UpdateCustomerLastModified;
/

-- ---- TEST BLOCK ----
BEGIN
    UPDATE Customers
    SET    Balance = Balance + 1
    WHERE  CustomerID = 1;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Updated customer 1; LastModified should now be SYSDATE.');
END;
/
