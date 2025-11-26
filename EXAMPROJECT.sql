CREATE DATABASE student_tracker;
USE student_tracker;


CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    dob DATE,
    gender VARCHAR(10),
    email VARCHAR(100),
    phone_number VARCHAR(15),
    address TEXT,
    admission_date DATE,
    department_id INT
);


CREATE TABLE faculty (
    faculty_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(15),
    department_id INT,
    experience INT
);


CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100),
    faculty_id INT
);


CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    enrollment_date DATE
);


CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    attendance_date DATE,
    status VARCHAR(10)
);


CREATE TABLE grades (
    grade_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    marks_obtained INT
);



INSERT INTO departments (department_name)
VALUES ('Computer Science'), ('Mechanical'), ('Electrical');

INSERT INTO students (name, dob, gender, email, phone_number, address, admission_date, department_id)
VALUES 
('Rahul', '2002-05-10', 'Male', NULL, '9876543210', 'Delhi', '2021-07-10', 1),
('Anjali', '2001-08-15', 'Female', 'anjali@gmail.com', '9123456789', 'Jaipur', '2020-07-10', 1);

INSERT INTO faculty (name, email, phone_number, department_id, experience)
VALUES 
('Dr Sharma', 'sharma@gmail.com', '9999999999', 1, 10),
('Mr Verma', 'verma@gmail.com', '8888888888', 2, 3);

INSERT INTO courses (course_name, faculty_id)
VALUES 
('Database Systems', 1),
('Thermodynamics', NULL);

INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES (1,1,'2023-01-10'), (2,1,'2023-01-10');

INSERT INTO attendance (student_id, course_id, attendance_date, status)
VALUES 
(1,1,'2024-01-01','Present'),
(1,1,'2024-01-02','Absent'),
(2,1,'2024-01-01','Present');

INSERT INTO grades (student_id, course_id, marks_obtained)
VALUES (1,1,95), (2,1,70);

INSERT INTO students (name, dob, gender) VALUES ('Amit','2003-01-01','Male');



UPDATE students SET phone_number = '7777777777' WHERE student_id = 1;

DELETE FROM students WHERE student_id = 3;



SELECT * FROM students WHERE department_id = 1;


SELECT * FROM grades ORDER BY marks_obtained DESC LIMIT 10;


SELECT student_id,
COUNT(CASE WHEN status='Present' THEN 1 END)/COUNT(*)*100 AS attendance_percentage
FROM attendance
GROUP BY student_id
HAVING attendance_percentage < 75;


SELECT * FROM grades
WHERE marks_obtained < 40 AND student_id IN (
    SELECT student_id FROM attendance
    GROUP BY student_id
    HAVING COUNT(CASE WHEN status='Present' THEN 1 END)/COUNT(*)*100 < 50
);


SELECT * FROM grades
WHERE marks_obtained > 90 OR student_id IN (
    SELECT student_id FROM attendance
    GROUP BY student_id
    HAVING COUNT(CASE WHEN status='Present' THEN 1 END) = COUNT(*)
);


SELECT * FROM faculty
WHERE faculty_id NOT IN (SELECT faculty_id FROM courses WHERE faculty_id IS NOT NULL);



SELECT c.*
FROM faculty f
RIGHT JOIN courses c ON f.faculty_id = c.faculty_id
WHERE f.faculty_id IS NULL;


SELECT s.*
FROM students s
LEFT JOIN grades g ON s.student_id = g.student_id
WHERE g.student_id IS NULL;


SELECT * FROM grades
WHERE marks_obtained > (SELECT AVG(marks_obtained) FROM grades);

SELECT * FROM courses
WHERE faculty_id IN (
    SELECT faculty_id FROM faculty WHERE experience >= 5
);


SELECT student_id FROM attendance
WHERE status = 'Absent'
GROUP BY student_id
HAVING COUNT(*) > 10;


SELECT MONTH(attendance_date) AS month FROM attendance;


SELECT name, TIMESTAMPDIFF(YEAR, admission_date, CURDATE()) AS years
FROM students;


SELECT DATE_FORMAT(attendance_date, '%d-%m-%Y') FROM attendance;


SELECT UPPER(name) FROM faculty;

SELECT TRIM(name) FROM students;


SELECT name, IFNULL(email, 'Email Not Provided') FROM students;


SELECT student_id, marks_obtained,
RANK() OVER (ORDER BY marks_obtained DESC) AS rank_no
FROM grades;



SELECT student_id,
SUM(CASE WHEN status='Present' THEN 1 ELSE 0 END) OVER (PARTITION BY student_id) AS total_present
FROM attendance;

SELECT enrollment_date,
COUNT(*) OVER (ORDER BY enrollment_date) AS running_total
FROM enrollments;


SELECT student_id, marks_obtained,
CASE
    WHEN marks_obtained > 90 THEN 'Excellent'
    WHEN marks_obtained BETWEEN 75 AND 90 THEN 'Good'
    ELSE 'Needs Improvement'
END AS performance
FROM grades;

SELECT student_id,
CASE
    WHEN COUNT(CASE WHEN status='Present' THEN 1 END)/COUNT(*)*100 > 80 THEN 'Regular'
    WHEN COUNT(CASE WHEN status='Present' THEN 1 END)/COUNT(*)*100 BETWEEN 50 AND 80 THEN 'Irregular'
    ELSE 'Defaulter'
END AS attendance_status
FROM attendance
GROUP BY student_id;