USE [CircusAuditDB];

SELECT DISTINCT Id_Ticket, (SELECT Name FROM Posters WHERE Id_poster=Id_event) as EventName, Event_date, 
			((SELECT Prise FROM Posters Where Id_poster=Id_event)*
			case
				when ((select Id_MS from Modifier_Set where Id_MS=(select Id_type from Modifier where Id_TicketFK=Id_Ticket AND PriorityType =3))=8)
				then (SELECT PercentValue FROM Modifier_Set Where Id_MS=(select Id_type from Modifier where Id_TicketFK=Id_Ticket AND PriorityType =3))

				when ((select Id_MS from Modifier_Set where Id_MS=(select Id_type from Modifier where Id_TicketFK=Id_Ticket AND PriorityType =3))<>8)
				then (
				(SELECT PercentValue FROM Modifier_Set Where Id_MS=(select Id_type from Modifier where Id_TicketFK=Id_Ticket AND PriorityType =1))*
				(SELECT PercentValue FROM Modifier_Set Where Id_MS=(select Id_type from Modifier where Id_TicketFK=Id_Ticket AND PriorityType =2))*
				(SELECT PercentValue FROM Modifier_Set Where Id_MS=(select Id_type from Modifier where Id_TicketFK=Id_Ticket AND PriorityType =3))*
				(SELECT PercentValue FROM Modifier_Set Where Id_MS=(select Id_type from Modifier where Id_TicketFK=Id_Ticket AND PriorityType =4))
				)
			end
			) as price
	FROM Tickets, Modifier, Modifier_Set
	WHERE (Modifier_Set.Id_MS in (Modifier.Id_Type)) AND
			(Id_Ticket in (Modifier.Id_TicketFK))
			

--ясллю я опндюф он опедярюбкемхъл
SELECT EventName, Event_date, SUM(price) as Summ
	FROM (
	SELECT DISTINCT Id_Ticket, (SELECT Name FROM Posters WHERE Id_poster=Id_event) as EventName, Event_date, 
			((SELECT Prise FROM Posters Where Id_poster=Id_event)*
			case
				when ((select Id_MS from Modifier_Set where Id_MS=(select Id_type from Modifier where Id_TicketFK=Id_Ticket AND PriorityType =3))=8)
				then (SELECT PercentValue FROM Modifier_Set Where Id_MS=(select Id_type from Modifier where Id_TicketFK=Id_Ticket AND PriorityType =3))

				when ((select Id_MS from Modifier_Set where Id_MS=(select Id_type from Modifier where Id_TicketFK=Id_Ticket AND PriorityType =3))<>8)
				then (
				(SELECT PercentValue FROM Modifier_Set Where Id_MS=(select Id_type from Modifier where Id_TicketFK=Id_Ticket AND PriorityType =1))*
				(SELECT PercentValue FROM Modifier_Set Where Id_MS=(select Id_type from Modifier where Id_TicketFK=Id_Ticket AND PriorityType =2))*
				(SELECT PercentValue FROM Modifier_Set Where Id_MS=(select Id_type from Modifier where Id_TicketFK=Id_Ticket AND PriorityType =3))*
				(SELECT PercentValue FROM Modifier_Set Where Id_MS=(select Id_type from Modifier where Id_TicketFK=Id_Ticket AND PriorityType =4))
				)
			end
			) as price
	FROM Tickets, Modifier, Modifier_Set
	WHERE (Modifier_Set.Id_MS in (Modifier.Id_Type)) AND
			(Id_Ticket in (Modifier.Id_TicketFK))
			
	) as TablePrice
	GROUP BY  EventName, Event_date

