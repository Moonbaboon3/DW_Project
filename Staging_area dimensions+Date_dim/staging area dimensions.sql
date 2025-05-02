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
    Created_date datetime.
);
create table config(Name varchar(120),last_extract datetime) 
create table artist_STG(ArtistId int primary key,Name varchar(120),created_date datetime)
create table genre_STG(GenreId int primary key,Name varchar(120),created_date datetime)
