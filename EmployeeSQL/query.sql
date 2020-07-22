-- Query tables 
select * 
from departments;

select * 
from titles;

select * 
from employees;

select * 
from dept_manager;

select * 
from dept_emp;

select * 
from salaries;

-- Query to list the following details of each employee: 
-- employee number, last name, first name, sex, and salary.
select 
	e.emp_no,
	e.last_name,
	e.first_name,
	e.sex,
	s.salary
from employees as e
	inner join salaries as s
		on e.emp_no = s.emp_no;

-- Query to list the first name, last name, and hire date for employees who were hired in 1986.
select
	first_name,
	last_name,
	hire_date
from employees
where date_part('year', hire_date) = '1986';

-- Query to list the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.
select
	m.dept_no,
	d.dept_name,
	m.emp_no,
	e.last_name,
	e.first_name
from dept_manager as m
	inner join departments as d
		on m.dept_no = d.dept_no
	inner join employees as e
		on m.emp_no = e.emp_no;

-- Query to list the department of each employee with the following information:
-- employee number, last name, first name, and department name.
select
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
from employees as e
	left join dept_emp as de
		on e.emp_no = de.emp_no
	inner join departments as d
		on de.dept_no = d.dept_no;

-- Query to list first name, last name, and sex for employees whose 
-- first name is "Hercules" and last names begin with "B."
select
	first_name,
	last_name,
	sex
from employees
where 
	(first_name like 'Hercules' 
	 	and last_name like 'B%');

-- Query to list all employees in the Sales department, including their employee number, last name, first name, and department name
select 
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
from employees as e
	left join dept_emp as de
		on e.emp_no = de.emp_no
	inner join departments as d
		on de.dept_no = d.dept_no
where 
	(d.dept_name = 'Sales');

-- Query to list all employees in the Sales and Development departments,
-- including their employee number, last name, first name, and department name.
select 
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
from employees as e
	left join dept_emp as de
		on e.emp_no = de.emp_no
	inner join departments as d
		on de.dept_no = d.dept_no
where 
	(d.dept_name = 'Sales' 
	 	or d.dept_name = 'Development');

-- Query to, in descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
select
	last_name,
	count(last_name) as last_name_count
from employees
group by last_name
order by last_name_count desc;



