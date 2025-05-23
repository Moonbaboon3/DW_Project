/*
use [DW_Project]
GO
CREATE SCHEMA DWH
GO
*/
CREATE TABLE Date_Dim (
   [DateKey] INT NOT NULL,
   [Date] DATE NOT NULL,
   [Day] TINYINT NOT NULL,
   [DaySuffix] CHAR(2) NOT NULL,
   [Weekday] TINYINT NOT NULL,
   [WeekDayName] VARCHAR(10) NOT NULL,
   [WeekDayName_Short] CHAR(3) NOT NULL,
   [WeekDayName_FirstLetter] CHAR(1) NOT NULL,
   [DOWInMonth] TINYINT NOT NULL,
   [DayOfYear] SMALLINT NOT NULL,
   [WeekOfMonth] TINYINT NOT NULL,
   [WeekOfYear] TINYINT NOT NULL,
   [Month] TINYINT NOT NULL,
   [MonthName] VARCHAR(10) NOT NULL,
   [MonthName_Short] CHAR(3) NOT NULL,
   [MonthName_FirstLetter] CHAR(1) NOT NULL,
   [Quarter] TINYINT NOT NULL,
   [QuarterName] VARCHAR(6) NOT NULL,
   [Year] INT NOT NULL,
   [MMYYYY] CHAR(6) NOT NULL,
   [MonthYear] CHAR(7) NOT NULL,
   [IsWeekend] BIT NOT NULL,
   [IsHoliday] BIT NOT NULL,
   PRIMARY KEY CLUSTERED ([DateKey] ASC)
   )

   SET NOCOUNT ON

TRUNCATE TABLE Date_Dim


DECLARE @CurrentDate DATE = '2016-01-01'
DECLARE @EndDate DATE = '2020-12-31'

WHILE @CurrentDate < @EndDate
BEGIN
   INSERT INTO Date_Dim (
      [DateKey],
      [Date],
      [Day],
      [DaySuffix],
      [Weekday],
      [WeekDayName],
      [WeekDayName_Short],
      [WeekDayName_FirstLetter],
      [DOWInMonth],
      [DayOfYear],
      [WeekOfMonth],
      [WeekOfYear],
      [Month],
      [MonthName],
      [MonthName_Short],
      [MonthName_FirstLetter],
      [Quarter],
      [QuarterName],
      [Year],
      [MMYYYY],
      [MonthYear],
      [IsWeekend],
      [IsHoliday]
      )
   SELECT DateKey = YEAR(@CurrentDate) * 10000 + MONTH(@CurrentDate) * 100 + DAY(@CurrentDate),
      DATE = @CurrentDate,
      Day = DAY(@CurrentDate),
      [DaySuffix] = CASE 
         WHEN DAY(@CurrentDate) = 1
            OR DAY(@CurrentDate) = 21
            OR DAY(@CurrentDate) = 31
            THEN 'st'
         WHEN DAY(@CurrentDate) = 2
            OR DAY(@CurrentDate) = 22
            THEN 'nd'
         WHEN DAY(@CurrentDate) = 3
            OR DAY(@CurrentDate) = 23
            THEN 'rd'
         ELSE 'th'
         END,
      WEEKDAY = DATEPART(dw, @CurrentDate),
      WeekDayName = DATENAME(dw, @CurrentDate),
      WeekDayName_Short = UPPER(LEFT(DATENAME(dw, @CurrentDate), 3)),
      WeekDayName_FirstLetter = LEFT(DATENAME(dw, @CurrentDate), 1),
      [DOWInMonth] = DAY(@CurrentDate),
      [DayOfYear] = DATENAME(dy, @CurrentDate),
      [WeekOfMonth] = DATEPART(WEEK, @CurrentDate) - DATEPART(WEEK, DATEADD(MM, DATEDIFF(MM, 0, @CurrentDate), 0)) + 1,
      [WeekOfYear] = DATEPART(wk, @CurrentDate),
      [Month] = MONTH(@CurrentDate),
      [MonthName] = DATENAME(mm, @CurrentDate),
      [MonthName_Short] = UPPER(LEFT(DATENAME(mm, @CurrentDate), 3)),
      [MonthName_FirstLetter] = LEFT(DATENAME(mm, @CurrentDate), 1),
      [Quarter] = DATEPART(q, @CurrentDate),
      [QuarterName] = CASE 
         WHEN DATENAME(qq, @CurrentDate) = 1
            THEN 'First'
         WHEN DATENAME(qq, @CurrentDate) = 2
            THEN 'second'
         WHEN DATENAME(qq, @CurrentDate) = 3
            THEN 'third'
         WHEN DATENAME(qq, @CurrentDate) = 4
            THEN 'fourth'
         END,
      [Year] = YEAR(@CurrentDate),
      [MMYYYY] = RIGHT('0' + CAST(MONTH(@CurrentDate) AS VARCHAR(2)), 2) + CAST(YEAR(@CurrentDate) AS VARCHAR(4)),
      [MonthYear] = CAST(YEAR(@CurrentDate) AS VARCHAR(4)) + UPPER(LEFT(DATENAME(mm, @CurrentDate), 3)),
      [IsWeekend] = CASE 
         WHEN DATENAME(dw, @CurrentDate) = 'Sunday'
            OR DATENAME(dw, @CurrentDate) = 'Saturday'
            THEN 1
         ELSE 0
         END,
      [IsHoliday] = 0

   SET @CurrentDate = DATEADD(DD, 1, @CurrentDate)
END

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

--fact table
create table track_DWH(trackid int primary key,
genreid int references genre_DWH(GenreKey),
datekey int references Date_Dim(DateKey),
customerkey int references Customer_DWH(customerKey),
artistkey int references artist_DWH(ArtistKey),
unitprice int,
quantity int,
invoicedate datetime)

create table Employee_DWH(
	EmployeeKey int identity(1,1) primary key,
	src_EmployeeID int ,
	src_ManagerId int null,
	FirstName NVARCHAR(40) NOT NULL,
	LastName NVARCHAR(20) NOT NULL,
	Title NVaRCHAR(100) NOT NULL,
	HireDate datetime,

	start_date datetime,
	end_date datetime,
	isactive smallint
);
--Fact table
CREATE TABLE Fact_Customer_Acquisition_DWH (
	CustomerKey INT  references  Customer_DWH(customerKey),
    EmployeeKey INT references  Employee_DWH(EmployeeKey),           
	DateKey  int references Date_Dim(DateKey),         
	PRIMARY KEY (CustomerKey, EmployeeKey, DateKey)
	);



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






