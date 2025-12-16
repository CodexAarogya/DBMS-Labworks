/*
	TASKS:

- Create relation as below:
	employee (eid, ename, date_of_employee, salary)
	booklist (isbn, name, publication)
	bookID (bid, bname, author, price)
	issues (iid, name, date_of_issue)

-	Set default value for date_of_employee as jan-1-2008
-	assign bid and iid as foreign key
-	all prices of books must be less that 5000
-	ename, bname, name attribute of eacg relation must contain some value
-	insert any 4 records in each relation
-	display all records from all relation 
-	display all records of book whose price ranges from 250 to 500
-	display all records from booklist whose publication starts from 'E'
-	display all employee records whose name ends with 'ta'
-	display eid, ename from employee table whose name consists of exactly 5 characters.
-	display eid, ename from employee table where name starts with 'd' and salary greater than 10000
-	display isbn number, book name where booklist must not contain 1000
*/

CREATE DATABASE LAB2;
USE LAB2;

CREATE TABLE employee
(
	eid INT NOT NULL PRIMARY KEY,
	ename VARCHAR(30),
	date_of_employ DATE DEFAULT '2008-01-01',
	salary INT
);

CREATE TABLE booklist
(
	isbn INT NOT  NULL PRIMARY KEY,
	name VARCHAR(30),
	publication VARCHAR(30)
);

CREATE TABLE bookID
(
	bid INT NOT NULL PRIMARY KEY,
	bname VARCHAR(30),
	author VARCHAR(30),
	price INT
	FOREIGN KEY (bid)
	REFERENCES booklist(isbn)

);

CREATE TABLE issues
(
	iid INT NOT NULL PRIMARY KEY,
	name VARCHAR(30),
	date_of_issues DATE DEFAULT CURRENT_TIMESTAMP
	FOREIGN KEY (iid)
	REFERENCES employee(eid)

);

SELECT * FROM employee;
SELECT * FROM booklist;
SELECT * FROM bookID;
SELECT * FROM issues;

ALTER TABLE issues
ADD CONSTRAINT pk_ID PRIMARY KEY(iid);

INSERT INTO employee (eid,ename,salary)
VALUES
(11,'david',20000),
(12,'jack',20300),
(13,'john',40000),
(14,'thomas',36000),
(15,'frank',98100);

INSERT INTO issues(iid,name)
VALUES
(11,'david'),
(12,'jack'),
(13,'john'),
(14,'thomas'),
(15,'frank');

INSERT INTO booklist(isbn,name,publication)
VALUES
(1100,'mathematics','a_publication'),
(1200,'python','b_publication'),
(1300,'javaScript','c_publication'),
(1400,'database management','d_publication'),
(1500,'drawing','e_publication');

INSERT INTO bookID(bid,bname,author,price)
VALUES
(1100,'advance mathematics','author_a',100),
(1200,'python fundamentals','author_b',200),
(1300,'javaScript fundamentals','author_c',300),
(1400,'database management concept','author_d',400),
(1500,'drawing concepts','author_e',500);

SELECT * FROM bookID WHERE price BETWEEN 20 AND 500;

SELECT * FROM booklist WHERE publication LIKE 'E%';

SELECT * FROM employee WHERE ename LIKE '%n';

SELECT eid,ename FROM employee WHERE ename LIKE '_____';

SELECT eid,ename FROM employee WHERE ename LIKE 'd%' AND salary > 10000;

SELECT isbn, name FROM booklist	WHERE isbn NOT IN (1000);
