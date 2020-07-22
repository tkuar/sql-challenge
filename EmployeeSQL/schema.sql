-- Create a table of departments
create table departments (
    dept_no varchar not null,
    dept_name varchar not null,
    primary key (dept_no)
);

-- Create a table of titles
create table titles (
	title_id varchar not null,
	title varchar not null,
	primary key (title_id)
);

-- Create a table of employees
create table employees (
    emp_no int not null,
    emp_title_id varchar not null,
    birth_date date not null,
    first_name varchar not null,
    last_name varchar not null,
    sex varchar not null,
    hire_date date not null,
	foreign key (emp_title_id) references titles (title_id),
	primary key (emp_no)
);

-- Create a table of department managers
create table dept_manager (
    dept_no varchar not null,
    emp_no int not null,
	foreign key (dept_no) references departments (dept_no),
	foreign key (emp_no) references employees (emp_no),
	primary key (dept_no, emp_no)
);

-- Create a table of department employees
create table dept_emp (
    emp_no int not null,
    dept_no varchar not null,
    foreign key (emp_no) references employees (emp_no),
	foreign key (dept_no) references departments (dept_no),
	primary key (emp_no, dept_no)
);

-- Create a table of salaries
create table salaries (
    emp_no int not null,
    salary int not null,
	foreign key (emp_no) references employees (emp_no),
	primary key (emp_no, salary)
);

-- Insert data into tables via importing csv files corresponding to each table located in data folder
-- NOTE: Make sure you import the data in the same order that the tables were created above
-- i.e. import departments.csv first, then titles.csv, then employees.csv, and so on

-- Query tables to make sure the imports worked correctly
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
