-- Workload Analysis

-- 1. Overtime vs Attrition
-- Do employees who work overtime leave more often?
SELECT over_time,
COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) AS employees_left,
count(*) AS total_employees,
ROUND(
COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*), 2
) AS attrition_rate
FROM hr_employees
GROUP BY over_time
ORDER BY attrition_rate DESC;


-- 2. Business Travel vs Attrition
-- Do frequent travelers leave more often?
SELECT business_travel,
COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) AS employee_left,
COUNT(*) AS total_employees,
ROUND(
COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*), 2
)  AS attrition_rate
FROM hr_employees
GROUP BY business_travel
ORDER BY attrition_rate DESC;


-- Key Findings
-- 1. Employees who work overtime have significantly higher attrition rates.
-- 2. Employees who travel frequently are more likely to leave the company.

-- Recommendations
-- 1. Reduce overtime in departments with high attrition.
-- 2. Introduce flexible work arrangements to improve work-life balance.
-- 3. Review travel requirements and employee workloads.