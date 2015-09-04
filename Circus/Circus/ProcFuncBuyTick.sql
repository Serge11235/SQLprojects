USE [CircusAuditDB];
GO
IF OBJECT_ID('BuyTicket') IS NOT NULL
DROP PROC BuyTicket;
GO
CREATE PROC BuyTicket
	@CurrEvent int, @CurrVisit int,  @CurrSector int, @CurrRow int, @CurrPlace int, @modStatus int, @modWend int, @modWhlsale int
	AS
	BEGIN
		INSERT INTO Tickets VALUES (@CurrEvent, @CurrVisit, @CurrSector, @CurrRow, @CurrPlace , (select Event_data from Posters where Id_poster=@CurrEvent));
		declare @CurrIdTicket int = (select @@IDENTITY);
	
		INSERT INTO Modifier Values (@CurrIdTicket , @CurrSector, 1);
		INSERT INTO Modifier Values (@CurrIdTicket , @modStatus, 2);
		INSERT INTO Modifier Values (@CurrIdTicket , @modWend, 3);
		INSERT INTO Modifier Values (@CurrIdTicket , @modWhlsale, 4);
	END;

GO
IF OBJECT_ID('GetPrice') IS NOT NULL
DROP PROC GetPrice;
GO
CREATE FUNCTION GetPrice()
	returns money
	begin
		declare @id int = (select IDENT_CURRENT('Tickets'));
		return (SELECT Prise FROM Posters Where Id_poster=(select Id_event from Tickets where Id_Ticket=@id))*
			case
				when ((select Id_MS from Modifier_Set where Id_MS=(select Id_type from Modifier where Id_TicketFK=@id AND PriorityType =3))=8)
				then (SELECT PercentValue FROM Modifier_Set Where Id_MS=(select Id_type from Modifier where Id_TicketFK=@id AND PriorityType =3))

				when ((select Id_MS from Modifier_Set where Id_MS=(select Id_type from Modifier where Id_TicketFK=@id AND PriorityType =3))<>8)
				then (
				(SELECT PercentValue FROM Modifier_Set Where Id_MS=(select Id_type from Modifier where Id_TicketFK=@id AND PriorityType =1))*
				(SELECT PercentValue FROM Modifier_Set Where Id_MS=(select Id_type from Modifier where Id_TicketFK=@id AND PriorityType =2))*
				(SELECT PercentValue FROM Modifier_Set Where Id_MS=(select Id_type from Modifier where Id_TicketFK=@id AND PriorityType =3))*
				(SELECT PercentValue FROM Modifier_Set Where Id_MS=(select Id_type from Modifier where Id_TicketFK=@id AND PriorityType =4))
				)
			end
	end

GO
	declare @CurrEvent int = 7;
	declare @CurrVisit int = 1;
	declare @CurrSector int = 1;
	declare @CurrRow int = 5;
	declare @CurrPlace int = 5;

	declare @modStatus int =4; 
	declare @modWend int =9;
	declare @modWhlsale int =10;

EXEC BuyTicket @CurrEvent,@CurrVisit,@CurrSector,@CurrRow,@CurrPlace,@modStatus,@modWend,@modWhlsale;
SELECT dbo.GetPrice();
