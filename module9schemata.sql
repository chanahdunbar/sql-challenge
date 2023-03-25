-- Use the provided information to create a table schema for each of the six CSV files. Be sure to do the following:
    -- Remember to specify the data types, primary keys, foreign keys, and other constraints.
    -- For the primary keys, verify that the column is unique. Otherwise, create a composite keyLinks to an external site., which takes two primary keys to uniquely identify a row.
    -- Be sure to create the tables in the correct order to handle the foreign keys.
    -- Import each CSV file into its corresponding SQL table.

DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

CREATE TABLE departments (
    dept_no VARCHAR NOT NULL,
    dept_name VARCHAR(30) NOT NULL,
    CONSTRAINT PK_departments PRIMARY KEY (dept_no)
);

CREATE TABLE dept_emp (
    emp_no VARCHAR NOT NULL,
    dept_no VARCHAR NOT NULL
);

CREATE TABLE dept_manager (
    dept_no VARCHAR NOT NULL,
    emp_no VARCHAR NOT NULL
);

CREATE TABLE titles (
    title_id VARCHAR NOT NULL,
    title VARCHAR(45) NOT NULL,
    CONSTRAINT PK_titles PRIMARY KEY (title)
);

CREATE TABLE employees (
    emp_no VARCHAR NOT NULL,
    emp_title_id VARCHAR NOT NULL,
    birth_date VARCHAR NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    sex VARCHAR NOT NULL,
    hire_date VARCHAR NOT NULL,
    CONSTRAINT PK_employees PRIMARY KEY (emp_no)
);

CREATE TABLE salaries (
    emp_no VARCHAR NOT NULL,
    salary INT NOT NULL
);

ALTER TABLE dept_emp ADD CONSTRAINT FK_dept_emp FOREIGN KEY (dept_no) REFERENCES departments(dept_no);
ALTER TABLE dept_emp ADD CONSTRAINT FK_emp FOREIGN KEY (emp_no) REFERENCES employees(emp_no);
ALTER TABLE dept_manager ADD CONSTRAINT FK_dept_manager FOREIGN KEY (dept_no) REFERENCES departments(dept_no);
ALTER TABLE dept_manager ADD CONSTRAINT FK_dept_manager FOREIGN KEY (emp_no) REFERENCES employees(emp_no);
ALTER TABLE employees ADD CONSTRAINT FK_employees FOREIGN KEY (emp_title_id) REFERENCES titles(title_id);
ALTER TABLE salaries ADD CONSTRAINT FK_salaries FOREIGN KEY (emp_no) REFERENCES dept_emp(emp_no);

SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;