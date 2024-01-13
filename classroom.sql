CREATE DATABASE college;
USE college;

CREATE TABLE student(
roll_no INT PRIMARY KEY,
full_name VARCHAR(50),
marks INT NOT NULL,
grade VARCHAR(1),
city VARCHAR(20)
);
DROP TABLE student;
INSERT INTO student
(roll_no, full_name, marks, grade, city)
VALUES
(101,"CHIRANJIVI BASKOTA",73,"B","SURKHET"),
(102,"PRATIK RIJAL",75,"B","BARDIYA"),
(103,"NOBLE MALLA THAKURI",66,"B","KOHOLPUR"),
(104,"KARISHMA BOHORA",91,"A","SURKHET"),
(105,"LAXMAN SHARMA",69,"B","DAILEKH");

CREATE TABLE student(
student_id INT PRIMARY KEY,
name VARCHAR(50)
);

INSERT INTO student
(student_id, name)
VALUES
(101, "ADAM"),
(102, "BOB"),
(103, "CASEY");

CREATE TABLE courses(
student_id INT PRIMARY KEY ,
subject VARCHAR(50)
);

INSERT INTO courses
(student_id, subject)
VALUES
(102, "ENGLISH"),
(105, "MATH"),
(103, "SCIENCE"),
(107, "COMPUTER SCIENCE");



CREATE TABLE employee(
id INT NOT NULL,
name VARCHAR(50),
manager_id INT 
);

INSERT INTO employee
(id, name, manager_id)
VALUES
(101, "ADAM", 103),
(102, "BOB", 104),
(103, "CASEY", NULL),
(104, "DONALD", 103);

SELECT * FROM employee;

SELECT a.name as manager_name, b.name
FROM employee as a
JOIN employee as b
ON a.id = b.manager_id;

SELECT * FROM student
LEFT JOIN courses
ON student.student_id = courses.student_id;

SELECT name FROM student
UNION 
SELECT name FROM student;

SELECT AVG(marks) FROM student;

SELECT * FROM student
WHERE marks > 
(SELECT AVG(marks) FROM student);

SELECT full_name , roll_no FROM student
WHERE roll_no % 2 = 0;

SELECT * FROM student;

SELECT full_name, roll_no FROM student
WHERE roll_no IN ( SELECT roll_no FROM student WHERE roll_no % 2 = 0);

SELECT MAX(marks) FROM student
WHERE city = "BARDIYA";

SELECT MIN(marks) FROM (SELECT * FROM student
WHERE city = "SURKHET") AS temp;

SELECT (SELECT MAX(marks) FROM student) , full_name FROM student;
DROP VIEW view1;
CREATE VIEW view1 AS 
SELECT roll_no, full_name, marks FROM student;
SELECT * FROM view1
WHERE marks > 90;
