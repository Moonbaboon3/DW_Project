--Top 5 genres and the playlists that feature tracks of that genre
SELECT TOP 5
    g.GenreKey ,
    g.Name AS GenreName,
    SUM(f.Tracks_inPlaylist) AS TotalTracks,
    COUNT(DISTINCT f.PlaylistId) AS PlaylistCount,
    STRING_AGG(CONVERT(VARCHAR, f.PlaylistId), ', ') AS FeaturedInPlaylists
FROM FactGenrePopularity f
JOIN Genre_Dwh g ON f.GenreKey = g.GenreKey
GROUP BY g.GenreKey, g.Name
ORDER BY TotalTracks DESC;