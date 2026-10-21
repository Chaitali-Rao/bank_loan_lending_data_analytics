USE bank_loan_analytics;

-- Numeric table was created from loan_applications_clean2.
-- Do not rerun the CREATE TABLE statement if the table exists.

SELECT COUNT(*) AS total_rows
FROM loan_applications_numeric;

DESCRIBE loan_applications_numeric;

-- Verify missing values after conversion.
SELECT
    SUM(bank_account_vintage_years IS NULL) AS missing_vintage,
    SUM(existing_emi_monthly_inr IS NULL) AS missing_emi,
    SUM(num_credit_inquiries_last_6m IS NULL) AS missing_inquiries
FROM loan_applications_numeric;