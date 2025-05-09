CREATE TABLE FactGenrePopularity(
GenreKey INT NOT NULL,
DateKey INT NOT NULL,
Tracks_inPlaylist INT NOT NULL,
Num_of_UniquePlaylists INT NOT NULL,
Playlist_Penetration DECIMAL(6,3),
AvgPlaylistPerGenre DECIMAL(5,2) 
)

CREATE TABLE Stg_FactGenrePopularity(
GenreKey INT NOT NULL,
DateKey INT NOT NULL,
Tracks_inPlaylist INT NOT NULL,
Num_of_UniquePlaylists INT NOT NULL,
Playlist_Penetration DECIMAL(6,3),
AvgPlaylistPerGenre DECIMAL(5,2) 
)


