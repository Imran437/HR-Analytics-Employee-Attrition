-- Satisfaction Analysis

-- 1. Job Satisfaction vs Attrition
-- Are employees with lower job satisfaction leaving more frequently?
SELECT 
job_satisfaction,
COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) AS employee_left,
COUNT(*) AS total_employees,
ROUND(
COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*), 2
) AS attrition_rate
FROM hr_employees
GROUP BY job_satisfaction
ORDER BY attrition_rate DESC;

-- 2. Environment Satisfaction vs Attrition

SELECT 
environment_satisfaction,
COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) AS employee_left,
COUNT(*) AS total_employees,
ROUND(
COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*), 2
) AS attrition_rate
FROM hr_employees
GROUP BY environment_satisfaction
ORDER BY attrition_rate DESC;

-- 3. Relationship Satisfaction vs Attrition

SELECT
relationship_satisfaction,
COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) AS employee_left,
COUNT(*) AS total_employees,
ROUND(
COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*), 2
) AS attrition_rate
FROM hr_employees
GROUP BY relationship_satisfaction
ORDER BY attrition_rate DESC;


-- 4. Work Life Balance vs Attrition
-- Does poor work-life balance increase attrition?
SELECT
work_life_balance,
COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) AS employees_left,
COUNT(*) AS total_employees,
ROUND(
COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*),2
) AS attrition_rate
FROM hr_employees
GROUP BY work_life_balance;


-- Key Findings
-- 1. Lower job satisfaction is associated with higher employee turnover.
-- 2. Lower environment satisfaction is linked to higher attrition.
-- 3. Employees with low relationship satisfaction are more likely to leave.
-- 4. Poor work-life balance contributes to employee turnover.

-- Recommendations
-- 1. Conduct employee satisfaction surveys regularly.
-- 2. Improve the workplace environment and employee engagement.
-- 3. Strengthen relationships between employees and managers.
-- 4. Promote initiatives that support work-life balance.


