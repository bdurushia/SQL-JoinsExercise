/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */

 SELECT p.Name, c.Name, p.CategoryID, c.CategoryID FROM products AS p
 INNER JOIN categories AS c
 ON p.CategoryID = c.CategoryID
 WHERE c.CategoryID = 1;
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */

SELECT p.Name, p.Price, r.Rating FROM products AS p
INNER JOIN reviews AS r
ON p.ProductID = r.ProductID
WHERE r.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */

SELECT e.FirstName, e.LastName, SUM(s.Quantity) AS TotalQuantity
FROM employees AS e
INNER JOIN sales AS s
ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID
ORDER BY TotalQuantity DESC;

/* joins: find the name of the department, and the name of the category for Appliances and Games */

SELECT d.Name, c.Name FROM departments AS d
INNER JOIN categories AS c
ON  d.DepartmentID = c.DepartmentID
WHERE c.Name = "Games" OR c.Name = "Appliances";

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 
 SELECT p.Name, p.Price, SUM(s.Quantity) AS TotalSold, p.Price * SUM(s.Quantity) AS TotalPrice
 FROM products AS p
 INNER JOIN sales AS s
 ON p.ProductID = s.ProductID
 WHERE p.Name = "Eagles: Hotel California"
 GROUP BY p.ProductID;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */

SELECT p.Name, r.Rating, r.Reviewer, r.Comment
FROM products AS p
INNER JOIN reviews AS r
ON p.ProductID = r.ProductID
WHERE p.Name = "Visio TV" AND r.Rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */

SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name, s.Quantity
FROM ((employees AS e
INNER JOIN sales AS s ON e.EmployeeID = s.EmployeeID)
INNER JOIN products AS p ON p.ProductID = s.ProductID)
ORDER BY e.EmployeeID DESC;
