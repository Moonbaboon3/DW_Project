
---Genre popularity across every track in playlist in percentage
SELECT f.GenreKey, g.Name,sum(f.Playlist_Penetration) as Genre_Percentage
FROM FactGenrePopularity f
JOIN Genre_Dwh g ON f.GenreKey = g.GenreKey
GROUP BY f.GenreKey , g.Name