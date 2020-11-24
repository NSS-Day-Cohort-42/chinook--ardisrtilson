SELECT e.FirstName || ' ' || e.LastName EmployeeFullName,
        i.InvoiceId
FROM Employee e
JOIN Customer c ON c.CustomerId = e.ReportsTo
JOIN Invoice i ON i.CustomerId = c.CustomerId
ORDER by 'CustomerFullName'