SELECT employee_id , first_name , last_name , phone_number , department_id 
FROM   employees
SELECT DISTINCT department_id , job_id  
FROM employees
SELECT first_name || ' ' || last_name AS "FULL_NAME" , 
       phone_number || ' - ' || email AS "CONTACT_DETAILS"
FROM employees 
SELECT first_name , last_name , hire_date , salary , 
       salary * 12 AS "ANNUAL_SAL"
FROM employees
SELECT department_name , department_id , manager_id AS "MNG"
FROM  departments