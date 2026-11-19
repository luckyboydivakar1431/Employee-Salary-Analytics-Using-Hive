USE employee_salary_analytics;

-- 1. Overall salary statistics
SELECT COUNT(*) AS employee_count,
       ROUND(AVG(annual_salary), 2) AS average_salary,
       MIN(annual_salary) AS minimum_salary,
       MAX(annual_salary) AS maximum_salary
FROM employees;

-- 2. Department-wise salary analysis
SELECT department,
       COUNT(*) AS employee_count,
       ROUND(AVG(annual_salary), 2) AS average_salary,
       MIN(annual_salary) AS minimum_salary,
       MAX(annual_salary) AS maximum_salary
FROM employees
GROUP BY department
ORDER BY average_salary DESC;

-- 3. Job-role-wise average salary
SELECT job_role,
       COUNT(*) AS employee_count,
       ROUND(AVG(annual_salary), 2) AS average_salary
FROM employees
GROUP BY job_role
ORDER BY average_salary DESC;

-- 4. Experience band vs average salary
SELECT CASE
         WHEN experience_years < 4 THEN '0-3 years'
         WHEN experience_years < 10 THEN '4-9 years'
         ELSE '10+ years'
       END AS experience_band,
       COUNT(*) AS employee_count,
       ROUND(AVG(annual_salary), 2) AS average_salary
FROM employees
GROUP BY CASE
           WHEN experience_years < 4 THEN '0-3 years'
           WHEN experience_years < 10 THEN '4-9 years'
           ELSE '10+ years'
         END
ORDER BY average_salary;

-- 5. Top 10 highest-paid employees
SELECT employee_code, employee_name, department, job_role, annual_salary
FROM employees
ORDER BY annual_salary DESC
LIMIT 10;

-- 6. City-wise employee count and average salary
SELECT city, COUNT(*) AS employee_count,
       ROUND(AVG(annual_salary), 2) AS average_salary
FROM employees
GROUP BY city
ORDER BY average_salary DESC;

-- 7. Hiring-year trend
SELECT joining_year, COUNT(*) AS employees_joined,
       ROUND(AVG(annual_salary), 2) AS average_salary
FROM employees
GROUP BY joining_year
ORDER BY joining_year;

-- 8. Rank departments by average salary
SELECT department, average_salary,
       DENSE_RANK() OVER (ORDER BY average_salary DESC) AS salary_rank
FROM (
    SELECT department, AVG(annual_salary) AS average_salary
    FROM employees
    GROUP BY department
) department_summary;
