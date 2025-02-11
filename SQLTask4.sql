
CREATE DATABASE SchoolManagement;
USE SchoolManagement;


CREATE TABLE Students (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL,
    address VARCHAR(255)
);


CREATE TABLE FamilyInfo (
    id INT PRIMARY KEY,
    student_id INT NOT NULL,
    father_name VARCHAR(255),
    father_contact VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES Students(id)
);

CREATE TABLE Courses (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    resource VARCHAR(255)
);

CREATE TABLE Classes (
    id INT PRIMARY KEY,
    class_code VARCHAR(50) NOT NULL,
    room_number VARCHAR(50),
    schedule VARCHAR(255)
);


CREATE TABLE Assignments (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    due_date DATE,
    state VARCHAR(50) NOT NULL 
);


CREATE TABLE Attendance (
    id INT PRIMARY KEY,
    student_id INT NOT NULL,
    attendance_date DATE NOT NULL,
    type VARCHAR(50) NOT NULL, 
    reason VARCHAR(255),
    FOREIGN KEY (student_id) REFERENCES Students(id) 
);

CREATE TABLE Enrollment (
    id INT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Courses(id) ON DELETE CASCADE
);

CREATE TABLE Submissions (
    id INT PRIMARY KEY,
    student_id INT NOT NULL,
    assignment_id INT NOT NULL,
    submission_date DATE NOT NULL,
    state VARCHAR(50) NOT NULL,  
    FOREIGN KEY (student_id) REFERENCES Students(id) ON DELETE CASCADE,
    FOREIGN KEY (assignment_id) REFERENCES Assignments(id) ON DELETE CASCADE
);


INSERT INTO Enrollment (id, student_id, course_id) VALUES
(1, 1, 1), 
(2, 2, 1), 
(3, 3, 2), 
(4, 4, 3),
(5, 5, 1); 



INSERT INTO Students (id, name, date_of_birth, address) VALUES
(1, 'Ahmad Al-Masri', '2005-03-15', 'Amman, Jordan'),
(2, 'Omar Al-Fayez', '2006-07-22', 'Irbid, Jordan'),
(3, 'Sara Abu Khalil', '2007-01-10', 'Zarqa, Jordan'),
(4, 'Mohammad Al-Tamimi', '2005-05-30', 'Aqaba, Jordan'),
(5, 'Hala Al-Rawashdeh', '2006-09-18', 'Mafraq, Jordan');


INSERT INTO FamilyInfo (id, student_id, father_name, father_contact) VALUES
(1, 1, 'Mahmoud Al-Masri', '0791234567'),
(2, 2, 'Faisal Al-Fayez', '0782345678'),
(3, 3, 'Yousef Abu Khalil', '0773456789'),
(4, 4, 'Hassan Al-Tamimi', '0794567890'),
(5, 5, 'Abdullah Al-Rawashdeh', '0785678901');


INSERT INTO Courses (id, name, description, resource) VALUES
(1, 'Mathematics', 'Basic and advanced math concepts', 'math_textbook.pdf'),
(2, 'Science', 'Physics, Chemistry, and Biology', 'science_notes.docx'),
(3, 'English', 'Reading, Writing, and Grammar', 'english_course.pdf'),
(4, 'History', 'Jordanian and World History', 'history_book.pdf'),
(5, 'Computer Science', 'Programming and IT basics', 'cs_tutorial.docx');


INSERT INTO Classes (id, class_code, room_number, schedule) VALUES
(1, 'MATH101', 'A1', 'Sunday-Tuesday-Thursday 10:00AM - 11:30AM'),
(2, 'SCI102', 'B2', 'Monday-Wednesday 12:00PM - 1:30PM'),
(3, 'ENG103', 'C3', 'Sunday-Tuesday-Thursday 2:00PM - 3:30PM'),
(4, 'HIS104', 'D4', 'Monday-Wednesday 9:00AM - 10:30AM'),
(5, 'CS105', 'E5', 'Sunday-Tuesday-Thursday 4:00PM - 5:30PM');


INSERT INTO Assignments (id, name, description, due_date, state) VALUES
(1, 'Algebra Homework', 'Solve 20 algebra problems', '2024-02-20', 'pass'),
(2, 'Physics Lab Report', 'Write a report on motion experiments', '2024-02-22', 'failed'),
(3, 'Essay on Jordan History', 'Write a 1000-word essay', '2024-02-25', 'pass'),
(4, 'Computer Programming Task', 'Write a simple Python program', '2024-02-28', 'pass'),
(5, 'English Grammar Quiz', 'Complete a grammar test', '2024-02-27', 'failed');


INSERT INTO Attendance (id, student_id, attendance_date, type, reason) VALUES
(1, 1, '2024-02-10', 'absence', 'Medical reason'),
(2, 2, '2024-02-12', 'late', 'Traffic congestion'),
(3, 3, '2024-02-14', 'leaving', 'Family emergency'),
(4, 4, '2024-02-15', 'absence', 'Unwell'),
(5, 5, '2024-02-17', 'late', 'Missed the bus');

INSERT INTO Submissions (id, student_id, assignment_id, submission_date, state) 
VALUES (1, 1, 1, '2024-02-15', 'pass');


--1
SELECT * FROM Students
WHERE date_of_birth = 'YYYY-MM-DD';
--2
SELECT * FROM 
Courses WHERE name = 'Course Name';
--3
ALTER TABLE Students
ADD COLUMN email VARCHAR(255);
--4
INSERT INTO Students (id, name, date_of_birth, address, email) 
VALUES (6, 'Khalid Al-Zoubi', '2006-08-15', 'Madaba, Jordan', 'khalid@email.com');
--5
SELECT Students.id, Students.name, Students.date_of_birth 
FROM Students 
JOIN FamilyInfo ON Students.id = FamilyInfo.student_id;
--6
SELECT Students.id, Students.name, Students.date_of_birth, Students.address
FROM Students 
JOIN Enrollment ON Students.id = Enrollment.student_id
JOIN Courses ON Enrollment.course_id = Courses.id
WHERE Courses.name = 'Mathematics';
--7
SELECT Students.id, Students.name, Students.date_of_birth, Students.address, Assignments.name, Submissions.state
FROM Students
LEFT JOIN Submissions ON Students.id = Submissions.student_id
LEFT JOIN Assignments ON Submissions.assignment_id = Assignments.id;


SELECT * FROM Students;
SELECT * FROM Assignments;
SELECT * FROM Submissions;
SELECT * FROM Attendance;

SELECT * FROM Attendance WHERE type = 'leaving';

SELECT Students.id, Students.name, Students.date_of_birth, Students.address, Attendance.attendance_date, Attendance.type
FROM Students
LEFT JOIN Attendance ON Students.id = Attendance.student_id;




--8
--مش عارفه
