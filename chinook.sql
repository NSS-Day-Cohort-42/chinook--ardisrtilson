SELECT c.FirstName || ' ' || c.LastName as 'FullName',
    c.CustomerId,
    c.Country
FROM Customer c
WHERE c.Country != 'USA'
ORDER by c.Country desc

SELECT c.FirstName || ' ' || c.LastName as 'FullName',
    c.CustomerId,
    c.Country
FROM Customer c
WHERE c.Country = 'Brazil'

SELECT c.FirstName || ' ' || c.LastName as 'FullName',
        i.InvoiceId,
        i.InvoiceDate,
        i.BillingCountry
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
WHERE c.Country = 'Brazil' 

SELECT DISTINCT e.* FROM Employee e
WHERE e.Title = "Sales Support Agent"

SELECT DISTINCT BillingCountry FROM Invoice

SELECT e.FirstName || ' ' || e.LastName EmployeeFullName,
        i.InvoiceId
FROM Employee e
JOIN Customer c ON c.CustomerId = e.ReportsTo
JOIN Invoice i ON i.CustomerId = c.CustomerId
ORDER by 'CustomerFullName'

SELECT i.total,
        c.FirstName || ' ' || c.LastName CustomerFullName,
        c.Country,
        e.FirstName || ' ' || e.LastName EmployeeFullName
FROM Employee e
JOIN Customer c ON c.CustomerId = e.ReportsTo
JOIN Invoice i ON i.CustomerId = c.CustomerId

SELECT 
    (SELECT SUM(i.InvoiceDate)
    FROM Invoice i
    WHERE i.InvoiceDate LIKE '2009%') AS "Sales 2009",
    (SELECT SUM(i.InvoiceDate)
    FROM Invoice i
    WHERE i.InvoiceDate LIKE '2011%') AS "Sales 2011"

SELECT COUNT(InvoiceId) AS "Line Items Total"
FROM InvoiceLine il
WHERE InvoiceId = 37

SELECT COUNT(InvoiceId) AS "Line Items Total"
FROM InvoiceLine il
GROUP BY InvoiceId

SELECT il.InvoiceLineId,
        t.name
FROM InvoiceLine il
JOIN Invoice i ON il.InvoiceId = i.InvoiceId
JOIN Track t ON t.TrackId = il.TrackId

SELECT il.InvoiceLineId,
        t.name as "Track Name",
        ar.name as "Artist Name"
FROM InvoiceLine il
JOIN Invoice i ON il.InvoiceId = i.InvoiceId
JOIN Track t ON t.TrackId = il.TrackId
JOIN Album a ON a.AlbumId = t.AlbumId
JOIN Artist ar ON a.ArtistId = ar.ArtistId

SELECT COUNT(Invoice.BillingCountry) as "Invoices Per Country",
        Invoice.BillingCountry
FROM Invoice
GROUP BY Invoice.BillingCountry

SELECT p.Name AS "Playlist Name",
       COUNT(p.Name) as "Tracks in Playlist"
FROM Track t
JOIN PlaylistTrack pt ON pt.TrackId = t.TrackId
JOIN Playlist p ON p.PlaylistId = pt.PlaylistId
GROUP BY p.Name

SELECT DISTINCT a.Title,
       m.Name AS "Media Type",
       g.Name AS "Genre",
FROM Track t
JOIN Album a ON a.AlbumId = t.AlbumId
JOIN Genre g ON g.GenreId = t.GenreId
JOIN MediaType m ON m.MediaTypeId = t.MediaTypeId

SELECT il.InvoiceId as "Invoice Number Total",
       il.TrackId as "Track Id",
       COUNT(InvoiceId) AS "Line Items Total"
FROM InvoiceLine il
GROUP BY InvoiceId

SELECT e.FirstName || ' ' || e.LastName AS "Employee Name"
FROM Employee e
WHERE e.Title = "Sales Support Agent"

SELECT e.FirstName || ' ' || e.LastName AS EmployeeName,
       COUNT(c.SupportRepId) AS "Number of Sales"
FROM Customer c
JOIN Employee e ON c.SupportRepId = e.EmployeeId
JOIN Invoice i ON i.CustomerId =c.Customerid
GROUP BY EmployeeName

SELECT e.FirstName || ' ' || e.LastName AS EmployeeName,
       COUNT(c.SupportRepId) AS NumberOfSales
FROM Customer c
JOIN Employee e ON c.SupportRepId = e.EmployeeId
JOIN Invoice i ON i.CustomerId =c.Customerid
WHERE i.InvoiceDate LIKE '2009%'
GROUP BY EmployeeName


SELECT * FROM Customer
/*


top_2009_agent.sql: Which sales agent made the most in sales in 2009?

Hint: Use the MAX function on a subquery.

top_agent.sql: Which sales agent made the most in sales over all?

sales_agent_customer_count.sql: Provide a query that shows the count of customers assigned to each sales agent.

sales_per_country.sql: Provide a query that shows the total sales per country.

top_country.sql: Which country's customers spent the most?

top_2013_track.sql: Provide a query that shows the most purchased track of 2013.

top_5_tracks.sql: Provide a query that shows the top 5 most purchased tracks over all.

top_3_artists.sql: Provide a query that shows the top 3 best selling artists.

top_media_type.sql: Provide a query that shows the most purchased Media Type.
*/