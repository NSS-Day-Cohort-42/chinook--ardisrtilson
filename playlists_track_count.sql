SELECT p.Name AS "Playlist Name",
       COUNT(p.Name) as "Tracks in Playlist"
FROM Track t
JOIN PlaylistTrack pt ON pt.TrackId = t.TrackId
JOIN Playlist p ON p.PlaylistId = pt.PlaylistId
GROUP BY p.Name