CREATE TABLE FactGenrePopularity(
GenreKey INT NOT NULL,
DateKey INT NOT NULL,     
PlaylistId INT NOT NULL,
Tracks_inPlaylist INT NOT NULL,
Num_of_UniquePlaylists INT NOT NULL,
Playlist_Penetration DECIMAL(6,3),
AvgPlaylistPerGenre DECIMAL(5,2) ,
PRIMARY KEY (GenreKey, PlaylistId) 
)



CREATE TABLE Stg_FactGenrePopularity(
GenreKey INT NOT NULL,
DateKey INT NOT NULL,   
PlaylistId INT NOT NULL,
Tracks_inPlaylist INT NOT NULL,
Num_of_UniquePlaylists INT NOT NULL,
Playlist_Penetration DECIMAL(6,3),
AvgPlaylistPerGenre DECIMAL(5,2) ,
PRIMARY KEY (GenreKey, PlaylistId) 

)







SELECT * FROM Stg_FactGenrePopularity
SELECT * FROM FactGenrePopularity
select sum(Playlist_Penetration)  From  FactGenrePopularity

TRuncate TABLE FactGenrePopularity

---Genre-Level Analysis 
WITH GenreStats AS (
    SELECT 
        GenreKey,
        SUM(Tracks_inPlaylist) AS TotalGenreTracks,
        AVG(Tracks_inPlaylist) AS AvgTracksPerPlaylist,
        COUNT(DISTINCT PlaylistId) AS UniquePlaylistsCount
    FROM FactGenrePopularity
    GROUP BY GenreKey
)
SELECT
    GenreKey,
    TotalGenreTracks,
    AvgTracksPerPlaylist,
    UniquePlaylistsCount,
    -- Calculate genre dominance metric
    TotalGenreTracks * 1.0 / SUM(TotalGenreTracks) OVER() AS GenreMarketShare
FROM GenreStats
ORDER BY GenreMarketShare DESC;