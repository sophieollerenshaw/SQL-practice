CREATE DATABASE Hallam_College
USE Hallam_College
CREATE TABLE Student
(
Student_id varchar(50) PRIMARY KEY,
FirstName varchar(50) NOT NULL,
LastName varchar(50) NOT NULL,
class varchar(50) NOT NULL,
age int NOT NULL,
Guardian_Email varchar(50) NOT NULL,
fullName_classID varchar(50)
)

INSERT INTO Student 
VALUES ('A01', 'John', 'Turner', 'A', 3, 'p.turner@gmail.com'),
('A02', 'Robert', 'Harrison', 'B', 5, 'z.harrision@gmail.com'),
('A03', 'Paula', 'Ben', 'A', 3, 'A.ben@gmail.com'),
('A04', 'William', 'Carson', 'B', 6, 'b.carson@gmail.com'),
('A05', 'Geordie', 'Xavier', 'B', 7, 'T.Xavier@gmail.com'),
('A06', 'Harry', 'Fisher', 'C', 7, 'C.fisher@gmail.com'),
('A07', 'Peter', 'Kenneth', 'D', 9, 'C.Kenneth@gmail.com'),
('A08', 'Adrian', 'Smith', 'A', 4, 'A.Smith@gmail.com'),
('A09', 'Lois', 'Xavier', 'C', 8, 'T.xavier@gmail.com'),
('A10', 'Carl', 'Evans', 'B', 3, 'b.evans@gmail.com'),
('A11', 'Donald', 'Brown', 'D', 10, 'C.brown@gmail.com'),
('A12', 'Carman', 'Robbin', 'B', 5, 'B.Robbin@gmail.com'),
('A13', 'Paige', 'Tom', 'C', 9, 'J.Tom@gmail.com'),
('A14', 'Clinton', 'Bailey', 'E', 12, 'D.Bailey@gmail.com')

CREATE TABLE Class 
(Class_id varchar(50) PRIMARY KEY,
Class_Name varchar(50),
Class_Teacher varchar(50) )

INSERT INTO Class
VALUES ('C001', 'A', 'Jill'),
('C002', 'B', 'Amin'),
('C003', 'C', 'Sarah'),
('C004', 'D', 'Taylor')

CREATE TABLE Teachers
(FirstName varchar(50),
LastName varchar(50),
Teacher_Class varchar(50),
Teacher_email varchar(50) )

INSERT INTO Teachers
VALUES('Jill', 'Tom','A', 'JTom@hallamcollege.com'),
('Amin', 'Kabir','B', 'AKabir@hallamcollege.com'),
('Cooper', 'Hill','E', 'CHill@hallamcollege.com'),
('Thomas', 'Allen','', 'TAllen@hallamcollege.com'),
('Sarah', 'Young','C', 'SYoung@hallamcollege.com'),
('Taylor', 'Lewis','D', 'TLewis@hallamcollege.com'),
('White', 'Cook','', 'WCook@hallamcollege.com')

CREATE TABLE Subjects_
(Subject_id varchar(50),
Subject_Name varchar(50),
Subject_Class varchar(50),
Subject_Teacher varchar(50) )

INSERT INTO Subjects_
VALUES 
('MAT01', 'Maths', 'A', 'Jill'),
('ENG01', 'English', 'A', 'Amin'),
('HIST01', 'History', 'B', 'Cooper'),
('MUS01', 'Music', 'A', 'Thomas'),
('SCI01', 'Science', 'C', 'Sarah'),
('MAT02', 'Maths', 'B', 'Jill'),
('ENG02', 'English', 'B', 'Amin'),
('HIST02', 'History', 'C', 'Taylor'),
('MUS02', 'Music', 'B', 'Thomas'),
('SCI02', 'Science', 'D', 'Sarah'),
('MAT03', 'Maths', 'C', 'White'),
('ENG03', 'English', 'C', 'Amin'),
('MAT04', 'Maths', 'D', 'White'),
('ENG04', 'English', 'D', 'Amin'),
('HIST03', 'History', 'D', 'Taylor')
-- list of teachers and subjectid
SELECT DISTINCT Subject_Teacher FROM Subjects_;
SELECT DISTINCT Subject_id FROM Subjects_
--teachers who teach maths
SELECT Subject_Teacher FROM Subjects_ where Subject_Class = 'Maths'

--students older than 5
SELECT Student_id, FirstName, LastName, age  FROM Student WHERE age > 5;
-- students younger than 6 in class b
SELECT Student_id, FirstName, LastName FROM Student where age > 6 AND class ='B';


--teachers who teach english or history
SELECT DISTINCT Subject_Teacher FROM Subjects_ WHERE Subject_Name = 'History' OR Subject_Name = 'English' ;
--teachers who dont teach classes 
SELECT FirstName, LastName FROM Teachers WHERE Teacher_Class = '';
--list of students alphabetically by surname 
SELECT * FROM Student ORDER BY LastName ASC;
-- returns the oldest student
SELECT TOP 1 FirstName, LastName, age FROM Student ORDER BY age DESC 
-- youngest student
SELECT TOP 1 FirstName, LastName, age FROM Student ORDER BY age ASC
-- counting how many members of each class
SELECT COUNT(class) FROM student WHERE class = 'a'
SELECT COUNT(class) FROM student WHERE class = 'b'
SELECT COUNT(class) FROM student WHERE class = 'c'
SELECT COUNT(class) FROM student WHERE class = 'd'
-- return mean age of students
SELECT AVG(age) FROM Student

-- list of students within the right age range
SELECT FirstName, LastName FROM student WHERE class = 'a' AND age = 3 OR age =4 OR class = 'b' AND age = 5 OR AGE =6 OR class = 'c' and age = 7 or age =8 or class = 'd' and age = 9 or age = 10 or class = 'e' and age = 11 or age = 12
-- list of students outside age range
SELECT FirstName, LastName FROM student WHERE class = 'a' AND age != 3 OR age !=4 OR class = 'b' AND age = !5 OR AGE =!6 OR class = 'c' and age !=7 or age !=8 or class = 'd' and age != 9 or age != 10 or class = 'e' and age != 11 or age != 12

-- get student name and class id in one column
SELECT CONCAT(firstName, ' ', lastName, ' ', class) FROM student ;

CREATE VIEW classidcard AS
SELECT CONCAT(firstName, ' ', lastName, ' ') class FROM student ;

CREATE TABLE age_range
(class varchar(1), 
minAge INT, 
maxAge INT)
INSERT INTO age_range
VALUES('A', 3, 4),
('B', 5, 6),
('C', 7, 8),
('D', 9, 10),
('E', 11, 12)
SELECT * FROM age_range
--students who arent in the age range for their class 
SELECT student.firstName, student.class, student.age, minAge, maxAge FROM Student, age_range WHERE age <> minAge AND age <> maxAge
-- Students whos age is less than the min age for their class

CREATE VIEW year_above AS
SELECT student.firstName, student.class, student.age, minAge, maxAge, age_range.class FROM Student, age_range WHERE age < minAge AND age_range.class = Student.class

DROP VIEW year_above
DROP VIEW classidcard