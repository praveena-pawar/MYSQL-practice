
CREATE DATABASE praveena;
USE praveena;
CREATE TABLE student (
rollno INT PRIMARY KEY,
  full_name VARCHAR(50),
  marks INT,
  grade CHAR(1),
  city VARCHAR(30),
  gender VARCHAR(10),
  age INT
  );
  
  INSERT INTO student VALUES
(101, 'Praveena', 83, 'C', 'Pune', 'Female', 20),
(102, 'Ravi Chavan', 90, 'A', 'Mumbai', 'Male', 21),
(103, 'Sneha', 80, 'C', 'Delhi', 'Female', 18),
(104, 'Arjun', 85, 'B', 'Bangalore', 'Male', 17),
(105, 'Meera', 95, 'A', 'Chennai', 'Female', 19),
(106, 'Karan', 85, 'C', 'Hyderabad', 'Male', 16),
(107, 'Santosh', 99, 'A', 'Banglore', 'Male', 19),
(108, 'Pavan', 97, 'A', 'Banglore', 'Male', 19),
(109, 'Rahul', 78, 'B', 'Pune', 'Male', 20),
(110, 'Aditi', 88, 'B', 'Delhi', 'Female', 18);


-- SQL Practice Set
-- Level 1 – Basic SELEC-- T & Filtering

-- Show all data from the students table.
     SELECT * FROM student;
     
-- Display only the full_name and marks of all students.
SELECT full_name, marks FROM student;

-- Show students whose marks are greater than 85.
SELECT * FROM student
WHERE marks > 85;

-- Show students who are from either Mumbai or Delhi
SELECT * FROM student
WHERE city = "mumbai" OR  city = "delhi";

-- Display students whose grade is not ‘A’
SELECT * FROM student
WHERE grade <> "A";

-- List students whose names start with the letter S.
SELECT * FROM student
WHERE full_name LIKE "s%";

-- Show all students sorted by marks in descending order.
SELECT * FROM student
ORDER BY marks DESC;

-- Display the top 3 students with the highest marks.
SELECT * FROM student
ORDER BY marks DESC 
LIMIT 3;



-- Level 2 – Aggregate Functions & GROUP BY

-- Show the total number of students in the table.
SELECT count(rollno) FROM student;

-- Display the average marks of all students.
SELECT avg(marks) from student;


-- Show the highest and lowest marks in the class.
SELECT * FROM student
ORDER BY marks DESC LIMIT 1;

SELECT * FROM student
ORDER BY marks LIMIT 1;



-- Display the grade-wise average marks.
SELECT grade, AVG(marks) 
FROM student
GROUP BY grade;


-- Show the city-wise count of students.
SELECT city, COUNT(rollno) FROM student
GROUP BY city;


-- Display the number of male and female students using GROUP BY gender.
SELECT gender, COUNT(gender) FROM student
GROUP BY gender;

-- Show the average age of students who scored above 85.
SELECT AVG(age) FROM student
WHERE marks > 85;



-- level 3 – Subqueries

-- Show the students who got marks greater than the class average.
SELECT * FROM student
WHERE marks > ( SELECT AVG(marks) FROM student);


-- Display the students who have the same age as any other student (duplicate ages)
SELECT * FROM student
WHERE age IN(SELECT age FROM student 
GROUP BY age
HAVING COUNT(*) > 1
);


-- Show students who have the maximum marks (use a subquery).
SELECT * FROM student
WHERE marks = (SELECT MAX(marks) FROM student);


-- List students whose marks are within 10 points of the top scorer.
SELECT * FROM student
WHERE marks >= (SELECT MAX(marks) FROM student) - 10;

-- Display students who have grades the same as the student named ‘Praveena’
SELECT * FROM student
WHERE grade = "c";



-- Create another table called courses:

SELECT grade FROM student
WHERE full_name = "praveena";


USE praveena;


CREATE TABLE courses (
  course_id INT PRIMARY KEY,
  course_name VARCHAR(50),
  instructor VARCHAR(50)
);

CREATE TABLE enrollments (
  rollno INT,
  course_id INT,
  FOREIGN KEY (rollno) REFERENCES student(rollno),
  FOREIGN KEY (course_id) REFERENCES courses(course_id)
);


INSERT INTO courses (course_id, course_name, instructor)
VALUES
(1, 'Database Systems', 'Dr. Sharma'),
(2, 'Web Development', 'Ms. Ritu'),
(3, 'Machine Learning', 'Mr. Raj'),
(4, 'Java Programming', 'Mrs. Nita'),
(5, 'Operating Systems', 'Mr. Kumar');


INSERT INTO enrollments (rollno, course_id)
VALUES
(101, 1),
(101, 2),
(102, 2),
(103, 1),
(104, 3),
(105, 4),
(106, 5),
(107, 3),
(108, 2);

SELECT * FROM enrollments;
SELECT * FROM courses;


SELECT * FROM courses as a
INNER JOIN enrollments as b
ON a.course_id = b.course_id;


-- practicing for exam 
ALTER TABLE student 
ADD COLUMN grades VARCHAR(2);
SELECT * FROM student;
ALTER TABLE student
DROP COLUMN grades;


-- DROP TABLE courses;



-- Show all students with their enrolled course names
SELECT * FROM student AS a
INNER JOIN enrollments AS b
ON a.rollno = b.rollno;

SELECT * FROM courses as p
INNER JOIN enrollments as q
ON p.course_id = q.course_id;


SELECT a.full_name, c.course_name
FROM student AS a
JOIN enrollments AS b ON a.rollno = b.rollno
JOIN courses AS c ON b.course_id = c.course_id;


-- Level 5 – Advanced / Real-World

-- Increase marks by 5 for all students with grade ‘C’.

-- UPDATE student
-- SET marks = marks + 5
-- WHERE grade = "c";

-- DELETE FROM student
-- WHERE marks < 60;

SELECT * FROM student
ORDER BY marks DESC
LIMIT 1 OFFSET 1;




 
