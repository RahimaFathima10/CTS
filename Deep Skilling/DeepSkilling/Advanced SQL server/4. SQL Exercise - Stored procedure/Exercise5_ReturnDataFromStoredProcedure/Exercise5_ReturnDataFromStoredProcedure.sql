-- ============================================================
-- SQL Exercise - Stored Procedures
-- Exercise 5: Return Data from a Stored Procedure
-- Goal: Create a stored procedure that returns the total
--       number of employees in a given department
-- Schema: Employee Management System (same as Exercise 1)
-- ============================================================

-- NOTE: Run Exercise1_CreateStoredProcedure.sql first
-- to create the tables and insert sample data before running this.

-- STEP 1: Create the Stored Procedure sp_GetEmployeeCountByDept
-- Returns the count of employees in the specified department
CREATE PROCEDURE sp_GetEmployeeCountByDept
    @DepartmentID INT
AS
BEGIN
    SELECT
        d.DepartmentName,
        COUNT(e.EmployeeID) AS TotalEmployees
    FROM
        Employees e
        INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID
    WHERE
        e.DepartmentID = @DepartmentID
    GROUP BY
        d.DepartmentName;
END;

-- STEP 2: Execute the stored procedure for Department 3 (IT)
EXEC sp_GetEmployeeCountByDept @DepartmentID = 3;

-- STEP 3: Execute for all departments to verify counts
EXEC sp_GetEmployeeCountByDept @DepartmentID = 1;  -- HR
EXEC sp_GetEmployeeCountByDept @DepartmentID = 2;  -- Finance
EXEC sp_GetEmployeeCountByDept @DepartmentID = 4;  -- Marketing

-- ============================================================
-- EXPECTED OUTPUT for Department 3 (IT):
-- DepartmentName   TotalEmployees
-- IT               2
-- (Michael Johnson + Alice Brown both in DepartmentID = 3)
-- ============================================================
