CREATE SCHEMA SchoolDATA;

CREATE TABLE School.Teachers (
    ID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(20),
    HireDate DATE NOT NULL,
    Subject VARCHAR(100),
    Salary DECIMAL(10,2),
);


CREATE TABLE School.TeacherDetails (
    ID INT PRIMARY KEY ,
    TeacherID INT NOT NULL,
    Address VARCHAR(255),
    DateOfBirth DATE,
    Qualification VARCHAR(100),
    ExperienceYears INT ,
    Nationality VARCHAR(50),
    Bio TEXT,
    FOREIGN KEY (TeacherID) REFERENCES School.Teachers(ID) 
);

CREATE TABLE School.Courses (
    ID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    CourseCode VARCHAR(20) UNIQUE NOT NULL,
    Description TEXT,
    CreditHours INT,
    TeacherID INT,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    FOREIGN KEY (TeacherID) REFERENCES School.Teachers(ID)
);

CREATE TABLE School.Students (
    ID INT PRIMARY KEY ,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(20),
    DateOfBirth DATE NOT NULL,
    Address VARCHAR(255),
    EnrollmentDate DATE NOT NULL,
    Major VARCHAR(100),
    GuardianName VARCHAR(100),
    GuardianContact VARCHAR(20)
);

CREATE TABLE School.Enrollments (
    ID INT PRIMARY KEY ,
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    EnrollmentDate DATE NOT NULL,
    Grade VARCHAR(5), 
    FOREIGN KEY (StudentID) REFERENCES School.Students(ID) ,
    FOREIGN KEY (CourseID) REFERENCES School.Courses(ID) 
);



INSERT INTO School.Teachers (ID, FirstName, LastName, Email, PhoneNumber, HireDate, Subject, Salary)
VALUES 
(1, 'saleh', 'ababneh', 'saleh@gmail.com', '0777777', '2020-08-15', 'C#', 5000.00),
(2, 'anas', 'malkawi', 'anas@gmail.com', '0777777', '2018-09-10', 'HTML', 5500.00);


INSERT INTO School.TeacherDetails (ID, TeacherID, Address, DateOfBirth, Qualification, ExperienceYears, Nationality, Bio)
VALUES 
(1, 1, '123 bushra', '1999-07-13', 'BCS', 2, 'Jordanin', 'Experienced C# teacher.'),
(2, 2, '456 Malka', '1999-09-10', 'BCS', 1, 'Jordanin', 'Expert in HTML.');


INSERT INTO School.Courses (ID, CourseName, CourseCode, Description, CreditHours, TeacherID, StartDate, EndDate)
VALUES 
(1, 'C# 101', 'C#1', 'Basic C#', 3, 1, '2025-02-01', '2025-06-01'),
(2, 'HTML Fundamentals', 'HTML#1', 'Introduction to HTML', 4, 2, '2025-03-01', '2025-07-01');


INSERT INTO School.Students (ID, FirstName, LastName, Email, PhoneNumber, DateOfBirth, Address, EnrollmentDate, Major, GuardianName, GuardianContact)
VALUES 
(1, 'Firas', 'Abumalloh', 'Firas@gmail.com', '074104741', '1995-09-15', '789 Irbid', '2025-01-10', 'WebDeveloper', 'Ayman', '074125852'),
(2, 'Ammar', 'Omari', 'Ammar@gmail.com', '0741474147', '1996-11-25', '987 Irbid Street', '2025-01-12', 'AppDeveloper', 'Batool', '07945612387');


INSERT INTO School.Enrollments (ID, StudentID, CourseID, EnrollmentDate, Grade)
VALUES 
(1, 1, 1, '2025-02-05', 'A'),
(2, 2, 2, '2025-03-10', 'B+');


select * from School.Enrollments;
select * from School.Students;
select * from School.Courses;
select * from School.TeacherDetails;
select * from School.Teachers;