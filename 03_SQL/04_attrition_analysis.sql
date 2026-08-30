--  Target variable analysis (Attrition)

SELECT attrition,
COUNT(*) AS employee_count
FROM hr_employees
GROUP BY attrition;

-- 1. Attrition Percentage

SELECT attrition,
COUNT(*) * 100.0 / (
SELECT COUNT(*) FROM hr_employees
) AS attrition_pct
FROM hr_employees
GROUP BY attrition;

-- 2. Numerical summary

SELECT
    MIN(age) AS min_age,
    MAX(age) AS max_age,
    AVG(age) AS avg_age
FROM hr_employees;

-- 3. Monthly income summary

SELECT
    MIN(monthly_income) AS min_salary,
    MAX(monthly_income) AS max_salary,
    AVG(monthly_income) AS avg_salary
FROM hr_employees;

-- 4. Department analysis

SELECT department,
COUNT(*) AS employee_count
FROM hr_employees
GROUP BY department
ORDER BY employee_count DESC;

-- 5. Average salary by department

SELECT department,
AVG(monthly_income) AS avg_salary
FROM hr_employees
GROUP BY department
ORDER BY avg_salary DESC;

-- 6. Job role analysis

SELECT job_role,
COUNT(*) AS employee_count
FROM hr_employees
GROUP BY job_role
ORDER BY employee_count DESC;

-- Investigate Attrition


-- 6. Department vs Attrition
-- Which department has the highest attrition rate?
SELECT department,
COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) AS employees_left,
count(*) AS total_employees,
ROUND(
COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*), 2
) AS attrition_rate
FROM hr_employees
GROUP BY department
ORDER BY attrition_rate DESC;


-- 7. Top 2 departments with the highest attrition

WITH dept_attrition_rate AS(
SELECT 
department,
COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) AS employee_left,
COUNT(*) AS total_employees,
COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*) AS attrition_rate
FROM hr_employees
GROUP BY department
), 
ranking AS (
SELECT *,
DENSE_RANK() OVER(ORDER BY attrition_rate DESC) AS rnk
FROM dept_attrition_rate 
)
SELECT department, employee_left, total_employees, attrition_rate, rnk
FROM ranking
WHERE rnk <= 2;

-- 8. Salary Ranking

SELECT
employee_number,
job_role,
monthly_income,
DENSE_RANK() OVER ( ORDER BY monthly_income DESC) AS salary_rank
FROM hr_employees; 


-- 9. Create age groups

SELECT
CASE
WHEN age < 30 THEN 'Under 30'
WHEN age BETWEEN 30 AND 39 THEN '30-39'
WHEN age BETWEEN 40 AND 49 THEN '40-49'
WHEN age BETWEEN 50 AND 59 THEN '50-59'
ELSE '60+'
END AS age_group,
COUNT(*) AS total_employees
FROM hr_employees
GROUP BY age_group;

-- 10. Attrition by Age Group

SELECT
CASE
WHEN age < 30 THEN 'Under 30'
WHEN age BETWEEN 30 AND 39 THEN '30-39'
WHEN age BETWEEN 40 AND 49 THEN '40-49'
WHEN age BETWEEN 50 AND 59 THEN '50-59'
ELSE '60+'
END AS age_group,
COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) AS employee_left,
COUNT(*) AS total_employees,
ROUND(
COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*), 2
) AS attrition_rate
FROM hr_employees
GROUP BY age_group
ORDER BY attrition_rate DESC;


-- 11. Create Risk Segments

SELECT
employee_number,
CASE
WHEN over_time = 'Yes' 
AND job_satisfaction <= 2
AND years_since_last_promotion >= 5
THEN 'High Risk'
WHEN job_satisfaction <= 2
THEN 'Medium Risk'
ELSE 'Low Risk'
END AS risk_segments
FROM hr_employees;

-- 12. Experience

-- Years at Company vs Attrition

SELECT
attrition,
ROUND(AVG(years_at_company), 2) AS avg_years
FROM hr_employees
GROUP BY attrition;

-- 13. Total Working Years Vs Attrition

SELECT 
attrition,
ROUND(AVG(total_working_years), 2) AS avg_total_working_years
FROM hr_employees
GROUP BY attrition;
 

-- Education

-- 14.Education Vs Attrition

SELECT 
education,
COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) AS employee_left,
COUNT(*) AS total_employees,
ROUND(
COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*), 2
) AS attrition_rate
FROM hr_employees
GROUP BY education
ORDER BY attrition_rate DESC;

-- 15. Education Field Vs Attrition

SELECT
education_field,
COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) AS employee_left,
COUNT(*) AS total_employees,
ROUND(
COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*), 2
) AS attrition_rate
FROM hr_employees
GROUP BY education_field
ORDER BY attrition_rate DESC;


-- Key Findings
-- 1. Attritin percebntage is 16.12%.
-- 2. min age is 18, max is 60 and ave age is 36.93
-- 3. min salary is 1009 and max salary is 19999 and avg salary is 6502.93
-- 4. R & D has highest number of employees.
-- 5. In Sales dept avg salary is highest.
-- 6. Employees in Sales dept are more likely to leave.
-- 7. Top 2 dept with highest attrition are sales and HR.
-- 8. Find employee rank based on salary.
-- 9. Create age groups of employees.
-- 10. Employees who are under 30 more likely to leave.
-- 11. Create Risk segements based on over time, job satisfaction and promotion and find
-- High risk and Low risk employees.
-- 12. Employees are new to company are more likely to leave
-- 13. Employee who have less total working years are more likely to leave
-- 14. Employee who have high school edcation or diploma are more likely to leave.