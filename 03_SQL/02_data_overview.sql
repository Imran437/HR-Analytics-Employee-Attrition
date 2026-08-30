SELECT * FROM hr_employees
LIMIT 10;

-- Check the number of rows in hr data

SELECT COUNT(*) AS total_employees
FROM hr_employees;

-- View the table structure

DESCRIBE hr_employees;

-- Check unique values in different columns

SELECT DISTINCT attrition
FROM hr_employees;

SELECT DISTINCT department
FROM hr_employees;

SELECT DISTINCT business_travel
FROM hr_employees;

SELECT DISTINCT education_field
FROM hr_employees;

SELECT DISTINCT gender
FROM hr_employees;

SELECT DISTINCT job_role
FROM hr_employees;

SELECT DISTINCT marital_status
FROM hr_employees;

SELECT DISTINCT over_time
FROM hr_employees;

SELECT DISTINCT job_satisfaction
FROM hr_employees;

-- Insights - 

-- Total Number of rows are 1470.
-- Total number of columns are 32. In which 8 columns are String and other 24 columns are numerical.
