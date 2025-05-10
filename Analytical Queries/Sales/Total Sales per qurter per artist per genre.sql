-- Total Sales per qurter per artist per genre
select d.[Quarter], a.[Name] as Artist , g.[Name] as Genre, sum(f.unitprice * f.quantity)as TotalSales
from track_DWH as f join artist_DWH as a on f.artistkey = a.ArtistKey
join genre_DWH as g on f.genreid = g.GenreKey 
join Date_Dim as d on f.DateKey = d.DateKey
group by a.[Name], g.[Name], d.[Quarter]