SELECT
    SUM(il.Quantity) TracksPurchased,
    a.Name Artist
FROM `InvoiceLine` il
    JOIN `Track` t ON il.TrackId = t.TrackId
    JOIN `Album` al ON al.AlbumId = t.AlbumId
    JOIN `Artist` a ON a.ArtistId = al.ArtistId
GROUP BY Artist
ORDER BY TracksPurchased DESC
LIMIT 3