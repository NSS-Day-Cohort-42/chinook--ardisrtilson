SELECT
    SUM(il.Quantity) TotalSold,
    t.Name AS TrackName
FROM `InvoiceLine` il
    JOIN `Track` t ON il.TrackId = t.TrackId
    JOIN `Invoice` i ON i.InvoiceId = il.InvoiceId
GROUP BY TrackName
ORDER BY TotalSold DESC
LIMIT 5