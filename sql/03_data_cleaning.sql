USE bank_loan_analytics;

-- Run this CREATE TABLE statement only if the table
-- has not already been created.

CREATE TABLE loan_applications_clean2 AS
SELECT
    applicant_id,
    age,
    gender,
    marital_status,
    city_tier,
    state,
    employment_type,
    NULLIF(TRIM(bank_account_vintage_years), '')
        AS bank_account_vintage_years,
    monthly_income_inr,
    existing_loans_count,
    NULLIF(TRIM(existing_emi_monthly_inr), '')
        AS existing_emi_monthly_inr,
    credit_utilization_ratio_pct,
    NULLIF(TRIM(num_credit_inquiries_last_6m), '')
        AS num_credit_inquiries_last_6m,
    late_payments_last_12m,
    loan_amount_requested_inr,
    loan_tenure_months,
    loan_purpose,
    collateral_provided,
    cibil_score,
    interest_rate_offered_pct,
    default_risk_score,
    default_flag
FROM loan_applications_clean;

-- Verify the cleaned table.
SELECT COUNT(*) AS total_rows
FROM loan_applications_clean2;