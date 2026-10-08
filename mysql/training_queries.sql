create schema training;

CREATE TABLE training.student (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT CHECK (age >= 16),
    city VARCHAR(50) NOT NULL
);

CREATE TABLE training.course (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price NUMERIC(10,2) CHECK (price >= 0),
    category VARCHAR(50)
);

SET search_path TO training;

CREATE TABLE enrolment (
    id INT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrolment_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (student_id) REFERENCES training.student(id),
    FOREIGN KEY (course_id) REFERENCES training.course(id)
);

SELECT table_name FROM information_schema.tables WHERE table_schema = 'training';

INSERT INTO student (id, name, age, city) VALUES
(1, 'Sameer', 20, 'Delhi'),
(2, 'Rahul', 21, 'Noida'),
(3, 'Priya', 19, 'Lucknow'),
(4, 'Aman', 22, 'Mumbai'),
(5, 'Neha', 20, 'Delhi');

INSERT INTO course (id, name, price, category) VALUES
(101, 'Java', 4999.00, 'Programming'),
(102, 'Python', 3999.00, 'Programming'),
(103, 'Database', 2999.00, 'Database'),
(104, 'Web Development', 5999.00, 'Development'),
(105, 'Data Structures', 4499.00, 'Programming');

INSERT INTO enrolment
(id, student_id, course_id, enrolment_date, status) VALUES
(1, 1, 101, '2026-09-01', 'Active'),
(2, 2, 102, '2026-09-03', 'Active'),
(3, 3, 103, '2026-09-05', 'Completed'),
(4, 1, 105, '2026-09-10', 'Active'),
(5, 4, 104, '2026-09-12', 'Dropped'),
(6, 5, 101, '2026-09-15', 'Active');

select * from student; 
select * from course; 
select * from enrolment;

select * from student where city = 'Delhi';
select * from course where price >= 1000.00;
update student set city = 'Ghaziabad' where id = 3;

alter table student add column email varchar(150);
alter table student drop column email;

select distinct city from student order by city desc;
select name,city from student order by id;

select id,name from student where age > 5;
select id,name from student where age > 5 and city = 'Delhi';
select id,name from student where age > 5 or city = 'Delhi';

select id,name from student where age > 5 or city in ('Delhi','mumbai') order by id;
select * from student where age between 5 and 20;

select * from student where name like 'A%';
select * from student where city is null;

select avg(price) from course;
select count(*) from student;
select count(*) from enrolment where status = 'Active'
SELECT category, AVG(price) FROM course GROUP BY category;
select category, sum(price) as total_price from course group by category order by total_price desc;

select name, course_id from student join enrolment on student.id = enrolment.student_id;
select name, enrolment_date, status from student join enrolment on student.id = enrolment.student_id;
select student.id,student.name,enrolment.status from student join enrolment on student.id = enrolment.student_id;

select student.id,student.name,course.category from student 
join enrolment on student.id = enrolment.student_id join course on course.id = enrolment.course_id where category = 'Programming';

select student.city,student.name,course.name,course.price 
from student join enrolment on student.id = enrolment.student_id join course on course.id = enrolment.course_id;

SELECT student.name, enrolment.status FROM student LEFT JOIN enrolment ON student.id = enrolment.student_id;

select student.id,student.name,course.name,enrolment.status from student 
left join enrolment on student.id = enrolment.student_id left join course on course.id = enrolment.course_id;

SELECT student.name, enrolment.status FROM student RIGHT JOIN enrolment ON student.id = enrolment.student_id;

SELECT student.name, enrolment.status FROM student FULL OUTER JOIN enrolment ON student.id = enrolment.student_id;

SELECT name, price FROM course WHERE price > (SELECT AVG(price) FROM course);
select name, price from course where price > (SELECT min(price) FROM course);

select student.name,course.price from student join enrolment on student.id = enrolment.student_id 
join course on course.id = enrolment.course_id where course.price > (SELECT min(course.price) FROM course);

SELECT * FROM enrolment WHERE course_id IN (SELECT id FROM course WHERE category = 'Programming');

select * from student where id in (select id from enrolment where status = 'Active');

SELECT c1.name, c1.price, c1.category FROM course c1 
WHERE c1.price > (SELECT AVG(c2.price) FROM course c2 WHERE c2.category = c1.category);

SELECT s.name FROM student s WHERE EXISTS (SELECT 1 FROM enrolment e WHERE e.student_id = s.id);
SELECT s.name FROM student s WHERE NOT EXISTS (SELECT 1 FROM enrolment e WHERE e.student_id = s.id);




