USE [CircusAuditDB];
--DROP TABLE #temp1
GO
CREATE TABLE #temp1(
	Id_Ticket int,
	EventName varchar(20),
	Event_date date,
	Id_Meaning varchar(20),
	Price money,
)

GO
INSERT INTO #temp1 
	SELECT DISTINCT Id_Ticket, (SELECT Name FROM Posters WHERE Id_poster=Id_event) as EventName, Event_date, 
				Id_Meaning = case when(8 in (select Id_Type from Modifier where Id_TicketFK=Id_Ticket)) then('Weekend')
								else Id_Meaning end,
			((SELECT Prise FROM Posters Where Id_poster=Id_event)*
			(SELECT PercentValue FROM Modifier_Set Where Id_MS=(select Id_type from Modifier where Id_TicketFK=Id_Ticket AND PriorityType =1))*
			(SELECT PercentValue FROM Modifier_Set Where Id_MS=(select Id_type from Modifier where Id_TicketFK=Id_Ticket AND PriorityType =2))*
			(SELECT PercentValue FROM Modifier_Set Where Id_MS=(select Id_type from Modifier where Id_TicketFK=Id_Ticket AND PriorityType =3))*
			(SELECT PercentValue FROM Modifier_Set Where Id_MS=(select Id_type from Modifier where Id_TicketFK=Id_Ticket AND PriorityType =4))) as price
	FROM Tickets, Modifier, Modifier_Set
	WHERE  	(Modifier_Set.Id_MS in (Modifier.Id_Type)) AND
				(Id_Ticket in (Modifier.Id_TicketFK)) AND
					(Modifier.PriorityType =2 OR Id_Meaning = 'Weekend')
				
SELECT * FROM #temp1;

GO
--ясллю я опндюф он опедярюбкемхъл
SELECT  Id_Meaning,Event_date, SUM(Price) as Summ 	
	FROM #temp1
	GROUP BY  Id_Meaning,Event_date
