Drop table Customer_STG
CREATE TABLE Customer_DWH (
	customerKey int identity(1,1) primary key,
    src_id INT NOT NULL,
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
	start_date datetime,
	end_date datetime,
	isactive smallint
);

create table artist_DWH( ArtistKey int identity(1,1) primary key,src_id int ,Name varchar(120),	start_date datetime,
	end_date datetime,
	isactive smallint)
create table genre_DWH(GenreKey int identity(1,1) primary key,src_id int ,Name varchar(120),	start_date datetime,
	end_date datetime,
	isactive smallint)

create table track_DWH(trackid int primary key,
genreid int references genre_DWH(GenreKey),
datekey int references Date_Dim(DateKey),
customerkey int references Customer_DWH(customerKey),
artistkey int references artist_DWH(ArtistKey),
unitprice int )

