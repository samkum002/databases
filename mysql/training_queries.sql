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










