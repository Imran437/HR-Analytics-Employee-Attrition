-- Job Analysis

-- 1. Job Involvement Vs Attrition

SELECT
job_involvement,
COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) AS employee_left,
COUNT(*) AS total_employees,
ROUND(
COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*), 2
) AS attrition_rate
FROM hr_employees
GROUP BY job_involvement
ORDER BY attrition_rate DESC;

-- 2. Job Role vs Attrition

SELECT
job_role,
COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) AS employee_left,
COUNT(*) AS total_employees,
ROUND(
COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*), 2
) AS attrition_rate
FROM hr_employees
GROUP BY job_role
ORDER BY attrition_rate DESC;


-- Carrer Growth

-- 3. Years Since Last Promotion vs Attrition
-- Are employees leaving because they haven't been promoted?
SELECT attrition, 
ROUND(AVG(years_since_last_promotion),2) AS avg_years
FROM hr_employees
GROUP BY attrition;


-- 4. Job Level Vs Attrition
-- Are employees leaving because they haven't been promoted to junior level or mid level ?

SELECT
job_level,
COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) AS employee_left,
COUNT(*) AS total_employees,
ROUND(
COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*), 2
) AS attrition_rate
FROM hr_employees
GROUP BY job_level
ORDER BY attrition_rate DESC;


-- Key Findings
-- 1. Employees with low job involvement are more likely to leave.
-- 2. Sales Representatives have the highest attrition rate.
-- 3. Employees who have not received promotions for a long time show higher attrition.
-- 4. Entry-level employees are more likely to leave the company.

-- Recommendations
-- 1. Increase employee engagement and participation.
-- 2. Investigate the reasons behind high attrition among Sales Representatives.
-- 3. Provide clear career growth and promotion opportunities.
-- 4. Offer mentoring and training programs for entry-level employees.




