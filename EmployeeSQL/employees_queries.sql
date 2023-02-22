/*
1. List the employee number, last name, first name, sex, and salary of each employee.
*/

select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees e
left join salaries s
on e.emp_no = s.emp_no
order by e.emp_no asc
;

/*
2. List the first name, last name, and hire date for the employees who were hired in 1986.
*/
select first_name, last_name, hire_date
from employees
where date_part('year', hire_date) = '1986'
order by last_name asc
;

/*
3. List the manager of each department along with their department number, 
department name, employee number, last name, and first name.
*/
select d.dept_no, ds.dept_name, d.emp_no, e.last_name, e.first_name
from dept_manager d
left join department ds
on d.dept_no = ds.dept_no
left join employees e
on d.emp_no = e.emp_no
order by d.dept_no asc
;

/*
4. List the department number for each employee along with that employee’s employee number,
last name, first name, and department name.
*/

select de.dept_no, d.dept_name, de.emp_no, e.last_name, e.first_name
from dept_emp de
left join department d
on de.dept_no = d.dept_no
left join employees e
on de.emp_no = e.emp_no
order by de.dept_no asc
;

/*
5. List first name, last name, and sex of each employee whose first name is Hercules 
and whose last name begins with the letter B.
*/
select first_name, last_name, sex
from employees
where first_name = 'Hercules' AND last_name LIKE 'B%'
;

/*
6. List each employee in the Sales department, including their employee number, last name, and first name.
*/
select e.emp_no, e.last_name, e.first_name
from department d
left join dept_emp de
on d.dept_no = de.dept_no
left join employees e
on de.emp_no = e.emp_no
where d.dept_name = 'Sales'
order by e.emp_no asc
;

/*
7. List each employee in the Sales and Development departments, 
including their employee number, last name, first name, and department name.
*/

select e.emp_no, e.last_name, e.first_name
from department d
left join dept_emp de
on d.dept_no = de.dept_no
left join employees e
on de.emp_no = e.emp_no
where d.dept_name = 'Sales' OR d.dept_name = 'Development'
order by e.emp_no asc
;

/*
8. List the frequency counts, in descending order, of all the employee last names 
(that is, how many employees share each last name).
*/

select last_name, count(distinct emp_no)
from employees
group by last_name
order by last_name desc
;