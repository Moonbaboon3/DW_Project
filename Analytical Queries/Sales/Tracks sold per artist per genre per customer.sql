-- Tracks Sold per Artist per Genre per Customer
SELECT
    a.Name AS Artist,
    g.Name AS Genre,
    c.FirstName + ' ' + c.LastName AS Customer,
    SUM(t.quantity) AS TracksSold
FROM
    track_DWH t
JOIN
    artist_DWH a ON t.artistkey = a.ArtistKey
JOIN
    genre_DWH g ON t.genreid = g.GenreKey
JOIN
    customer_DWH c ON t.customerkey = c.customerKey
GROUP BY
    a.Name, g.Name, c.FirstName, c.LastName
ORDER BY
    TracksSold DESC;