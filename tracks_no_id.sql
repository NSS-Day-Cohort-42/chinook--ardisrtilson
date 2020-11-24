SELECT DISTINCT a.Title,
       m.Name AS "Media Type",
       g.Name AS "Genre",
FROM Track t
JOIN Album a ON a.AlbumId = t.AlbumId
JOIN Genre g ON g.GenreId = t.GenreId
JOIN MediaType m ON m.MediaTypeId = t.MediaTypeId