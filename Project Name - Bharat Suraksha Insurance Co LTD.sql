-- Project Name: "Bharat Suraksha Insurance Co. Ltd"

CREATE DATABASE InsuranceDB
USE InsuranceDB

--Table Customers
CREATE TABLE Customers
(
CustomerID INT PRIMARY KEY IDENTITY(1,1), -- Auto-increment starting from 1
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
Gender VARCHAR(10) CHECK (Gender IN ('Male', 'Female', 'Other')),
DOB DATE,
Email VARCHAR(100) UNIQUE,
Phone VARCHAR(15),
City VARCHAR(50)
)
INSERT INTO Customers VALUES('Ravi','Kumar','Male','1990-05-12','ravi.kumar@gmail.com','9876543210','Delhi'),
('Anita','Sharma','Female','1985-09-23','anita.sharma@gmail.com','9876543211','Mumbai'),
('Sunil','Verma','Male','1978-12-01','sunil.verma@gmail.com','9876543212','Chennai'),
('Priya', 'Gupta', 'Female', '1992-07-14', 'priya.gupta@example.com', '9876543213', 'Bangalore'),
('Amit', 'Singh', 'Male', '1988-04-18', 'amit.singh@example.com', '9876543214', 'Hyderabad'),
('Neha', 'Jain', 'Female', '1995-11-30', 'neha.jain@example.com', '9876543215', 'Kolkata'),
('Raj', 'Mehta', 'Male', '1982-03-08', 'raj.mehta@example.com', '9876543216', 'Ahmedabad'),
('Pooja', 'Rao', 'Female', '1987-10-22', 'pooja.rao@example.com', '9876543217', 'Pune'),
('Karan', 'Patel', 'Male', '1991-01-17', 'karan.patel@example.com', '9876543218', 'Surat'),
('Meena', 'Desai', 'Female', '1983-08-25', 'meena.desai@example.com', '9876543219', 'Jaipur')

SELECT * FROM Customers

-- Table Agents
CREATE TABLE Agents
(
AgentID INT PRIMARY KEY IDENTITY(1001,1),
AgentName VARCHAR(100),
Phone VARCHAR(15),
Email VARCHAR(100),
City VARCHAR(50)
)
INSERT INTO Agents VALUES('Suresh Iyer', '7894561230', 'suresh.iyer@insurance.com', 'Delhi'),
('Kavita Joshi', '7894561231', 'kavita.joshi@insurance.com', 'Mumbai'),
('Rohit Nair', '7894561232', 'rohit.nair@insurance.com', 'Chennai'),
('Deepa Menon', '7894561233', 'deepa.menon@insurance.com', 'Bangalore'),
('Arun Das', '7894561234', 'arun.das@insurance.com', 'Hyderabad'),
('Jyoti Singh', '7894561235', 'jyoti.singh@insurance.com', 'Kolkata'),
('Nitin Rao', '7894561236', 'nitin.rao@insurance.com', 'Ahmedabad'),
('Geeta Shah', '7894561237', 'geeta.shah@insurance.com', 'Pune'),
('Alok Jain', '7894561238', 'alok.jain@insurance.com', 'Surat'),
('Swati Kulkarni', '7894561239', 'swati.kulkarni@insurance.com', 'Jaipur')

SELECT * FROM Agents

DROP Table Agents   --Remove the Tables

--Table Policies
CREATE TABLE Policies
(
PolicyID INT PRIMARY KEY IDENTITY(2001,1),
PolicyType VARCHAR(50),
SumAssured DECIMAL(12,2),
Premium DECIMAL(10,2),
Tenure INT,
AgentID INT FOREIGN KEY REFERENCES Agents(AgentID)
)
INSERT INTO Policies VALUES('Life', 500000, 5000, 10, 1001),
('Health', 200000, 3000, 5, 1002),
('Motor', 300000, 2500, 3, 1003),
('Life', 1000000, 9000, 15, 1004),
('Health', 500000, 4500, 10, 1005),
('Motor', 200000, 2200, 2, 1006),
('Life', 750000, 6000, 12, 1007),
('Health', 300000, 3500, 7, 1008),
('Motor', 150000, 1800, 1, 1009),
('Life', 1200000, 10000, 20, 1010)

SELECT * FROM Policies

-- Table PolicyHolders
CREATE TABLE PolicyHolders
(
HolderID INT PRIMARY KEY IDENTITY(3001,1),
CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
PolicyID INT FOREIGN KEY REFERENCES Policies(PolicyID),
StartDate DATE,
EndDate DATE
)
INSERT INTO PolicyHolders VALUES(1, 2002, '2022-01-15', '2027-01-14'),
(2, 2003, '2021-11-20', '2026-11-19'),
(3, 2004, '2023-02-10', '2028-02-09'),
(4, 2005, '2020-06-25', '2025-06-24'),
(5, 2006, '2021-04-05', '2026-04-04'),
(6, 2007, '2022-09-18', '2027-09-17'),
(7, 2008, '2020-08-30', '2025-08-29'),
(8, 2009, '2023-01-22', '2028-01-21'),
(9, 2010, '2023-03-12', '2028-03-11'),
(10, 2011, '2020-12-01', '2025-11-30')

SELECT * FROM PolicyHolders

-- Table Claims
CREATE TABLE Claims
(
ClaimID INT PRIMARY KEY IDENTITY(4001,1),
HolderID INT FOREIGN KEY REFERENCES PolicyHolders(HolderID),
ClaimAmount DECIMAL(10,2),
ClaimDate DATE,
Status VARCHAR(20) CHECK (Status IN ('Pending', 'Approved', 'Rejected'))
)
INSERT INTO Claims VALUES(3001, 100000.00, '2023-02-15', 'Approved'),
(3002, 50000.00, '2022-12-10', 'Pending'),
(3003, 20000.00, '2023-03-05', 'Rejected'),
(3004, 75000.00, '2021-07-19', 'Approved'),
(3005, 120000.00, '2022-10-11', 'Pending'),
(3006, 65000.00, '2023-04-22', 'Approved')

SELECT * FROM Claims

--Table Payments
CREATE TABLE Payments
(
PaymentID INT PRIMARY KEY IDENTITY(5001,1),
HolderID INT FOREIGN KEY REFERENCES PolicyHolders(HolderID),
PaymentDate DATE,
Amount DECIMAL(10,2),
Mode VARCHAR(20) CHECK (Mode IN ('Cash','Card','Online'))
)
INSERT INTO Payments VALUES(3001, '2022-01-10', 5000.00, 'Online'),
(3002, '2021-11-15', 3000.00, 'Card'),
(3003, '2023-02-05', 2500.00, 'Cash'),
(3004, '2020-06-20', 9000.00, 'Online'),
(3005, '2021-04-01', 4500.00, 'Card'),
(3006, '2022-09-15', 2200.00, 'Online'),
(3007, '2020-08-25', 6000.00, 'Cash'),
(3008, '2023-01-18', 3500.00, 'Card'),
(3009, '2023-03-08', 1800.00, 'Online'),
(3010, '2020-11-28', 10000.00, 'Card')

SELECT * FROM Payments

-- SELECT Queries
SELECT * FROM Customers       -- All Columns

SELECT FIRSTName, LastName FROM Customers     -- Specific Columns

SELECT * FROM Customers WHERE City = 'Delhi'    -- WHERE CLAUSE, Filters records based on a condition

SELECT DISTINCT City FROM Customers    -- Distinct, Removes duplicate rows from the result set.

SELECT * FROM Policies ORDER BY Premium DESC     --ORDER BY, Sorts the result set by one or more columns.

SELECT TOP 5 * From Customers      -- Limits the number of rows returned.

-- AND, OR, NOT, Combines multiple filter conditions.
SELECT * FROM Policies WHERE Premium > 50000 AND Tenure > 10  

SELECT * FROM Customers                     
WHERE City = 'Delhi' AND Gender = 'Male'

SELECT * FROM Customers
WHERE City = 'Delhi' OR	City = 'Mumbai'

SELECT * FROM Customers
WHERE NOT City = 'Delhi'

--Aggregate Functions, Performs a calculation on a set of values and returns a single value.
SELECT COUNT(*) AS TotalCsutomers FROM Customers
SELECT AVG(Premium) AS AVGPremium FROM Policies
SELECT SUM(ClaimAmount) AS TotalClaims FROM Claims
SELECT MAX(SumAssured), MIN(SumAssured) FROM Policies

--Joins
-- Inner Joins, Returns rows when there's a match in both tables.

SELECT C.FirstName, P.PolicyType
FROM Customers C
JOIN PolicyHolders PH ON C.CustomerID = PH.CustomerID
JOIN Policies P ON PH.PolicyID = P.PolicyID

--Left Join, Returns all rows from the left table with matching rows from the right.

SELECT C.FirstName, Cl.ClaimAmount
FROM Customers C
JOIN PolicyHolders PH ON C.CustomerID = PH.CustomerID
LEFT JOIN Claims Cl ON PH.HolderID = Cl.HolderID

--Right Join, Returns all rows from the right table with matching rows from the left.

SELECT A.AgentName, P.PolicyType
FROM Agents A
RIGHT JOIN Policies P ON A.AgentID = P.AgentID

-- FULL OUTER JOIN (Use UNION), Returns all records when there is a match in either table

SELECT C.FirstName, Cl.ClaimAmount
FROM Customers C
LEFT JOIN PolicyHolders PH ON C.CustomerID = PH.CustomerID
LEFT JOIN Claims Cl ON PH.HolderID = Cl.HolderID
UNION
SELECT C.FirstName, Cl.ClaimAmount
FROM Customers C
LEFT JOIN PolicyHolders PH ON C.CustomerID = PH.CustomerID
LEFT JOIN Claims Cl ON PH.HolderID = Cl.HolderID

--Advanced Queries
-- Group BY & Having, Filters grouped records.

SELECT City, COUNT(*) AS CustomerCount
FROM Customers
GROUP BY City
HAVING COUNT(*) > 1

-- CASE Statement,  Conditional logic inside queries.

SELECT FirstName, Gender,
CASE
WHEN Gender = 'Male' THEN 'Mr.'
WHEN Gender = 'Female' THEN 'Ms.'
ELSE 'Mx.'
END AS Salutation
FROM Customers

-- NULL Functions: IFNULL, COALESCE, Tests for NULL (missing) values.

SELECT ClaimID, ISNULL(ClaimAmount, 0) AS SafeAmount FROM Claims  -- Replace Value

SELECT COALESCE(Phone, 'Not Provided') AS Contact FROM Customers

SELECT COALESCE(Email, 'Not Provided') FROM Agents

-- ALTER, DROP, DEFAULT, CHECK

ALTER TABLE Customers ADD PAN VARCHAR(10) DEFAULT 'NA'      --Add New Column
SELECT * FROM Customers

ALTER Table Customers DROP Column PAN      -- Drop Column

ALTER Table Policies                                   -- Add CHECK constraint
ADD CONSTRAINT CHK_Tenure CHECK (Tenure > 0)

SELECT * FROM Policies

-- CONSTRAINTS, NOT NULL, UNIQUE, PRIMARY KEY, FOREIGN KEY, CHECK

CREATE TABLE TEST
(
ID INT PRIMARY KEY,
Email VARCHAR(100) UNIQUE,
Age INT CHECK (Age >= 18)

DROP TABLE IF EXISTS OldTable                     -- Drop Table

--INDEX

CREATE INDEX idx_City ON Customers(City)         -- Create Index

-- VIEW

CREATE VIEW V_ApprovedClaims AS
SELECT C.FirstName, Cl.ClaimAmount
FROM Customers C
JOIN PolicyHolders PH ON C.CustomerID = PH.CustomerID
JOIN Claims Cl ON PH.HolderID = Cl.HolderID
WHERE Cl.Status = 'Approved'

SELECT * FROM V_ApprovedClaims

-- STORED PROCEDURE

CREATE PROCEDURE GetCustomerByID @CustomerID INT
AS
BEGIN
SELECT * FROM Customers WHERE CustomerID = @CustomerID
END

EXEC GetCustomerByID @CustomerID = 3

CREATE PROCEDURE GetCustomerDetails
    @City VARCHAR(50)
AS
BEGIN
     SELECT * FROM Customers WHERE City = @City
END

EXEC GetCustomerDetails @City = 'Jaipur'

--TRIGGER

CREATE TRIGGER trg_BeforeInsertClaim
ON Claims
INSTEAD OF INSERT
AS
BEGIN
     IF EXISTS (SELECT * FROM inserted WHERE ClaimAmount <=0)
	 BEGIN
	      RAISERROR ('ClaimAmount must be greater than 0', 16, 1)
		  RETURN
	 END

	 INSERT INTO Claims (HolderID, ClaimAmount, ClaimDate, Status)
	 SELECT HolderID, ClaimAmount, ClaimDate, Status FROM inserted
END


CREATE TRIGGER trg_AuditPolicyInsert
ON Policies
AFTER INSERT
AS
BEGIN
    PRINT 'New Policy has been added.'
END

--  13. RANK, DENSE_RANK, ROW_NUMBER

SELECT
      C.FirstName,
	  P.PolicyType,
	  Cl.ClaimAmount,
	  RANK() OVER (PARTITION BY P.PolicyType ORDER BY Cl.ClaimAmount DESC) AS RankByPolicy,
	  DENSE_RANK() OVER (ORDER BY Cl.ClaimAmount DESC) AS DenseRank,
	  ROW_NUMBER() OVER (ORDER BY Cl.ClaimDate DESC) AS RowNum
FROM Customers C
JOIN PolicyHolders PH ON C.CustomerID = PH.CustomerID
JOIN Policies P ON PH.PolicyID = P.PolicyID
JOIN Claims Cl ON PH.HolderID = Cl.HolderID

-- DATE Functions

SELECT * FROM Claims WHERE YEAR(ClaimDate) = 2023    -- Claims made in 2023

SELECT MONTH(ClaimDate) AS ClaimMonth, COUNT(*) AS TotalClaims
FROM Claims
GROUP BY MONTH(ClaimDate)

SELECT GETDATE() AS Today       -- GETDATE() (Current Date/Time)



