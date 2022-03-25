select job_title,max_salary-min_salary as salary_differences from jobs where max_salary between 10000 and 20000;
select first_name,hire_date from employees where job_id in ('it_prog','sa_man');
select * from employees where commission_pct is not null and salary between 5000 and 10000 and department_id=30 ;
select manager_id,count(*) from employees group by  manager_id;
select job_id,avg(salary) from employees group by job_id having avg(salary)>10000;