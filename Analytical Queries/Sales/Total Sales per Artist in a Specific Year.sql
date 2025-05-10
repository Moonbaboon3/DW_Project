-- Total Sales per Artist in a Specific Year (e.g., 2023)
SELECT 
    a.Name AS Artist,
    SUM(t.unitprice * t.quantity) AS TotalSales
FROM track_DWH t
JOIN artist_DWH a ON t.artistkey = a.ArtistKey
JOIN Date_Dim d ON t.datekey = d.DateKey
WHERE d.Year = 2023
GROUP BY a.Name
ORDER BY TotalSales DESC;