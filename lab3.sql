/*UPDATE QUERY, MULTI-TABLE QUERY AND SUB-QUERY*/

USE LAB2;
CREATE TABLE student
(
	id INT NOT NULL PRIMARY KEY,
	stu_name VARCHAR (30),
	roll INT,
	batch VARCHAR(10)
);

CREATE TABLE teacher
(
	T_id INT NOT NULL PRIMARY KEY,
	T_name VARCHAR (30),
	faculty VARCHAR(10)
);

INSERT INTO teacher
VALUES
(11, 'david', 'BCA'),
(12, 'jack', 'BCT'),
(13, 'john', 'BEI'),
(14, 'thomas', 'BEL'),
(15, 'frank', 'BEL');

INSERT INTO student
VALUES
(1,'patel', 10,'2080'),
(2,'madhav', 11,'2081'),
(3,'manoj', 12,'2070'),
(4,'aaruu', 13,'2060'),
(5,'don', 14,'2078');


SELECT * FROM bookID;
SELECT * FROM booklist;
SELECT * FROM employee;
SELECT * FROM issues;
SELECT * FROM teacher;

/*Find all bookname, publication and author name where publication is 'b_publication'.*/
SELECT bname as bookname, publication, name as author FROM booklist,bookID WHERE publication = 'a_publication';

/*Find the teachers name and faculty whose date of employee JAN1, 2015.*/
SELECT t.T_name, t.faculty FROM teacher as t, employee as e WHERE t.T_name = e.ename AND e.date_of_employ = '2008-01-01' 

/*find the employee name whose salary > 10000 and faculty is computer.*/
SELECT emp.ename, t.faculty FROM employee as emp, teacher as t	WHERE emp.salary > 10000 AND t.faculty = 'BCT' AND emp.ename = t.T_name;


/*INITIALLY GOT ERROR SINCE WE NEED TO MATCH THE AUTHOR'S NAME WITH TEACHER'S NAME SO RAN THIS QUERY */
UPDATE bookID
set author = 'david' WHERE bid = 1100;
UPDATE bookID
set author = 'jack' WHERE bid = 1200;
UPDATE bookID
set author = 'john' WHERE bid = 1300;
UPDATE bookID
set author = 'thomas' WHERE bid = 1400;
UPDATE bookID
set author = 'frank' WHERE bid = 1500;

/*Find techer's name and book name issues by teacher whose name starts with 's'*/
SELECT DISTINCT t.T_name, b.bname FROM teacher as t, bookID as b, issues as i WHERE t.T_name = b.author AND t.T_name LIKE 'd%';

/*Update all salary by 10%*/
UPDATE employee
set salary = 1.1*salary 

/*Find top 3 teachers with the highest salaries*/
SELECT TOP(3) salary, name FROM  (SELECT e.salary as salary, t.T_name as name FROM employee AS e
INNER JOIN teacher as t
ON e.ename = t.T_name) as a ORDER BY salary DESC; 

/*Display books that are written by teachers*/
SELECT t.T_name, b.bname FROM teacher as t, bookID as b WHERE t.T_name = b.author;