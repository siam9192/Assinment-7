-- Active: 1729097050946@@127.0.0.1@5432@university_db


-- Create Database 
CREATE DATABASE university_db;


-- Create students table
CREATE TABLE students(
student_id INT UNIQUE PRIMARY  KEY,
student_name VARCHAR(50) NOT NULL,
age INT NOT NULL,
email VARCHAR(50) NOT NULL,
frontend_mark INT,
backend_mark INT,
status VARCHAR(20)
);

-- Create course table
CREATE TABLE courses (
    course_id  INT UNIQUE PRIMARY KEY,
    course_name VARCHAR(200) NOT NULL,
    credits INT
);

-- Insert courses table data
INSERT INTO courses (course_id,course_name, credits)
VALUES
(1,'JavaScript', 3),
(2,'Next.js', 3),
(3,'Python', 4),
(4,'React', 3),
(5,'Node.js', 4),
(6,'TypeScript', 3),
(7,'GraphQL', 4);


-- Create enrollments table
CREATE TABLE enrollments (
    enrollment_id INT UNIQUE PRIMARY KEY,
    student_id INT REFERENCES students(student_id),
    course_id INT REFERENCES courses(course_id)
);


-- Insert enrollments table values

INSERT INTO enrollments (enrollment_id,student_id, course_id)
VALUES
(1,1, 1),
(2,1, 2),
(3,2, 1),
(4,3, 2);



-- Start query 



------ Query 1------
-- Insert student data in students table
INSERT INTO students (student_id,student_name,age,email,frontend_mark,backend_mark,status)
VALUES (1,'John Doe', 20, 'john.doe@example.com', 85, 90, NULL),
(2,'Jane Smith', 22, 'jane.smith@example.com', 88, 82, NULL),
(3,'Michael Johnson', 21, 'michael.johnson@example.com', 92, 87, NULL),
(4,'Emily Davis', 19, 'emily.davis@example.com', 78, 80, NULL),
(5,'Daniel Brown', 23, 'daniel.brown@example.com', 90, 85, NULL),
(6,'Sophia Wilson', 20, 'sophia.wilson@example.com', 84, 89, NULL);


------ Query 2------
-- Retrieve the names of all students who are enrolled in the course titled 'Next.js'.
SELECT student_name FROM (SELECT * FROM enrollments as e
INNER JOIN students as s ON s.student_id = e.student_id
INNER JOIN courses as c ON c.course_id = e.course_id) WHERE course_name = 'Next.js';




------ Query 3------
--  Update the status of the student with the highest total (frontend_mark + backend_mark) to 'Awarded'.
 UPDATE students SET "status" = 'Awarded'
 WHERE student_id = 
 (
    SELECT student_id FROM students ORDER BY (frontend_mark + backend_mark) DESC LIMIT 1
 );


------ Query 4------
-- Delete all courses that have no students enrolled.
DELETE FROM courses WHERE course_id NOT IN (SELECT course_id FROM enrollments
GROUP BY course_id)
;

------ Query 5------
-- Retrieve the names of students using a limit of 2, starting from the 3rd student.
SELECT student_name,student_id FROM students  student_id LIMIT 2 OFFSET 2 ; 


------ Query 6------
-- Retrieve the course names and the number of students enrolled in each course.
SELECT course_name,COUNT(student_id) AS students_enrolled 
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id,course_name ORDER BY  students_enrolled DESC;


------ Query 7------
-- Calculate and display the average age of all students.
SELECT avg(age) AS average_age FROM students;

------ Query 8------
-- Retrieve the names of students whose email addresses contain 'example.com'.

SELECT student_name FROM students WHERE email LIKE '%example.com%';
