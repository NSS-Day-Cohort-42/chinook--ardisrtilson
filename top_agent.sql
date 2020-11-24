SELECT
MAX(MostSales.NumberOfSales) AS TopSales,
MostSales.EmployeeName
FROM
(SELECT e.FirstName || ' ' || e.LastName AS EmployeeName,
       COUNT(c.SupportRepId) AS NumberOfSales
FROM Customer c
JOIN Employee e ON c.SupportRepId = e.EmployeeId
JOIN Invoice i ON i.CustomerId =c.Customerid
GROUP BY EmployeeName) AS MostSales