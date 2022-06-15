USE taskb
SELECT * FROM projectB

--returns list of distinct cities
SELECT DISTINCT City FROM projectB

--returns the number of unique customer names
SELECT DISTINCT COUNT(CustomerName) from projectB
-- returns number of distinct countries 
SELECT COUNT(DISTINCT Country) from projectB
-- returns number of distinct customers
SELECT COUNT (DISTINCT customerName) from projectB
-- returns list of customers starting with highest value customer ID (most recent customer)
SELECT CustomerName,CustomerID FROM projectB ORDER BY CustomerID DESC
-- returns list of customers not in London
SELECT CustomerName, CustomerID FROM projectB WHERE City != 'London';
-- returns list of customers ordered alphabetically by country then name
SELECT CustomerName, Country FROM projectB ORDER BY Country, CustomerName;
-- customers missing postcodes
SELECT CustomerName CustomerID FROM ProjectB WHERE PostalCode IS NULL
-- Least expensive product
SELECT TOP 1 ProductName, Price FROM ProjectB2 WHERE Price > 0 ORDER BY Price ASC 
-- most expensive
SELECT TOP 1 ProductName, Price FROM ProjectB2 WHERE Price > 0 ORDER BY Price DESC 
-- how many products sold
SELECT COUNT(DISTINCT ProductName) FROM ProjectB2
--average product price
SELECT AVG(Price) FROM projectb2
-- products sold total
SELECT SUM(Quantity) FROM Order_Details
-- employees over 65
SELECT FirstName, LastName, Birthdate from employees  WHERE Birthdate < '1957-06-15'
-- supplier with most expensive product
SELECT TOP 1 SupplierID FROM ProjectB2 ORDER BY Price DESC
-- supplier with most products
SELECT SupplierID, COUNT(SupplierID) AS 'value occurrence' FROM ProjectB2 GROUP BY SupplierID ORDER BY 'value occurrence'DESC;
-- products over 10 and below 50 
SELECT COUNT(ProductID) FROM projectB2 WHERE Price > 10 AND Price < 50;

CREATE VIEW order_class_small AS
SELECT OrderID, Quantity 
FROM Order_Details
WHERE Quantity < 10;

CREATE VIEW order_class_medium AS 
SELECT OrderID, Quantity 
FROM Order_Details
WHERE Quantity > 10 AND Quantity < 50;

CREATE VIEW order_class_large AS 
SELECT OrderID, Quantity 
FROM Order_Details
WHERE Quantity >= 50;
-- return average size of order in each class 
SELECT AVG(Quantity) FROM order_class_small;
SELECT AVG(Quantity) FROM order_class_medium;
SELECT AVG(Quantity) FROM order_class_large;