SELECT c.FirstName || ' ' || c.LastName as 'FullName',
    c.CustomerId,
    c.Country
FROM Customer c
WHERE c.Country != 'USA'
ORDER by c.Country desc