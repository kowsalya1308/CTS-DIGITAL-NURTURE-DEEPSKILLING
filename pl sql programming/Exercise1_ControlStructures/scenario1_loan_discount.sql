-- =============================================================
-- FILE: scenario1_loan_discount.sql
-- EXERCISE 1 - SCENARIO 1: Control Structures
-- PURPOSE: Loop through all customers, check age > 60,
--          and apply a 1% discount to their loan interest rates.
-- =============================================================

SET SERVEROUTPUT ON;

DECLARE
    v_age        NUMBER;
    v_count      NUMBER := 0;
BEGIN
    DBMS_OUTPUT.PUT_LINE('=== Applying 1% Loan Interest Discount for Seniors (Age > 60) ===');

    -- Loop through every customer
    FOR rec IN (SELECT CustomerID, Name, DOB FROM Customers) LOOP

        -- Calculate age in completed years
        v_age := TRUNC(MONTHS_BETWEEN(SYSDATE, rec.DOB) / 12);

        IF v_age > 60 THEN
            -- Apply 1% discount to all loans belonging to this customer
            UPDATE Loans
            SET    InterestRate = InterestRate - 1
            WHERE  CustomerID   = rec.CustomerID
              AND  InterestRate  > 1;  -- Ensure rate doesn't go negative

            IF SQL%ROWCOUNT > 0 THEN
                DBMS_OUTPUT.PUT_LINE(
                    'Customer: ' || rec.Name ||
                    ' | Age: '   || v_age    ||
                    ' | Loans updated: ' || SQL%ROWCOUNT
                );
                v_count := v_count + 1;
            END IF;
        END IF;
    END LOOP;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('Discount applied for ' || v_count || ' senior customer(s).');
    DBMS_OUTPUT.PUT_LINE('=== Done ===');

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('ERROR: ' || SQLERRM);
END;
/
