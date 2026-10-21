--overall loan default rate
use bank_loan_analytics;
SELECT
    COUNT(*) AS total_applicants,
    SUM(default_flag = 1) AS defaulted_applicants,
    SUM(default_flag = 0) AS non_defaulted_applicants,
    ROUND(AVG(default_flag) * 100, 2) AS default_rate_pct
FROM loan_applications_numeric;

-- default rate by employment type
SELECT
    employment_type,
    COUNT(*) AS total_applicants,
    SUM(default_flag = 1) AS defaults,
    ROUND(AVG(default_flag) * 100, 2) AS default_rate_pct
FROM loan_applications_numeric
GROUP BY employment_type
ORDER BY default_rate_pct DESC;

-- default rate by loan purpose
SELECT
    loan_purpose,
    COUNT(*) AS total_applicants,
    SUM(default_flag = 1) AS defaults,
    ROUND(AVG(default_flag) * 100, 2) AS default_rate_pct
FROM loan_applications_numeric
GROUP BY loan_purpose
ORDER BY default_rate_pct DESC;

-- default rate by city tier
SELECT
    city_tier,
    COUNT(*) AS total_applicants,
    SUM(default_flag = 1) AS defaults,
    ROUND(AVG(default_flag) * 100, 2) AS default_rate_pct
FROM loan_applications_numeric
GROUP BY city_tier
ORDER BY default_rate_pct DESC;

-- Average income and loan amount by default status
SELECT
    default_flag,
    COUNT(*) AS applicants,
    ROUND(AVG(monthly_income_inr), 2) AS avg_monthly_income,
    ROUND(AVG(loan_amount_requested_inr), 2) AS avg_loan_amount,
    ROUND(AVG(existing_emi_monthly_inr), 2) AS avg_existing_emi,
    ROUND(AVG(cibil_score), 2) AS avg_cibil_score
FROM loan_applications_numeric
GROUP BY default_flag
ORDER BY default_flag;