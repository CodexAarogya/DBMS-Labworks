USE LAB2;
/* Sort the employee records in descending order. */
SELECT * FROM employee ORDER BY salary DESC;

/*Sort name and publication name in ascending order.*/
SELECT * FROM booklist ORDER BY name;
SELECT * FROM booklist ORDER BY publication ;

/*Display top three records from teachers relation.*/
SELECT TOP(3) * FROM teacher;

/*Display the sum of salaries of all employees.*/
SELECT sum(salary) AS sum_salary FROM employee;

/*Display the minimum salary of employee.*/
SELECT min(salary) AS min_salary FROM employee;

/*Display the average price of book written by same author.*/
SELECT AVG(price) as avg_price FROM  bookID GROUP BY author;

/*Display publication name and number of books published by it from book list relation publication wise.*/
SELECT publication, count(*) as total_books FROM booklist group by publication;

/*Display the bid and bname of books whose price is greater than average prices of book.*/
SELECT bid, bname FROM bookID WHERE price > (SELECT AVG(price) FROM bookID);

/*Find the bid, bname and author in ascending order where author name is started by “d”.*/
SELECT bid, bname, author FROM bookID  WHERE author LIKE 'd%' ORDER BY author;


/*Find the teachers name and book taken by him. The teacher’s salary who takes the book should be the maximum salary.*/
select employee.ename, a.bname from employee 
inner join
(select issues.iid,issues.name,bookID.bname from issues
inner join bookID
on issues.bid = bookID.bid) AS a
on employee.eid = a.iid
where employee.salary = (select max(salary) from employee);

/*Find the authors name who have written more than one book.*/
select author from bookID group by author
having count(bname) > 0;

