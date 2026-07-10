-- ============================================================
-- Advanced SQL Exercises - Online Retail Store
-- Exercise 1: Ranking and Window Functions
-- Goal: Use ROW_NUMBER(), RANK(), DENSE_RANK(), OVER(), PARTITION BY
-- Scenario: Find top 3 most expensive products in each category
-- ============================================================

-- STEP 1: Create Products Table
CREATE TABLE Products (
    ProductID   INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category    VARCHAR(50),
    Price       DECIMAL(10,2)
);

-- STEP 2: Insert Sample Data
INSERT INTO Products (ProductID, ProductName, Category, Price) VALUES
(1,  'Laptop Pro',        'Electronics', 1500.00),
(2,  'Wireless Mouse',    'Electronics',   25.00),
(3,  'Mechanical Keyboard','Electronics',  75.00),
(4,  'Monitor 27"',       'Electronics',  300.00),
(5,  'USB Hub',           'Electronics',   40.00),
(6,  'Office Chair',      'Furniture',    450.00),
(7,  'Standing Desk',     'Furniture',    800.00),
(8,  'Bookshelf',         'Furniture',    200.00),
(9,  'Desk Lamp',         'Furniture',     60.00),
(10, 'File Cabinet',      'Furniture',    180.00),
(11, 'Notebook Pack',     'Stationery',    15.00),
(12, 'Gel Pens (10pk)',   'Stationery',    10.00),
(13, 'Stapler',           'Stationery',    20.00),
(14, 'Whiteboard',        'Stationery',    90.00),
(15, 'Sticky Notes',      'Stationery',     5.00);

-- ============================================================
-- STEP 3: Ranking Queries
-- ============================================================

-- ROW_NUMBER(): Assigns a unique sequential number within each category
-- Even if two products have same price, they get different numbers
SELECT
    ProductID,
    ProductName,
    Category,
    Price,
    ROW_NUMBER() OVER (PARTITION BY Category ORDER BY Price DESC) AS RowNum
FROM Products;

-- RANK(): Assigns same rank to ties, then SKIPS the next rank
-- e.g., if two products tie for rank 1, next rank is 3 (not 2)
SELECT
    ProductID,
    ProductName,
    Category,
    Price,
    RANK() OVER (PARTITION BY Category ORDER BY Price DESC) AS RankNum
FROM Products;

-- DENSE_RANK(): Assigns same rank to ties, but does NOT skip next rank
-- e.g., if two products tie for rank 1, next rank is 2 (not 3)
SELECT
    ProductID,
    ProductName,
    Category,
    Price,
    DENSE_RANK() OVER (PARTITION BY Category ORDER BY Price DESC) AS DenseRankNum
FROM Products;

-- ============================================================
-- STEP 4: Get Top 3 Most Expensive Products Per Category
-- Using ROW_NUMBER() inside a CTE/subquery
-- ============================================================
SELECT
    ProductID,
    ProductName,
    Category,
    Price,
    RowNum AS Rank
FROM (
    SELECT
        ProductID,
        ProductName,
        Category,
        Price,
        ROW_NUMBER() OVER (PARTITION BY Category ORDER BY Price DESC) AS RowNum
    FROM Products
) AS RankedProducts
WHERE RowNum <= 3
ORDER BY Category, RowNum;

-- ============================================================
-- ANALYSIS:
-- ROW_NUMBER : Best when you need exactly N rows per group (no ties)
-- RANK       : Best when ties should share rank and next rank skips
-- DENSE_RANK : Best when ties should share rank but no gaps in ranking
-- PARTITION BY divides data into groups (like GROUP BY but for window fns)
-- ORDER BY inside OVER() controls the ranking order within each partition
-- ============================================================
