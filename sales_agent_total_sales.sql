
SELECT e.FirstName || ' ' || e.LastName AS EmployeeName,
       COUNT(c.SupportRepId) AS "Number of Sales"
FROM Customer c
JOIN Employee e ON c.SupportRepId = e.EmployeeId
JOIN Invoice i ON i.CustomerId =c.Customerid
GROUP BY EmployeeName