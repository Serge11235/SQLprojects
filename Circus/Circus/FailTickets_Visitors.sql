USE [CircusAuditDB]

--словари для модификатора USE [CircusAuditDB]
GO
if not exists(select * from sys.tables where name = 'Sector_Set')
CREATE TABLE Sector_Set(
	Id INT IDENTITY  PRIMARY KEY,
	Id_Meaning VARCHAR(3) NOT NULL,
	Value DECIMAL(18,2) NOT NULL,
	ModPriority int NOT NULL,
)
if not exists(select * from sys.tables where name = 'Status_Set')
CREATE TABLE Status_Set(
	Id INT IDENTITY  PRIMARY KEY,
	Id_Meaning VARCHAR(10) NOT NULL,
	Value DECIMAL(18,2) NOT NULL,
	ModPriority int NOT NULL,
)
if not exists(select * from sys.tables where name = 'Weekend_Set')
CREATE TABLE Weekend_Set(
	Id INT IDENTITY  PRIMARY KEY,
	Id_Meaning VARCHAR(10) NOT NULL,
	Value DECIMAL(18,2) NOT NULL,
	ModPriority int NOT NULL,
)
if not exists(select * from sys.tables where name = 'Wholesale_Set')
CREATE TABLE Wholesale_Set(
	Id INT IDENTITY  PRIMARY KEY,
	Id_Meaning VARCHAR(10) NOT NULL,
	Value DECIMAL(18,2) NOT NULL,
	ModPriority int NOT NULL,
)

GO
INSERT INTO Sector_Set VALUES ('A', 1.25, 10);
INSERT INTO Sector_Set VALUES ('B', 1, 10);
INSERT INTO Sector_Set VALUES ('C', 0.75, 10);

INSERT INTO Status_Set VALUES ('Adult',1., 5);
INSERT INTO Status_Set VALUES ('Child',0.5, 5);
INSERT INTO Status_Set VALUES ('Student',0.75, 5);
INSERT INTO Status_Set VALUES ('Pensioner',0.5, 5);

INSERT INTO Weekend_Set VALUES ('NotWeekend',1., 1);
INSERT INTO Weekend_Set VALUES ('Weekend',1.3, 1);

INSERT INTO Wholesale_Set VALUES ('1',1., 3);
INSERT INTO Wholesale_Set VALUES ('2',0.5, 3);

--модификатор(цены) USE [CircusAuditDB]
GO
if not exists(select * from sys.tables where name = 'Modifier_Set')
CREATE TABLE Modifier_Set(
	Id_mod INT IDENTITY  PRIMARY KEY,
	Id_sector int NOT NULL,
	Id_status int NOT NULL,
	Id_weekend int NOT NULL,
	Id_whlsale int NOT NULL,
	FOREIGN KEY (Id_sector) REFERENCES Sector_Set(Id),
	FOREIGN KEY (Id_status) REFERENCES Status_Set(Id),
	FOREIGN KEY (Id_weekend) REFERENCES Weekend_Set(Id),
	FOREIGN KEY (Id_whlsale) REFERENCES Wholesale_Set(Id),
)

GO
INSERT INTO Modifier_Set Values(1, 1, 1, 1);
INSERT INTO Modifier_Set Values(2, 1, 1, 1);
INSERT INTO Modifier_Set Values(3, 1, 1, 1);
INSERT INTO Modifier_Set Values(1, 2, 1, 1);
INSERT INTO Modifier_Set Values(2, 2, 1, 1);
INSERT INTO Modifier_Set Values(3, 2, 1, 1);
INSERT INTO Modifier_Set Values(1, 3, 1, 1);
INSERT INTO Modifier_Set Values(2, 3, 1, 1);
INSERT INTO Modifier_Set Values(3, 3, 1, 1);
INSERT INTO Modifier_Set Values(1, 4, 1, 1);
INSERT INTO Modifier_Set Values(2, 4, 1, 1);
INSERT INTO Modifier_Set Values(3, 4, 1, 1);

INSERT INTO Modifier_Set Values(1, 1, 2, 1);
INSERT INTO Modifier_Set Values(2, 1, 2, 1);
INSERT INTO Modifier_Set Values(3, 1, 2, 1);
INSERT INTO Modifier_Set Values(1, 2, 2, 1);
INSERT INTO Modifier_Set Values(2, 2, 2, 1);
INSERT INTO Modifier_Set Values(3, 2, 2, 1);
INSERT INTO Modifier_Set Values(1, 3, 2, 1);
INSERT INTO Modifier_Set Values(2, 3, 2, 1);
INSERT INTO Modifier_Set Values(3, 3, 2, 1);
INSERT INTO Modifier_Set Values(1, 4, 2, 1);
INSERT INTO Modifier_Set Values(2, 4, 2, 1);
INSERT INTO Modifier_Set Values(3, 4, 2, 1);

INSERT INTO Modifier_Set Values(1, 1, 1, 2);
INSERT INTO Modifier_Set Values(2, 1, 1, 2);
INSERT INTO Modifier_Set Values(3, 1, 1, 2);
INSERT INTO Modifier_Set Values(1, 2, 1, 2);
INSERT INTO Modifier_Set Values(2, 2, 1, 2);
INSERT INTO Modifier_Set Values(3, 2, 1, 2);
INSERT INTO Modifier_Set Values(1, 3, 1, 2);
INSERT INTO Modifier_Set Values(2, 3, 1, 2);
INSERT INTO Modifier_Set Values(3, 3, 1, 2);
INSERT INTO Modifier_Set Values(1, 4, 1, 2);
INSERT INTO Modifier_Set Values(2, 4, 1, 2);
INSERT INTO Modifier_Set Values(3, 4, 1, 2);

INSERT INTO Modifier_Set Values(1, 1, 2, 2);
INSERT INTO Modifier_Set Values(2, 1, 2, 2);
INSERT INTO Modifier_Set Values(3, 1, 2, 2);
INSERT INTO Modifier_Set Values(1, 2, 2, 2);
INSERT INTO Modifier_Set Values(2, 2, 2, 2);
INSERT INTO Modifier_Set Values(3, 2, 2, 2);
INSERT INTO Modifier_Set Values(1, 3, 2, 2);
INSERT INTO Modifier_Set Values(2, 3, 2, 2);
INSERT INTO Modifier_Set Values(3, 3, 2, 2);
INSERT INTO Modifier_Set Values(1, 4, 2, 2);
INSERT INTO Modifier_Set Values(2, 4, 2, 2);
INSERT INTO Modifier_Set Values(3, 4, 2, 2);


GO
/*
declare @iter1 int  =1;
declare @iter2 int = 1;
declare @iter3 int = 1;
declare @iter4 int = 1;
while @iter1<4
	begin
	while @iter2<5
		begin
		while @iter3<3
			begin
			while @iter4<3
				begin
				PRINT CONVERT(varchar, @iter1)+' '+ CONVERT(varchar, @iter2)+' '+ CONVERT(varchar, @iter3)+' '+ CONVERT(varchar, @iter4)+' ';
				set @iter4+=1;
				end
			set @iter3+=1;
			end
		set @iter2+=1;
		end
	set @iter1+=1;
	end
*/



GO
--посетители USE [CircusAuditDB]
if not exists(select * from sys.tables where name = 'Visitor')
CREATE TABLE Visitor(
	Id_visitor INT IDENTITY PRIMARY KEY,
	FirstName VARCHAR(10) NOT NULL,
	SecondName VARCHAR(10) NOT NULL,
	Surname VARCHAR(10) NOT NULL,

	/*StatusType int NOT NULL,
	FOREIGN KEY(StatusType) REFERENCES Status_Set(Id) */
)
GO
INSERT INTO Visitor VALUES ('Ivan','Ivanovich','Ivanov');
INSERT INTO Visitor VALUES ('Petr','Petrovich','Petrov');
INSERT INTO Visitor VALUES ('Sidor','Sidorovich','Sidirov');

--билеты USE [CircusAuditDB]
GO
if not exists(select * from sys.tables where name = 'Tickets')
CREATE TABLE Tickets(
	Id INT IDENTITY PRIMARY KEY,
	Id_event int NOT NULL,
	Id_mod int NOT NULL,
	Id_cust int NULL,

	Sector INT NOT NULL,
	RowNumber INT NOT NULL,
	Place INT NOT NULL,

	StatusVis VARCHAR(10) NOT NULL,
	Event_date VARCHAR(10) NOT NULL,
	FinalPrice DECIMAL(18,2) NOT NULL,
	
	FOREIGN KEY (Id_event) REFERENCES Posters(Id_poster),
	FOREIGN KEY (Id_mod) REFERENCES Modifier_Set(Id_mod),
	FOREIGN KEY (Id_cust) REFERENCES Visitor(Id_visitor),
);

--USE [CircusAuditDB];
--INSERT INTO Visitor VALUES ('Friday','Fry','Smith');
GO
declare @CurrMod int = 5
declare @CurrVisit int = 5
declare @CurrEvent int = 4
declare @CurrRow int = 2
declare @CurrPlace int = 2

INSERT INTO Tickets 
	   VALUES
	   (
		@CurrEvent,
		@CurrMod,
		@CurrVisit,
		(select Id_sector from Modifier_Set where Id_mod=@CurrMod),
		@CurrRow ,
		@CurrPlace,
		(select Id_Meaning from Status_Set where Id = (select Id_status from Modifier_Set where Id_mod=@CurrMod)),
		(select Event_data from Posters where Id_poster=@CurrEvent),
		(select Posters.Prise from Posters where Id_poster=@CurrEvent)
		*(select Value from Sector_Set where Id = (select Id_sector from Modifier_Set where Id_mod=@CurrMod))
		*(select Value from Status_Set where Id = (select Id_status from Modifier_Set where Id_mod=@CurrMod))
		*(select Value from Weekend_Set where Id = (select Id_weekend from Modifier_Set where Id_mod=@CurrMod))
		*(select Value from Wholesale_Set where Id = (select Id_whlsale from Modifier_Set where Id_mod=@CurrMod))
		)

GO
declare @CurrMod int = 5
declare @CurrVisit int = 5
declare @CurrEvent int = 5
declare @CurrRow int = 2
declare @CurrPlace int = 2

INSERT INTO Tickets 
	   VALUES
	   (
		@CurrEvent,
		@CurrMod,
		@CurrVisit,
		(select Id_sector from Modifier_Set where Id_mod=@CurrMod),
		@CurrRow ,
		@CurrPlace,
		(select Id_Meaning from Status_Set where Id = (select Id_status from Modifier_Set where Id_mod=@CurrMod)),
		(select Event_data from Posters where Id_poster=@CurrEvent),
		(select Posters.Prise from Posters where Id_poster=@CurrEvent)
		*(select Value from Sector_Set where Id = (select Id_sector from Modifier_Set where Id_mod=@CurrMod))
		*(select Value from Status_Set where Id = (select Id_status from Modifier_Set where Id_mod=@CurrMod))
		*(select Value from Weekend_Set where Id = (select Id_weekend from Modifier_Set where Id_mod=@CurrMod))
		*case 
			when  (select count(*) from Tickets 
				where ((@CurrVisit in (Tickets.Id_cust))
					AND ((select DISTINCT Event_data from Posters where Id_poster=@CurrEvent)in (Tickets.Event_date))))=0
			then (select Value from Wholesale_Set where Id=1)
			
			when (select count(*) from Tickets 
				where ((@CurrVisit in (Tickets.Id_cust))
					AND ((select DISTINCT Event_data from Posters where Id_poster=@CurrEvent)in (Tickets.Event_date))))>0
			then (select Value from Wholesale_Set where Id=2)
			end
		)

		/*use [CircusAuditDB]
DROP TABLE [dbo].[Ticket];
DROP TABLE [dbo].[Posters];		

DROP TABLE [dbo].[Visitor];
DROP TABLE [dbo].[Modifier_Set];
DROP TABLE [dbo].[Sector_Set];
DROP TABLE [dbo].[Status_Set];
DROP TABLE [dbo].[Weekend_Set];
DROP TABLE [dbo].[Wholesale_Set];
*/
/*
TRUNCATE TABLE Tickets;
TRUNCATE TABLE Visitor;
TRUNCATE TABLE Modifier_Set;
TRUNCATE TABLE Sector_Set;
TRUNCATE TABLE Weekend_Set;
TRUNCATE TABLE Wholesale_Set;*/