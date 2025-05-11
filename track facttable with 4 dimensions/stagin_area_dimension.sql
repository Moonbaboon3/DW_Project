/*
use [DW_Project]
GO
CREATE SCHEMA STG
GO
*/
CREATE TABLE Customer_STG (
    CustomerId INT NOT NULL,
    FirstName NVARCHAR(40) NOT NULL,
    LastName NVARCHAR(20) NOT NULL,
    Company NVARCHAR(80) NULL,
    Address NVARCHAR(70) NULL,
    City NVARCHAR(40) NULL,
    State NVARCHAR(40) NULL,
    Country NVARCHAR(40) NULL,
    PostalCode NVARCHAR(10) NULL,
    Phone NVARCHAR(24) NULL,
    Fax NVARCHAR(24) NULL,
    Email NVARCHAR(60) NOT NULL,
    SupportRepId INT NULL,
    Created_date datetime
);
create table config(Name varchar(120),last_extract datetime) 
create table artist_STG(ArtistId int primary key,Name varchar(120),created_date datetime)
create table genre_STG(GenreId int primary key,Name varchar(120),created_date datetime)
create table tracks_STG(TrackId int,invoicedate datetime,GenreId int,AlbumId int,ArtistId int,customerId int,unitprice int,quantity int)

insert into config values ('customer','1950/1/1'),('genre','1950/1/1'),('artist','1950/1/1'),('tracks','1950/1/1'),('Employee','1950/1/1'),('Customer_Acquisition', '1950/1/1')

create table Employee_STG(
	EmployeeID int Not NUll,
	ManagerId int null,
	FirstName NVARCHAR(40) NOT NULL,
	LastName NVARCHAR(20) NOT NULL,
	Title NVaRCHAR(100) NOT NULL,
	HireDate datetime,
	Created_date datetime
);

create table Fact_Customer_Acquisition_STG (
	CustomerId INT NOT NULL,
	InvoiceDate DATETIME,
	SupportRepId INT,
	 Created_date datetime
);

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
