-- KPI's 

-- Total Employees

SELECT COUNT(*) AS total_employees
FROM hr_employees;

-- Employees Who left

SELECT COUNT(*) AS employee_left
FROM hr_employees
WHERE attrition = 'Yes'; 


-- Attrition Rate

SELECT
ROUND(
COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*), 2
) AS attrition_rate
FROM hr_employees;

-- Average Salary

SELECT
ROUND(AVG(monthly_income), 2) AS avg_salary
FROM hr_employees;


-- Average Age

SELECT 
ROUND(AVG(age), 2) AS avg_age
FROM hr_employees;

-- Average Experience

SELECT
    ROUND(AVG(total_working_years), 2) AS avg_experience
FROM hr_employees;



-- Insights - 

-- Total Employees are 1470.
-- Employees who left are 237.
-- Attrition rate is 16.12%.
-- Average Salary is 6502.93.
-- Average Age is 36.92 years.
-- Average Experience is 11.28 years.