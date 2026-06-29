-- =============================================================
-- FILE: scenario1_calculate_age.sql
-- EXERCISE 4 - SCENARIO 1: Functions
-- PURPOSE: Calculate age in years from customer date of birth.
-- =============================================================

SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION CalculateAge (
    p_dob IN DATE
) RETURN NUMBER AS
    v_age NUMBER;
BEGIN
    IF p_dob IS NULL THEN
        RETURN NULL;
    END IF;

    v_age := TRUNC(MONTHS_BETWEEN(SYSDATE, p_dob) / 12);

    IF v_age < 0 THEN
        v_age := 0;
    END IF;

    RETURN v_age;
EXCEPTION
    WHEN OTHERS THEN
        RETURN NULL;
END CalculateAge;
/

-- ---- TEST BLOCK ----
BEGIN
    DBMS_OUTPUT.PUT_LINE('=== Test CalculateAge ===');
    DBMS_OUTPUT.PUT_LINE('Age for DOB 1950-05-15: ' || CalculateAge(TO_DATE('1950-05-15', 'YYYY-MM-DD')));
    DBMS_OUTPUT.PUT_LINE('Age for DOB 1990-07-20: ' || CalculateAge(TO_DATE('1990-07-20', 'YYYY-MM-DD')));
    DBMS_OUTPUT.PUT_LINE('Age for NULL DOB: ' || NVL(TO_CHAR(CalculateAge(NULL)), 'NULL'));
END;
/
