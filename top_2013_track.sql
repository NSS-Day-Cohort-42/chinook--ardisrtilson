SELECT
    Trax2013.TrackName,
    Trax2013.SoldIn2013
FROM (
    SELECT
        SUM(il.Quantity) SoldIn2013,
        t.Name TrackName
    FROM `InvoiceLine` il
        JOIN `Track` t ON il.TrackId = t.TrackId
        JOIN `Invoice` i ON i.InvoiceId = il.InvoiceId
            WHERE strftime('%Y', i.InvoiceDate) = "2013"
    GROUP BY TrackName
    ) Trax2013
JOIN (
    SELECT
        MAX(SoldIn2013) Maximum,
        TrackName
    FROM(
        SELECT
            SUM(il.Quantity) SoldIn2013,
            t.Name AS TrackName
        FROM `InvoiceLine` il
            JOIN `Track` t ON il.TrackId = t.TrackId
            JOIN `Invoice` i ON i.InvoiceId = il.InvoiceId
                WHERE strftime('%Y', i.InvoiceDate) = "2013"
        GROUP BY TrackName
        )
) MaxPurchases2013
WHERE Trax2013.SoldIn2013 = MaxPurchases2013.Maximum
LIMIT 1