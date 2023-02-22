CREATE TABLE "department" (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_department" PRIMARY KEY (
        "dept_no"
     )
);

select *
from department;

CREATE TABLE "dept_emp" (
    "emp_no" VARCHAR   NOT NULL,
	"dept_no" VARCHAR   NOT NULL,
	CONSTRAINT "pk_dept_emp" PRIMARY KEY (emp_no, dept_no),
	CONSTRAINT "fk_dept_emp_department_dept_no" FOREIGN KEY("dept_no")
    REFERENCES "department" ("dept_no")
	
);

select *
from dept_emp;

CREATE TABLE "salaries" (
    "emp_no" VARCHAR   NOT NULL,
    "salary" INTEGER   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);
 
CREATE TABLE "titles" (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

select *
from titles;


CREATE TABLE "employees" (
    "emp_no" VARCHAR    NOT NULL,
    "emp_title" VARCHAR   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     ),
	
	CONSTRAINT "fk_employees_salaries_emp_no" FOREIGN KEY("emp_no")
	REFERENCES "salaries" ("emp_no"),
	CONSTRAINT "fk_employees_titles_title_id" FOREIGN KEY("emp_title")
	REFERENCES "titles" ("title_id")
	
);
select *
from employees;

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR   NOT NULL,
    "emp_no" VARCHAR    NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "emp_no"
     ),
	CONSTRAINT "fk_dept_manager_department_dept_no" FOREIGN KEY("dept_no")
	REFERENCES "department" ("dept_no"),
	CONSTRAINT "fk_dept_manager_employees_emp_no" FOREIGN KEY("emp_no")
	REFERENCES "employees" ("emp_no")
);

select *
from dept_manager;



