-- ============================================================
-- SQL Exercise - Stored Procedures
-- Exercise 1: Create a Stored Procedure
-- Goal: Create sp_InsertEmployee to insert a new employee
-- Schema: Employee Management System
-- ============================================================

-- STEP 1: Create Departments Table
CREATE TABLE Departments (
    DepartmentID   INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

-- STEP 2: Create Employees Table
CREATE TABLE Employees (
    EmployeeID   INT PRIMARY KEY IDENTITY(1,1),
    FirstName    VARCHAR(50),
    LastName     VARCHAR(50),
    DepartmentID INT FOREIGN KEY REFERENCES Departments(DepartmentID),
    Salary       DECIMAL(10,2),
    JoinDate     DATE
);

-- STEP 3: Insert Sample Data
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Marketing');

INSERT INTO Employees (FirstName, LastName, DepartmentID, Salary, JoinDate) VALUES
('John',    'Doe',     1, 5000.00, '2020-01-15'),
('Jane',    'Smith',   2, 6000.00, '2019-03-22'),
('Michael', 'Johnson', 3, 7000.00, '2018-07-30'),
('Emily',   'Davis',   4, 5500.00, '2021-11-05');

-- STEP 4: Create the Stored Procedure sp_InsertEmployee
-- This procedure inserts a new employee into the Employees table
CREATE PROCEDURE sp_InsertEmployee
    @FirstName    VARCHAR(50),
    @LastName     VARCHAR(50),
    @DepartmentID INT,
    @Salary       DECIMAL(10,2),
    @JoinDate     DATE
AS
BEGIN
    INSERT INTO Employees (FirstName, LastName, DepartmentID, Salary, JoinDate)
    VALUES (@FirstName, @LastName, @DepartmentID, @Salary, @JoinDate);

    PRINT 'Employee inserted successfully.';
END;

-- STEP 5: Test the Stored Procedure
-- Insert a new employee using the stored procedure
EXEC sp_InsertEmployee
    @FirstName    = 'Alice',
    @LastName     = 'Brown',
    @DepartmentID = 3,
    @Salary       = 6500.00,
    @JoinDate     = '2023-06-01';

-- STEP 6: Verify the insertion
SELECT * FROM Employees;
