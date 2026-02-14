USE	LAB2;

--Display student name, roll number, and book name for all students who have issued books.
select * from issues;
select * from booklist;
select * from student;

select a.name, a.roll, booklist.name from booklist 
join
(select * from student
join issues
on student.id = issues.iid) as a
on booklist.isbn = a.bid;

-- Show student name, batch, and date of issue for students who issued books after a given date.
select student.stu_name, student.batch, issues.date_of_issues from student
join issues
on student.id = issues.iid
WHERE issues.date_of_issues <= '2025-12-16';

-- Display employee name, designation date (dateofemployee), and book name for all employees who issued books.
select a.ename, a.date_of_employ, booklist.name as book_name from booklist,
(select employee.ename, employee.date_of_employ, issues.bid from employee
join issues
on employee.eid = issues.iid) as a
where a.bid = booklist.isbn;

-- List all books along with publication name using Book and Booklist.
select bname, publication from bookID
inner join booklist 
on bookID.bid = booklist.isbn;

-- Find the names of students who have issued more expensive books than the average book price.
select * from student;
select * from bookID;
select * from booklist;
select * from issues;

select a.bname, a.price, issues.name from issues
join
(select bid, bname, price from bookID
inner join booklist
on bookID.bid = booklist.isbn
where bookID.price > (select avg(price) from bookID)) as a
on issues.bid = a.bid;

--Display the highest priced book issued by any student.

select stu_name, price from bookID
join 
(select * from student
inner join issues
on student.id = issues.iid) as a
on bookID.bid = a.bid
where bookID.price = (select max(price) from bookID);

create procedure display_book
as
select a.name, booklist.name from booklist
inner join 
(select name, bid from student 
inner join issues
on student.id = issues.iid) as a
on a.bid = booklist.isbn;

exec display_book;

--Write a stored procedure to insert a new book into the Book table.
create procedure add_book
as
Insert into booklist
values
(1600, 'Physics', 'p_publication')

exec add_book;

--Write a stored procedure that returns the count of books issued by a given user (student/teacher).
create procedure count_book
as
select iid, count(bid) as total_issues from issues
group by iid;

exec count_book;

create procedure list_issue_name
as
select name from issues
where date_of_issues > '2000-12-12';

exec list_issue_name;