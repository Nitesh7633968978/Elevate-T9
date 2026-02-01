CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);
INSERT INTO employees VALUES
(1, 'Nitesh', 'IT', 50000),
(2, 'Amit', 'HR', 40000),
(3, 'Riya', 'IT', 60000),
(4, 'Neha', 'Finance', 45000),
(5, 'Rahul', 'IT', 70000),
(6, 'Pooja', 'HR', 38000);
SELECT emp_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);
SELECT emp_name,
       salary,
       (SELECT AVG(salary) FROM employees) AS avg_salary
FROM employees;
SELECT department, avg_salary
FROM (
    SELECT department, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
) dept_avg
WHERE avg_salary > 50000;
SELECT emp_name, department, salary
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department = e.department
);
