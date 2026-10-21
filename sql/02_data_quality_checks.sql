USE bank_loan_analytics;

-- Check the original staging data.
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT applicant_id) AS unique_applicants
FROM loan_applications_staging;

-- Check duplicate applicant IDs.
SELECT applicant_id, COUNT(*) AS occurrences
FROM loan_applications_staging
GROUP BY applicant_id
HAVING COUNT(*) > 1;

-- Check missing values in important columns.
SELECT
    SUM(TRIM(age) = '' OR age IS NULL) AS missing_age,
    SUM(TRIM(monthly_income_inr) = ''
        OR monthly_income_inr IS NULL) AS missing_income,
    SUM(TRIM(cibil_score) = ''
        OR cibil_score IS NULL) AS missing_cibil,
    SUM(TRIM(default_flag) = ''
        OR default_flag IS NULL) AS missing_default_flag
FROM loan_applications_staging;

-- Check the default distribution.
SELECT default_flag, COUNT(*) AS applicant_count
FROM loan_applications_staging
GROUP BY default_flag;