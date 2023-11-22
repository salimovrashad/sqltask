--CREATE DATABASE AliNinoDB1
--USE AliNinoDB1


CREATE TABLE Categories (
    ID int identity PRIMARY KEY,
    Title nvarchar(255),
    ParentCategoryId int references Categories(Id),
	IsDeleted bit
);

CREATE TABLE Books (
	ID int identity PRIMARY KEY,
	Title nvarchar(255),
	Description nvarchar(255),
	ActualPrice int,
	DiscountPrice int,
	PublishingHousesID int references PublishingHouses(ID),
	StockCount int,
	ArticleCode varchar(255),
	BindingID int references Binding(ID),
	Pages int,
	CategoryID int references Categories(ID),
	IsDeleted bit
);

CREATE TABLE Authors(
	ID int identity PRIMARY KEY,
	Name nvarchar(255),
	Surname nvarchar(255),
	IsDeleted bit
);

CREATE PROCEDURE usp_CreateAuthors
(@Name nvarchar(255), @Surname nvarchar(255), @IsDeleted bit)
AS
BEGIN
	INSERT INTO Authors VALUES (@Name, @Surname,  @IsDeleted)
END

usp_CreateAuthors N'Moşe', N'Dayan', 0

SELECT * FROM Authors


CREATE TABLE BooksAuthors(
	ID int identity PRIMARY KEY,
	BookID int references Books(ID),
	AuthorID int references Authors(ID)
);

CREATE TABLE PublishingHouses (
	ID int identity PRIMARY KEY,
	Title nvarchar(255),
	IsDeleted bit
);

--CREATE PROCEDURE usp_CreatePublishHouse
--(@Title nvarchar(255), @IsDeleted bit)
--AS
--BEGIN
--	INSERT INTO PublishingHouses VALUES (@Title, @IsDeleted)
--END

--usp_CreatePublishHouse N'Qanun Nəşriyyatı', 0

--SELECT * FROM PublishingHouses

CREATE TABLE BooksGenres(
	ID int identity PRIMARY KEY,
	BookID int references Books(ID),
	GenreID int references Genres(ID)
);

CREATE TABLE Genres(
	ID int identity PRIMARY KEY,
	Title nvarchar(255),
	IsDeleted bit
);

--CREATE PROCEDURE usp_CreateGenres
--(@Title nvarchar(255), @IsDeleted bit)
--AS
--BEGIN
--	INSERT INTO Genres VALUES (@Title, @IsDeleted)
--END

--usp_CreateGenres 'Romance', 0

--SELECT * FROM Genres

CREATE TABLE Binding(
	ID int identity PRIMARY KEY,
	Title nvarchar(255),
	IsDeleted bit
);

--CREATE PROCEDURE usp_CreateBinding
--(@Title nvarchar(255), @IsDeleted bit)
--AS
--BEGIN
--	INSERT INTO Binding VALUES (@Title, @IsDeleted)
--END

--usp_CreateBinding 'Mohkem', 1

--SELECT * FROM Binding

CREATE TABLE Languages(
	ID int identity PRIMARY KEY,
	Title nvarchar(255),
	IsDeleted bit
);

--CREATE PROCEDURE usp_CreateLanguage
--(@Title nvarchar(255), @IsDeleted bit)
--AS
--BEGIN
--	INSERT INTO Languages VALUES (@Title, @IsDeleted)
--END

--usp_CreateLanguage 'RUSSIAN', 1

--SELECT * FROM Languages

CREATE TABLE BooksLanguages(
	ID int identity PRIMARY KEY,
	BookID int references Books(ID),
	LanguageID int references Languages(ID)
);

CREATE TABLE Comment(
	ID int identity PRIMARY KEY,
	Description nvarchar(255),
	BookID int references Books(ID),
	Rating int,
    CHECK (Rating >= 0 AND Rating <= 5),
	Name nvarchar(255) NOT NULL,
	Email nvarchar(255) NOT NULL,
	ImageUrl nvarchar(255),
	IsDeleted bit
);


