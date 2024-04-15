--DROP TABLE Attendances;
--DROP TABLE Students;
--DROP TABLE Class;

CREATE TABLE Students(
    Student_ID INT PRIMARY KEY, -- Primary Key mixes UNIQUE and NOT NULL
    First_Name VARCHAR(128),
    Last_Name VARCHAR(128),
    Email VARCHAR(256) UNIQUE,
    Age INT
);

CREATE TABLE Class(
    Class_ID INT PRIMARY KEY,
    Name VARCHAR(128),
    Year INT
);

CREATE TABLE Attendances(
    Student_ID INT REFERENCES Students(Student_ID),
    Class_ID INT REFERENCES Class(Class_ID),
    AttendingYear INT
);

SELECT * FROM Students;
SELECT * FROM Class;
SELECT * FROM Attendances;

INSERT INTO Students(Student_ID, First_Name, Last_Name, Email) VALUES (1, 'Anna', 'Verdi', 'verdi.1@test.com');
INSERT INTO Students(Student_ID, First_Name, Last_Name, Email) VALUES (2, 'Mario', 'Rossi', 'rossi.2@test.com');

INSERT INTO Class(Class_ID, Name, Year) VALUES (1, 'Physics', 2024);
INSERT INTO Class(Class_ID, Name, Year) VALUES (2, 'Calculus II', 2024);

INSERT INTO Attendances(Student_ID, Class_ID, AttendingYear) VALUES
    (2, 1, 2024),
    (2, 2, 2024),
    (1, 1, 2024);

-- Query Execution Plan:
-- 1. FROM Table;
-- 2. JOIN;
-- 3. WHERE;
-- 4. GROUP BY;
-- 5. SELECT.

-- INNER JOIN
SELECT S.Student_ID, S.First_Name, S.Last_Name, A.Class_ID
FROM Students AS S
INNER JOIN Attendances AS A
ON S.Student_ID = A.Student_ID;

-- WHERE
SELECT S.Student_ID, S.First_Name, S.Last_Name, A.Class_ID, C.Name
FROM Students AS S
INNER JOIN Attendances AS A
INNER JOIN Class AS C ON A.Class_ID = C.Class_ID
ON S.Student_ID = A.Student_ID
WHERE C.Name LIKE '%Physics';

-- GROUP BY 
SELECT S.Student_ID, S.First_Name, S.Last_Name, A.Class_ID, C.Name
FROM Students AS S
INNER JOIN Attendances AS A
INNER JOIN Class AS C ON A.Class_ID = C.Class_ID
ON S.Student_ID = A.Student_ID
WHERE C.Name LIKE '%Physics'
GROUP BY C.Class_ID;