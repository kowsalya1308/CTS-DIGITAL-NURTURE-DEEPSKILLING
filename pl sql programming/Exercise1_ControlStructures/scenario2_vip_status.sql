-- =============================================================
-- FILE: scenario2_vip_status.sql
-- EXERCISE 1 - SCENARIO 2: Control Structures
-- PURPOSE: Iterate through all customers and set IsVIP = 'Y'
--          for those whose Balance exceeds $10,000.
-- =============================================================

SET SERVEROUTPUT ON;

DECLARE
    v_vip_count NUMBER := 0;
BEGIN
    DBMS_OUTPUT.PUT_LINE('=== Setting VIP Status for High-Balance Customers ===');

    FOR rec IN (SELECT CustomerID, Name, Balance FROM Customers) LOOP

        IF rec.Balance > 10000 THEN
            UPDATE Customers
            SET    IsVIP = 'Y'
            WHERE  CustomerID = rec.CustomerID;

            DBMS_OUTPUT.PUT_LINE(
                'VIP Promoted -> Customer: ' || rec.Name ||
                ' | Balance: $' || TO_CHAR(rec.Balance, '999,999.99')
            );
            v_vip_count := v_vip_count + 1;
        ELSE
            -- Ensure non-qualifying customers remain non-VIP
            UPDATE Customers
            SET    IsVIP = 'N'
            WHERE  CustomerID = rec.CustomerID;

            DBMS_OUTPUT.PUT_LINE(
                'Not VIP      -> Customer: ' || rec.Name ||
                ' | Balance: $' || TO_CHAR(rec.Balance, '999,999.99')
            );
        END IF;
    END LOOP;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('Total VIP customers: ' || v_vip_count);
    DBMS_OUTPUT.PUT_LINE('=== Done ===');

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('ERROR: ' || SQLERRM);
END;
/
