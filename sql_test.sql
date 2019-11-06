USE northwind;
SELECT
    o.OrderNumber,
    o.TotalAmount,
    CONCAT(c.FirstName, " ", c.LastName) AS CustomerName,
    c.City
FROM Orders AS o
    LEFT JOIN Customer AS c ON o.CustomerId = c.Id
ORDER BY o.TotalAmount DESC;