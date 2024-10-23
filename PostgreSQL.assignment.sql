-- Active: 1729097050946@@127.0.0.1@5432@university_db


-- Create Database 
CREATE DATABASE university_db;


-- Create students table
CREATE TABLE students(
student_id SERIAL PRIMARY KEY,
student_name VARCHAR(50) NOT NULL,
age INT NOT NULL,
email VARCHAR(50) NOT NULL,
frontend_mark INT,
backend_mark INT,
status VARCHAR(20)
);


-- Create course table
CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(200) NOT NULL,
    credits INT
);

-- Create enrollments table
CREATE TABLE enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(student_id),
    course_id INT REFERENCES courses(course_id)
);



-- Insert courses table values
INSERT INTO courses (course_name, credits)
VALUES
('JavaScript', 3),
('Python', 3),
('Next.js', 4),
('React', 3),
('Node.js', 4),
('TypeScript', 3),
('GraphQL', 4),
('Flask', 3),
('Django', 4),
('Angular', 3),
('Vue', 3),
('Svelte', 3),
('HTML', 2),
('CSS', 2),
('SQL', 3),
('MongoDB', 4),
('PostgreSQL', 3),
('Express', 3),
('Redux', 3),
('jQuery', 2);

-- Insert enrollments table values

INSERT INTO enrollments (student_id, course_id)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 10),
(10, 1);


-- Start query 




------ Query 1------
-- Insert student data in students table
INSERT INTO students (student_name,age,email,frontend_mark,backend_mark,status)
VALUES ('John Doe', 20, 'john.doe@example.com', 85, 90, NULL),
('Jane Smith', 22, 'jane.smith@example.com', 88, 82, NULL),
('Michael Johnson', 21, 'michael.johnson@example.com', 92, 87, NULL),
('Emily Davis', 19, 'emily.davis@example.com', 78, 80, NULL),
('Daniel Brown', 23, 'daniel.brown@example.com', 90, 85, NULL),
('Sophia Wilson', 20, 'sophia.wilson@example.com', 84, 89, NULL),
('Olivia Harris', 21, 'olivia.harris@example.com', 86, 81, NULL),
('William Thompson', 22, 'william.thompson@example.com', 89, 92, NULL),
('James White', 19, 'james.white@example.com', 79, 83, NULL),
('Isabella Martinez', 23, 'isabella.martinez@example.com', 91, 88, NULL);




------ Query 2------
-- Retrieve the names of all students who are enrolled in the course titled 'Next.js'.
SELECT student_name FROM (SELECT * FROM enrollments as e
INNER JOIN students as s ON s.student_id = e.student_id
INNER JOIN courses as c ON c.course_id = e.course_id) WHERE course_name = 'Next.js';




------ Query 3------
--  Update the status of the student with the highest total (frontend_mark + backend_mark) to 'Awarded'.
 UPDATE students SET status = 'Awarded'
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
SELECT student_name,student_id FROM students LIMIT 2 OFFSET 2; 


------ Query 6------
-- Retrieve the course names and the number of students enrolled in each course.

SELECT course_name,count(*) AS students_enrolled FROM enrollments AS e
INNER JOIN courses AS c 
ON e.course_id = c.course_id GROUP BY course_name
;


------ Query 6------
-- Calculate and display the average age of all students.
SELECT avg(age) AS average_age FROM students;

------ Query 7------
-- Retrieve the names of students whose email addresses contain 'example.com'.

SELECT * FROM students WHERE email LIKE '%example.com%';
