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

-- SQL Part 2 task B
----------------------------------------------
SELECT CustomerName FROM customers WHERE customerName NOT LIKE '%t'

SELECT SupplierName FROM Suppliers WHERE SupplierName LIKE '%or%'

SELECT CustomerName, City FROM Customers WHERE City LIKE '%es%'

SELECT CustomerName, City FROM Customers WHERE City NOT LIKE '[b,s,p]%'

SELECT CustomerName, Country FROM Customers WHERE country IN ('Germany', 'France', 'UK')

SELECT COUNT(ProductID), SupplierID FROM products GROUP BY SupplierID ORDER BY COUNT(ProductID) DESC

SELECT ProductID, ProductName, categoryID, Price FROM products WHERE CategoryID IN (1,2,3) AND PRICE between 10 and 50
SELECT ProductID, ProductName, categoryID, Price FROM products WHERE CategoryID IN (1,2,3) AND PRICE NOT between 10 and 50

SELECT COUNT(CustomerName) as number_of_customer, country FROM Customers GROUP BY Country
SELECT COUNT(CustomerName) as number_of_customer, country FROM Customers GROUP BY Country having count(customerName) > 5
--Next steps in SQL Task D
--1 select all products with shipper info
SELECT productID, ProductName, SupplierName, address
FROM products
INNER JOIN suppliers
ON products.SupplierID =
Suppliers.SupplierID;

-- 2 shippers and customers from same city
SELECT SupplierName, CustomerName, customers.City, suppliers.city
FROM suppliers
INNER JOIN customers 
ON suppliers.City = customers.City


--3 all records from customers and all matches from orders
SELECT * 
FROM customers
Left join Order_Details 
ON customers.CustomerID = Order_Details.OrderDetailID
--4 list number of customers in each country 
SELECT COUNT(DISTINCT customerid), city FROM customers GROUP BY CITY


-- 6. Make a report with customer name, city, order number, order date, and order amount in
--ascending order according to the order date to find that either any of the exist
SELECT customerName, City, OrderID, OrderDate 
FROM customers LEFT JOIN orders ON 
orders.customerID = customers.customerID  ORDER BY OrderDate ASC


--7 combine each row of shippers with each row customers

SELECT CustomerName, CustomerID FROM customers
UNION (ALL)
SELECT SupplierName, SupplierID FROM suppliers;

--8 display item name, price, company name
SELECT products.ProductName, products.Price, products.SupplierID, suppliers.SupplierName
FROM Products LEFT JOIN suppliers ON
suppliers.SupplierID = products.SupplierID
--9 calculate average price of products from each company 
SELECT  avg(Price) as avg_product_price, supplierID as supplierID FROM products  GROUP BY SupplierID ;
--10 most expensive product for each company
SELECT max(price), supplierID FROM products GROUP BY SupplierID

