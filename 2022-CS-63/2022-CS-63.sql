SELECT
    c.CustomerID,
    o.OrderID,
    o.OrderDate
FROM
    Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;


SELECT
    c.CustomerID,
    o.OrderID,
    o.OrderDate
FROM
    Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE
    o.OrderID IS NULL;



SELECT
    c.CustomerID,
    o.OrderID,
    o.OrderDate
FROM
    Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE
    YEAR(o.OrderDate) = 1997 AND MONTH(o.OrderDate) = 7;


SELECT
    CustomerID,
    COUNT(OrderID) AS totalorders
FROM
    Orders
GROUP BY
    CustomerID;


SELECT
    EmployeeID,
    FirstName,
    LastName
FROM
    Employees
CROSS JOIN (
    SELECT 1 AS n UNION ALL
    SELECT 2 UNION ALL
    SELECT 3 UNION ALL
    SELECT 4 UNION ALL
    SELECT 5
) AS copies;


SELECT
    e.EmployeeID,
    calendar.Date
FROM
    Employees e
CROSS JOIN (
    SELECT DATEADD(day, number, '1996-04-07') AS Date
    FROM master..spt_values
    WHERE type = 'P'
    AND DATEADD(day, number, '1996-04-07') <= '1997-04-08'
) calendar
ORDER BY
    e.EmployeeID,
    calendar.Date;


SELECT O.CustomerID,COUNT(DISTINCT O.OrderID) AS Totalorders,SUM(OD.Quantity) AS totalquantity
FROM Orders  AS O JOIN [Order Details] AS OD ON O.OrderID =OD .OrderID 
WHERE O.ShipCountry='USA' GROUP BY O.CustomerID ;


SELECT
    c.CustomerID,
    c.CompanyName,
    o.OrderID,
    o.Orderdate
FROM
    Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID AND CONVERT(DATE, o.Orderdate) = '1997-07-04';


SELECT e.EmployeeID,
       e.FirstName AS EmployeeFirstName,
       e.LastName AS EmployeeLastName,
       e.BirthDate AS EmployeeBirthDate,
       m.FirstName AS ManagerFirstName,
       m.LastName AS ManagerLastName,
       m.BirthDate AS ManagerBirthDate
FROM Employees e
JOIN Employees m ON e.ReportsTo = m.EmployeeID
WHERE e.BirthDate > m.BirthDate;


SELECT E.FirstName AS EmployeeName,YEAR(GETDATE()) - YEAR(E.BirthDate) AS Age,YEAR(GETDATE()) - YEAR(M.BirthDate) AS ManagerAge 
FROM Employees AS E 
JOIN Employees AS M 
ON E.EmployeeID = M.ReportsTo 
WHERE E.BirthDate < M.BirthDate ;


SELECT P.ProductName,O.OrderDate 
FROM Products P 
JOIN [Order Details] OD  
ON P.ProductID = OD.ProductID 
JOIN Orders O 
ON OD.OrderID=O.OrderID 
WHERE YEAR(O.OrderDate)=1997 AND MONTH(O.OrderDate)=8 AND DAY(O.OrderDate) = 8 ;

SELECT
    c.Address,
    c.City,
    c.Country
FROM
    Orders o
    JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE
    o.EmployeeID = (SELECT EmployeeID FROM Employees WHERE FirstName = 'Anne')
    AND o.ShippedDate > o.RequiredDate;


SELECT O.ShipCountry AS Country 
FROM Products P 
JOIN [Order Details] OD  ON P.ProductID = OD.ProductID 
JOIN  Orders O ON OD.OrderID = O.OrderID 
WHERE P.CategoryID = 1 ;
