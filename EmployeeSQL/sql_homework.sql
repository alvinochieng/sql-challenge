/* CREATE TABLE "Department" (
    "dept_no" varchar   NOT NULL,
    "dept_name" varchar   NOT NULL,
    CONSTRAINT "pk_Department" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Department_employee" (
    "emp_no" int   NOT NULL,
    "dept_no" varchar   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

CREATE TABLE "Department Manager" (
    "dept_no" varchar   NOT NULL,
    "emp_no" int   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

CREATE TABLE "employees" (
    "emp_no" int   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "gender" char(1)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Salaries" (
    "emp_no" int   NOT NULL,
    "salary" money   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

CREATE TABLE "Titles" (
    "emp_no" int   NOT NULL,
    "title" varchar   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

ALTER TABLE "Department_employee" ADD CONSTRAINT "fk_Department_employee_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "Department_employee" ADD CONSTRAINT "fk_Department_employee_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Department" ("dept_no");

ALTER TABLE "Department Manager" ADD CONSTRAINT "fk_Department Manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Department" ("dept_no");

ALTER TABLE "Department Manager" ADD CONSTRAINT "fk_Department Manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no"); */

-- QUESTION 1

-- CREATE VIEW emp_pay AS
SELECT e.emp_no, e.last_name, 
e.first_name, e.gender, s.salary
FROM "Salaries" s
INNER JOIN employees e 
ON e.emp_no = s.emp_no;

-- SELECT * FROM emp_pay;

-- QUESTION 2

-- SELECT * FROM employees WHERE date_part('year', hire_date) = 1986;

-- QUESTION 3 

SELECT first_name AS "first name", last_name AS "last name"
FROM employees
WHERE emp_no IN
(
	SELECT emp_no FROM "Department Manager" WHERE dept_no IN
	(
		SELECT dept_no FROM "Department"
	)
);

--QUESTION 5 
SELECT * FROM employees WHERE first_name = 'Hercules' AND last_name LIKE 'B%';