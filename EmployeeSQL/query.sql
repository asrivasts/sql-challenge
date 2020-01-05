-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.emp_no AS "Employee Number", e.last_name AS "Last Name", e.first_name AS "First Name", e.gender AS "Gender", s.salary AS "Salary" FROM employees as e, salaries as s
WHERE e.emp_no = s.emp_no;

-- 2. List employees who were hired in 1986.
SELECT emp_no AS "Employee Number", last_name AS "Last Name", first_name AS "First Name", hire_date AS "Hire Date" 
FROM employees 
WHERE date_part('year', employees.hire_date) = 1986
ORDER BY hire_date;

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT d.dept_no, d.dept_name, e.last_name, e.first_name, mng.from_date, mng.to_date
FROM "Departments" as d
INNER JOIN dept_manager as mng on mng.dept_no = d.dept_no
JOIN employees as e on e.emp_no = mng.emp_no
ORDER BY d.dept_name;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT demp.emp_no AS "Employee Number", e.last_name AS "Last Name", e.first_name AS "First Name", d.dept_name AS "Department Name"
FROM dept_emp AS demp
INNER JOIN employees AS e ON e.emp_no = demp.emp_no
JOIN "Departments" as d ON d.dept_no = demp.dept_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT emp_no as "Employee Number", last_name AS "Last Name", first_name AS "First Name"
FROM employees
WHERE first_name = 'Hercules' AND last_name like 'B%'
ORDER BY "Last Name";

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no AS "Employee Number", e.last_name AS "Last Name", e.first_name AS "First Name", d.dept_name AS "Department Name"
FROM dept_emp as demp
INNER JOIN "Departments" as d ON d.dept_no = demp.dept_no
JOIN employees as e ON e.emp_no = demp.emp_no
WHERE d.dept_name = 'Sales'
ORDER BY "Last Name", "First Name";

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no AS "Employee Number", e.last_name AS "Last Name", e.first_name AS "First Name", d.dept_name AS "Department Name"
FROM dept_emp as demp
INNER JOIN "Departments" as d ON d.dept_no = demp.dept_no
JOIN employees as e ON e.emp_no = demp.emp_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
ORDER BY "Department Name", "Last Name", "First Name";

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name AS "Last Name", COUNT(last_name) AS "Frequency" FROM employees
GROUP BY last_name
ORDER BY "Frequency" DESC;
