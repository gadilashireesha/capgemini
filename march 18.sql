# capgemini
CREATE TABLE Worker (
  WORKER_ID INTEGER PRIMARY KEY,
  FIRST_NAME TEXT NOT NULL,
  LAST_NAME TEXT NOT NULL,
  SALARY INT,
  JOINING_DATE Datetime,
  DEPARTMENT TEXT NOT NULL
);

INSERT INTO Worker VALUES (001, 'Monika','Arora',100000,'2014-02-20 09:00:00', 'HR'),(002, 'Niharika','Verma',80000,'2014-06-11 09:00:00', 'Admin'),(003, 'Vishal','Singhal',300000,'2014-02-20 09:00:00', 'HR'),(004, 'Amitabh','Singh',500000,'2014-02-00 09:00:00', 'Admin'),(005, 'Vivek','Bhati',500000,'2014-06-11 09:00:00', 'Admin'),(006, 'Vipul','Dian',200000,'2014-06-11 09:00:00', 'Account'),(007, 'Satish','Kumar',75000,'2014-01-20 09:00:00', 'Account'),(008, 'Geetika','Chauhan',90000,'2014-04-11 09:00:00', 'Admin');

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');
		
		
CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');
SELECT FIRST_NAME FROM Worker;
SELECT upper(FIRST_NAME) FROM Worker;
SELECT distinct DEPARTMENT FROM Worker;
SELECT substr(FIRST_NAME,1,3) FROM Worker;
Select INSTR(FIRST_NAME,'a') From Worker Where FIRST_NAME = 'Amitabh';
Select RTRIM( First_Name ) From Worker;
Select LTRIM( Department ) From Worker;
select distinct length( Department) from Worker;
Select REPLACE( First_Name, 'a', 'A') From Worker;
Select FIRST_NAME ||' ' || LAST_NAME as full_name From Worker;
select * from Worker order by First_Name asc;
select * from Worker order by First_Name asc , DEPARTMENT desc;
select * from Worker where First_Name="Vipul" or First_Name= "Satish";
select * from Worker where not  First_Name="Vipul" or First_Name= "Satish";
select * from Worker where DEPARTMENT="Admin";
select * from Worker where  First_Name like "a%";
select * from Worker where  First_Name like "%a";
select * from Worker where  First_Name like "%____h";
select * from Worker where SALARY between 100000 and 500000;
Select * From [vbo] Worker Where year(JOINING_DATE)=2014 and month(JOINING_DATE)=02;
select count(*) from Worker where  DEPARTMENT="Admin";
select First_Name,Last_Name from Worker where  SALARY>=50000 and SALARY<=100000;
SELECT DEPARTMENT, count(WORKER_ID) No_Of_Workers FROM worker GROUP BY DEPARTMENT ORDER BY No_Of_Workers DESC;
SELECT DISTINCT W.FIRST_NAME, T.WORKER_TITLE FROM Worker W INNER JOIN Title T ON W.WORKER_ID = T.WORKER_REF_ID AND T.WORKER_TITLE in ('Manager');
SELECT WORKER_TITLE, AFFECTED_FROM, COUNT(*) FROM Title GROUP BY WORKER_TITLE, AFFECTED_FROM HAVING COUNT(*) > 1;
SELECT * FROM Worker WHERE  (WORKER_ID% 2)!= 0;
SELECT * FROM Worker WHERE  (WORKER_ID% 2)== 0;
SELECT * INTO WorkerClone FROM Worker;
SELECT * FROM Worker INTERSECT SELECT * FROM Worker;
SELECT * FROM Worker MINUS (SELECT * FROM Title);
 SELECT current_timestamp;
 SELECT * FROM Worker ORDER BY Salary DESC LIMIT 10;
 SELECT Salary FROM Worker ORDER BY Salary DESC LIMIT 5;
 SELECT Salary FROM Worker W1 WHERE 4 = (SELECT COUNT( DISTINCT ( W2.Salary ) ) FROM Worker W2 WHERE W2.Salary >= W1.Salary);
 Select distinct W.WORKER_ID, W.FIRST_NAME, W.Salary  from Worker W, Worker W1  where W.Salary = W1.Salary and W.WORKER_ID != W1.WORKER_ID;
 Select max(Salary) from Worker where Salary not in (Select max(Salary) from Worker);
 select FIRST_NAME, DEPARTMENT from worker W where W.DEPARTMENT='HR' union all select FIRST_NAME, DEPARTMENT from Worker W1 where W1.DEPARTMENT='HR';
 SELECT * FROM Worker INTERSECT SELECT * FROM WorkerClone;
 SELECT * FROM WORKER WHERE WORKER_ID <= (SELECT count(WORKER_ID)/2 from Worker);
 SELECT DEPARTMENT, COUNT(WORKER_ID) as 'Number of Workers' FROM Worker GROUP BY DEPARTMENT HAVING COUNT(WORKER_ID) < 5;
 SELECT DEPARTMENT, COUNT(DEPARTMENT) as 'Number of Workers' FROM Worker GROUP BY DEPARTMENT;
 Select * from Worker where WORKER_ID = (SELECT max(WORKER_ID) from Worker);
 Select * from Worker where WORKER_ID = (SELECT min(WORKER_ID) from Worker);
 SELECT * FROM Worker WHERE WORKER_ID <=5 UNION SELECT * FROM (SELECT * FROM Worker W order by W.WORKER_ID DESC) AS W1 WHERE W1.WORKER_ID <=5;
 SELECT t.DEPARTMENT,t.FIRST_NAME,t.Salary from(SELECT max(Salary) as TotalSalary,DEPARTMENT from Worker group by DEPARTMENT) as TempNew  Inner Join Worker t on TempNew.DEPARTMENT=t.DEPARTMENT and TempNew.TotalSalary=t.Salary;
 SELECT distinct SALARY from worker a WHERE 3 >= (SELECT count(distinct Salary) from worker b WHERE a.Salary <= b.Salary) order by a.Salary desc;SELECT distinct Salary from worker a WHERE 3 >= (SELECT count(distinctSELECT distinct Salary from worker a WHERE 3 >= (SELECT count(distinct Salary) from worker b WHERE a.Salary <= b.Salary) order by a.Salary desc; Salary) from worker b WHERE a.Salary <= b.Salary) order by a.Salary desc;
 SELECT distinct Salary from worker a WHERE  1 >= (SELECT count(distinct Salary) from worker b WHERE a.Salary <= b.Salary) order by a.Salary desc;
 SELECT DEPARTMENT, sum(Salary) from worker group by DEPARTMENT;
 SELECT FIRST_NAME, SALARY from Worker WHERE SALARY=(SELECT max(SALARY) from Worker);
