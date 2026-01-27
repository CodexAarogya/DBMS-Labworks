USE lab2;

-- q1 perform join operation on teacher and employee table. display ename, faculty and salary
SELECT * FROM teacher, employee;
SELECT e.ename, t.faculty, e.salary FROM employee AS e
JOIN teacher AS t
ON t.T_id = e.eid;

-- q2 perform left join on booklist and bookid table
SELECT * FROM booklist
LEFT JOIN bookID
ON booklist.isbn = bookID.bid;

-- q3 perform right join on booklist and bookid table
SELECT * FROM booklist
RIGHT JOIN bookID
ON booklist.isbn = bookID.bid;

-- q4 perform full join on issues and student table
SELECT * FROM student, issues;
SELECT * FROM student
FULL OUTER JOIN issues
ON student.id = issues.iid;

-- q5 display employee name starts with 't' and contains sub string 'om'
SELECT * FROM employee;
SELECT ename FROM employee WHERE ename LIKE 't%' AND ename LIKE '%om%';

-- q6 display all employee who is also teacher
SELECT ename FROM employee
INNER JOIN teacher
ON employee.eid = teacher.T_id;

-- q7 display all employee except those are teacher
SELECT ename FROM employee WHERE employee.ename NOT IN 
(SELECT ename FROM employee
INNER JOIN teacher
ON employee.eid = teacher.T_id);

-- q8 create view employee_view which consists of eid, ename and salary as attributes
CREATE VIEW employee_view AS
SELECT eid, ename, salary FROM employee;

-- q9 display all records of employee_view just created
select * from employee_view;

select * from issues;
-- q10 delete from view records where salary is less than 29000 
DELETE FROM employee_view
where salary < 29000 and eid not in (select iid from issues where iid < 13)


CREATE PROCEDURE salary_increment AS
UPDATE employee
SET salary = salary + 1;

select salary from employee;
exec salary_increment;




