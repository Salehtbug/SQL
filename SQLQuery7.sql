﻿CREATE DATABASE LibraryBook

SELECT TABLE_NAME 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_NAME = 'Books';

SELECT DB_NAME() AS CurrentDatabase;
SELECT name FROM sys.databases;
SELECT TABLE_NAME 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_NAME = 'Books';
SELECT TABLE_NAME 
FROM INFORMATION_SCHEMA.TABLES;

USE LibraryBook;
GO

CREATE TABLE Books (
    BookID INT PRIMARY KEY,              
    Title NVARCHAR(255) NOT NULL,        
    AuthorID INT,                        
    PublishedYear INT CHECK (PublishedYear >= 1500 AND PublishedYear <= YEAR(GETDATE())), 
    CopiesAvailable INT DEFAULT 0,       
    BookCategory NVARCHAR(100)           
);

CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,          
    FirstName NVARCHAR(100) NOT NULL,  
    LastName NVARCHAR(50) NOT NULL,    
    BirthYear INT CHECK (BirthYear >= 1000 AND BirthYear <= YEAR(GETDATE())) 
);


SELECT * FROM Books;
SELECT * FROM Authors;

INSERT INTO Books (BookID, Title, AuthorID, PublishedYear, CopiesAvailable, BookCategory) 
VALUES
(1, N'مائة عام من العزلة', 1, 1967, 5, N'رواية'),
(2, N'الأيام', 2, 1929, 3, N'سيرة ذاتية');

INSERT INTO Authors (AuthorID, FirstName, LastName, BirthYear) 
VALUES
(1, N'نجيب', N'محفوظ', 1911), 
(2, N'غسان', N'كنفاني', 1936); 

SELECT Books.BookID, Books.Title, Authors.FirstName, Authors.LastName, Books.PublishedYear
FROM Books
JOIN Authors ON Books.AuthorID = Authors.AuthorID
ORDER BY Books.PublishedYear ASC;

SELECT Title, CopiesAvailable 
FROM Books 
ORDER BY CopiesAvailable ASC;

SELECT AVG(PublishedYear) AS AveragePublicationYear FROM Books;
SELECT COUNT(*) AS TotalBooks FROM Books;

--delete books recored
DELETE FROM Books;
-- delete authers recored
DELETE FROM Books;
ALTER TABLE Authors 
ADD Email NVARCHAR(255) NULL,
    Phone_Number NVARCHAR(20) NULL;

	-- add new data 
UPDATE Authors 
SET Email = 'naguib.mahfouz@gmail.com', 
    Phone_Number = '+9627965039' 
WHERE AuthorID = 1;

UPDATE Authors 
SET Email = 'ghassan.kanafani@gmail.com', 
    Phone_Number = '+9627965039' 
WHERE AuthorID = 2;


