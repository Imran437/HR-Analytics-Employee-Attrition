-- Compensation Analysis

-- 1.  Monthly Income vs Attrition
-- Do employees who leave earn less on average?

SELECT attrition,
ROUND(AVG(monthly_income), 2) AS avg_salary
FROM hr_employees
GROUP BY attrition;


-- Percent Salary Hike vs Attrition
 
SELECT
attrition,
ROUND(AVG(percent_salary_hike), 2) AS avg_salary_hike
FROM hr_employees
GROUP BY attrition;

-- Stock option level vs Attrition

SELECT 
stock_option_level,
COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) AS employee_left,
COUNT(*) AS total_employees,
ROUND(
COUNT(CASE WHEN attrition = 'Yes' THEN 1 END)  * 100.0 / COUNT(*), 2
) AS attrition_rate
FROM hr_employees
GROUP BY stock_option_level
ORDER BY attrition_rate DESC; 


-- Key Findings
-- 1. Employees with lower salaries are more likely to leave the company.
-- 2. Lower salary hikes are associated with higher attrition.
-- 3. Employees with lower stock option levels show higher attrition rates.

-- Recommendations
-- 1. Review compensation packages for low-paid employees.
-- 2. Provide competitive salary hikes and performance-based incentives.
-- 3. Reassess stock option policies to improve employee retention.



