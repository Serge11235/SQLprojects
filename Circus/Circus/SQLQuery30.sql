USE [CircusAuditDB]
GO

--посетители 
if not exists(select * from sys.tables where name = 'Visitor')
CREATE TABLE Visitor(
	Id_visitor INT IDENTITY PRIMARY KEY,
	FirstName VARCHAR(10) NOT NULL,
	SecondName VARCHAR(10) NOT NULL,
	Surname VARCHAR(10) NOT NULL,
)

GO
INSERT INTO Visitor VALUES ('Ivan','Ivanovich','Ivanov');
INSERT INTO Visitor VALUES ('Petr','Petrovich','Petrov');
INSERT INTO Visitor VALUES ('Sidor','Sidorovich','Sidirov');
INSERT INTO Visitor VALUES ('Friday','Fry','Smith');
INSERT INTO Visitor VALUES ('Tester','Test','T');

GO
if not exists(select * from sys.tables where name = 'Tickets')
CREATE TABLE Tickets(
	Id_Ticket INT IDENTITY PRIMARY KEY,
	Id_event int NOT NULL,
	Id_visitorFK int NULL,

	Sector INT NOT NULL,
	RowNumber INT NOT NULL,
	Place INT NOT NULL,

	Event_date VARCHAR(10) NOT NULL,
	
	FOREIGN KEY (Id_event) REFERENCES Posters(Id_poster),
	FOREIGN KEY (Id_visitorFK) REFERENCES Visitor(Id_visitor),
);

--словарь
if not exists(select * from sys.tables where name = 'Modifier_Set')
CREATE TABLE Modifier_Set(
	Id_MS INT IDENTITY  PRIMARY KEY,
	Id_Meaning VARCHAR(20) NOT NULL,
	PercentValue DECIMAL(18,2) NOT NULL,
	MoneyValue DECIMAL(18,2) NOT NULL,
)

INSERT INTO Modifier_Set VALUES ('sector A',1.,0.)--1
INSERT INTO Modifier_Set VALUES ('sector B',0.85,25.)--2
INSERT INTO Modifier_Set VALUES ('sector C',0.7,50.)--3

INSERT INTO Modifier_Set VALUES ('adult',1.,0.)--4
INSERT INTO Modifier_Set VALUES ('child',0.5,50.)--5
INSERT INTO Modifier_Set VALUES ('student',0.7,40.)--6
INSERT INTO Modifier_Set VALUES ('pensioner',0.8,35.)--7

INSERT INTO Modifier_Set VALUES ('Weekend', 1., 0.)--8
INSERT INTO Modifier_Set VALUES ('NoWeekend',0.8, 30.)--9

INSERT INTO Modifier_Set VALUES ('firstTicket', 1., 0.)--10
INSERT INTO Modifier_Set VALUES ('notfirstTicket',0.5,100.)--11

INSERT INTO Modifier_Set VALUES ('Special',0.5, 100.)--12

--модификатор(цены) USE [CircusAuditDB]
GO
if not exists(select * from sys.tables where name = 'Modifier')
CREATE TABLE Modifier(
	Id_mod INT IDENTITY  PRIMARY KEY,
	Id_TicketFK int NOT NULL,
	Id_Type int NOT NULL,
	PriorityType int NOT NULL,
	FOREIGN KEY (Id_TicketFK) REFERENCES Tickets(Id_Ticket),
	FOREIGN KEY (Id_Type) REFERENCES Modifier_Set(Id_MS),
)

--USE [CircusAuditDB]
GO

	declare @CurrEvent int = 1
	declare @CurrVisit int = 2
	declare @CurrSector int = 3
	declare @CurrRow int = 1
	declare @CurrPlace int = 1
	INSERT INTO Tickets VALUES (@CurrEvent, @CurrVisit, @CurrSector, @CurrRow, @CurrPlace , (select Event_data from Posters where Id_poster=@CurrEvent))
	
	declare @CurrIdTicket int = 3
	INSERT INTO Modifier Values (@CurrIdTicket , (select Sector from Tickets where Id_Ticket=@CurrIdTicket), 1)
	INSERT INTO Modifier Values (@CurrIdTicket , 5, 2)
	INSERT INTO Modifier Values (@CurrIdTicket , 8, 3)
	INSERT INTO Modifier Values (@CurrIdTicket , 10, 4)

--USE [CircusAuditDB]
/*CREATE TABLE PriceTab(
	ticketId int,
	price decimal(18,4), 
)*/
--USE [CircusAuditDB]
GO
	INSERT INTO PriceTab VALUES (1, (SELECT Prise FROM Posters Where Id_poster=1)*
			(SELECT PercentValue FROM Modifier_Set Where Id_MS=(select Id_type from Modifier where Id_TicketFK=1 AND PriorityType =1))*
			(SELECT PercentValue FROM Modifier_Set Where Id_MS=(select Id_type from Modifier where Id_TicketFK=1 AND PriorityType =2))*
			(SELECT PercentValue FROM Modifier_Set Where Id_MS=(select Id_type from Modifier where Id_TicketFK=1 AND PriorityType =3))*
			(SELECT PercentValue FROM Modifier_Set Where Id_MS=(select Id_type from Modifier where Id_TicketFK=1 AND PriorityType =4))
			);



	INSERT INTO Tickets VALUES (1, 1, 1, 1, 1, (select Event_data from Posters where Id_poster=1));
	INSERT INTO Tickets VALUES (1, 1, 1, 1, 1, (select Event_data from Posters where Id_poster=1));
	INSERT INTO Tickets VALUES (1, 1, 1, 1, 1, (select Event_data from Posters where Id_poster=1));
	INSERT INTO Tickets VALUES (1, 1, 1, 1, 1, (select Event_data from Posters where Id_poster=1));
	INSERT INTO Tickets VALUES (1, 1, 1, 1, 1, (select Event_data from Posters where Id_poster=1));