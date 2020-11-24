SELECT 
    (SELECT SUM(i.InvoiceDate)
    FROM Invoice i
    WHERE i.InvoiceDate LIKE '2009%') AS "Sales 2009",
    (SELECT SUM(i.InvoiceDate)
    FROM Invoice i
    WHERE i.InvoiceDate LIKE '2011%') AS "Sales 2011"