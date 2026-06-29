-- =============================================================
-- FILE: scenario2_calculate_monthly_installment.sql
-- EXERCISE 4 - SCENARIO 2: Functions
-- PURPOSE: Calculate monthly loan installment based on amount,
--          interest rate, and duration in years.
-- =============================================================

SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION CalculateMonthlyInstallment (
    p_loan_amount   IN NUMBER,
    p_interest_rate IN NUMBER,
    p_duration_yrs  IN NUMBER
) RETURN NUMBER AS
    v_monthly_rate NUMBER;
    v_months       NUMBER;
    v_installment  NUMBER;
BEGIN
    IF p_loan_amount IS NULL OR p_loan_amount <= 0
       OR p_duration_yrs IS NULL OR p_duration_yrs <= 0 THEN
        RETURN NULL;
    END IF;

    v_months := p_duration_yrs * 12;
    v_monthly_rate := NVL(p_interest_rate, 0) / 100 / 12;

    IF v_monthly_rate = 0 THEN
        v_installment := p_loan_amount / v_months;
    ELSE
        v_installment := p_loan_amount * v_monthly_rate /
                         (1 - POWER(1 + v_monthly_rate, -v_months));
    END IF;

    RETURN ROUND(v_installment, 2);
EXCEPTION
    WHEN OTHERS THEN
        RETURN NULL;
END CalculateMonthlyInstallment;
/

-- ---- TEST BLOCK ----
BEGIN
    DBMS_OUTPUT.PUT_LINE('=== Test CalculateMonthlyInstallment ===');
    DBMS_OUTPUT.PUT_LINE('Loan 5000 @ 5% for 5 yrs: $' || CalculateMonthlyInstallment(5000, 5, 5));
    DBMS_OUTPUT.PUT_LINE('Loan 10000 @ 0% for 2 yrs: $' || CalculateMonthlyInstallment(10000, 0, 2));
    DBMS_OUTPUT.PUT_LINE('Loan 7500 @ 6.5% for 3 yrs: $' || CalculateMonthlyInstallment(7500, 6.5, 3));
END;
/
