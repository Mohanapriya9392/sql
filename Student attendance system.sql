CREATE DATABASE StudentAS;
USE StudentAS;

-- Table for storing student information
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    Class VARCHAR(50)
);

-- Table for storing attendance records
CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    AttendanceDate DATE,
    Status VARCHAR(10),  -- Example: 'Present', 'Absent', 'Late'
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);
INSERT INTO Students (StudentID, StudentName, Class) VALUES
(1, 'John Doe', '10A'),
(2, 'Jane Smith', '10A'),
(3, 'Alice Johnson', '10B');

INSERT INTO Attendance (StudentID, AttendanceDate, Status) VALUES
(1, '2025-08-23', 'Present'),
(2, '2025-08-23', 'Absent'),
(3, '2025-08-23', 'Present');
--- Query to Get Attendance for a Date
SELECT s.StudentName, s.Class, a.AttendanceDate, a.Status
FROM Attendance a
JOIN Students s ON a.StudentID = s.StudentID
WHERE a.AttendanceDate = '2025-08-23';

--- Query to Get Attendance Summary per Student
SELECT s.StudentName, s.Class,
    SUM(CASE WHEN a.Status = 'Present' THEN 1 ELSE 0 END) AS DaysPresent,
    SUM(CASE WHEN a.Status = 'Absent' THEN 1 ELSE 0 END) AS DaysAbsent,
    COUNT(a.AttendanceID) AS TotalDays
FROM Students s
LEFT JOIN Attendance a ON s.StudentID = a.StudentID
GROUP BY s.StudentID, s.StudentName, s.Class;


