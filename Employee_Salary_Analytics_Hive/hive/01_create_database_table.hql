-- Employee Salary Analytics using Apache Hive
CREATE DATABASE IF NOT EXISTS employee_salary_analytics;
USE employee_salary_analytics;

DROP TABLE IF EXISTS employees;

CREATE EXTERNAL TABLE employees (
    employee_id INT,
    employee_code STRING,
    employee_name STRING,
    department STRING,
    job_role STRING,
    age INT,
    experience_years INT,
    annual_salary BIGINT,
    city STRING,
    gender STRING,
    joining_year INT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/<your-username>/employee_salary/input'
TBLPROPERTIES ('skip.header.line.count'='1');

-- Check that the data loaded:
SELECT * FROM employees LIMIT 10;
SELECT COUNT(*) AS total_employees FROM employees;
