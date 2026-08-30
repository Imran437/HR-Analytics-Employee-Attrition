-- Personal Factor Analysis

-- 1. Marital status Vs Attrition

SELECT
marital_status,
COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) AS employee_left,
COUNT(*) AS total_employees,
ROUND(
COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*), 2
) AS attrition_rate
FROM hr_employees
GROUP BY marital_status
ORDER BY attrition_rate DESC; 

-- 2. Age Vs Attrition

SELECT
attrition, 
ROUND(AVG(age), 2) AS avg_age
FROM hr_employees
GROUP BY attrition;

-- Create age groups

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

-- Attrition by Age Group

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



-- 3. Gender Vs Attrition

SELECT 
gender,
COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) AS employee_left,
COUNT(*) AS total_employees,
ROUND(
COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*), 2
) AS attrition_rate
FROM hr_employees
GROUP BY gender
ORDER BY attrition_rate DESC;

-- 4. Distance from Home vs Attrition
-- Are employees who live farther away more likely to leave?
SELECT attrition,
ROUND(AVG(distance_from_home), 2) AS avg_distance
FROM hr_employees
GROUP BY attrition
ORDER BY avg_distance DESC;


-- Key Findings
-- 1. Single employees have higher attrition rates.
-- 2. Employees under 30 years old are more likely to leave.
-- 3. Male employees show a slightly higher attrition rate.
-- 4. Employees who live farther from the workplace tend to leave more often.

-- Recommendations
-- 1. Conduct further analysis to understand the needs of younger employees.
-- 2. Provide career development programs for early-career employees.
-- 3. Consider flexible work arrangements or transportation support.
-- 4. Investigate the underlying reasons for attrition across different demographic groups.


