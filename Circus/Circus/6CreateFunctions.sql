USE [CircusAuditDB];

GO
IF OBJECT_ID('HOW_MANY_TURNS') IS NOT NULL
DROP PROC HOW_MANY_TURNS
GO
CREATE PROC HOW_MANY_TURNS
	@requestedDate DATE
	AS
	begin
		SELECT COUNT(ALL Id_pers) [counter]
		FROM TurnListParse
		WHERE Event_date = @requestedDate
	end;


GO
IF OBJECT_ID('HOW_MANY_ANIMALS') IS NOT NULL
DROP PROC HOW_MANY_ANIMALS
GO
CREATE PROC HOW_MANY_ANIMALS
	@requestedDate DATE
	AS
	begin
		--сколько животных выступает
		declare @allAnimalCount int;
		SELECT @allAnimalCount = COUNT(ALL ID_animal) from Animals;
		
		--идентификатор, которому соответствует выступление с животными.
		declare @keyId int;
		SELECT  @keyId =  Id_turn
			from Type_turn_Set
			where  CHARINDEX('animal', Id_Meaning, 0)!=0
		
		--количество таких номеров в данных день
		declare @allTurnsCount int;
		SELECT  @allTurnsCount = COUNT(ALL Id_pers)
			FROM TurnListParse
			WHERE (Event_date = @requestedDate) AND (NumberOfTurn = @keyId)

		PRINT 'Number of animals is '+convert(varchar(10), @allTurnsCount *  @allAnimalCount)+' this day.'
	end;
GO
EXEC HOW_MANY_ANIMALS '2015-12-22';
GO
IF OBJECT_ID('HOW_MANY_TIMES_ONE_ANIM_WORK') IS NOT NULL
DROP PROC HOW_MANY_TIMES_ONE_ANIM_WORK
GO
CREATE PROC HOW_MANY_TIMES_ONE_ANIM_WORK
	@requestedDate DATE
	AS
	begin
		declare @allTurnsCount int;
		SELECT  @allTurnsCount = COUNT(ALL Id_pers)
			FROM TurnListParse
			WHERE (Event_date = @requestedDate) AND (NumberOfTurn = 5)

		PRINT convert(varchar(10),@allTurnsCount)+' times.'
	end;


/*GO
IF OBJECT_ID('HOW_MANY_TIMES_ONE_ACTOR_WORK') IS NOT NULL
DROP PROC HOW_MANY_TIMES_ONE_ACTOR_WORK
GO
CREATE PROC HOW_MANY_TIMES_ONE_ACTOR_WORK
	@idActor int,
	@requestedDate DATE
	AS
	begin
		declare @ActorsTurnsCounter int;--искомое
		declare @currentActorsTurnsCounter int; --вмогательное

		declare @allTurnsCount int;--всего номеров
		SELECT  @allTurnsCount = COUNT(ALL Id_pers)	FROM TurnListParse
		

		declare @TurnActorsList varchar(20);--список актёров на поточное выступление
		declare @i int = 1;

		WHILE (@i <= @allTurnsCount) --по всем выступлениям этой даты
			begin
			
			declare @currDate date;
			select @currDate = Event_date from TurnListParse where Id_pers=@i;

				if(@currDate = @requestedDate)
				begin
					select @TurnActorsList = Actors_List 
						from Turns
						where Id_pers = @i

					SELECT @currentActorsTurnsCounter = COUNT(ALL id)
						from getTableFromString(@TurnActorsList)
						where (id = @idActor)
					set @ActorsTurnsCounter = @ActorsTurnsCounter+@currentActorsTurnsCounter;

					set @i = @i+1 ;
				end
			end
	end
	*/
GO
IF OBJECT_ID('getTableFromString') IS NOT NULL
DROP FUNCTION getTableFromString
GO 
CREATE FUNCTION getTableFromString(@list varchar(100))
	RETURNS @nameTabl TABLE (id int)
	AS
	begin
		
		declare @countSymb int;
		SELECT @countSymb = len( @list) - len(replace( @list,',',''));
		declare @currDetect int;
		declare @nextDetect int;
		SELECT @currDetect =1;
		SELECT @nextDetect =1;
		if @countSymb = 0
			begin
				insert into @nameTabl values (CONVERT(int, @list));
			end
		else
		if @countSymb = 1
			begin
				insert into @nameTabl values (CONVERT(int, SUBSTRING(@list, 0,CHARINDEX(',', @list, 1))));
				insert into @nameTabl values (CONVERT(int, RIGHT ( @list, len( @list)- CHARINDEX(',', @list, 1))));
			end
		else
			begin
				insert into @nameTabl values (CONVERT(int, SUBSTRING(@list, 0,CHARINDEX(',', @list, 1))));
				WHILE (@countSymb>1)
					BEGIN
						SELECT @nextDetect = CHARINDEX(',', @list, @currDetect);
						SELECT @currDetect = CHARINDEX(',', @list, @nextDetect+1);
						insert into @nameTabl values (CONVERT(int, SUBSTRING(@list, @nextDetect+1,@currDetect-@nextDetect-1)));
						SELECT @countSymb = @countSymb-1;
					END
				if (RIGHT(@list,len(@list)-@currDetect)>0)
					insert into @nameTabl values (CONVERT(int, RIGHT ( @list, len( @list)- @currDetect)));
			end
		return
	end		
GO

EXEC HOW_MANY_TURNS '2015-07-07';
EXEC HOW_MANY_TURNS '2015-11-22';


EXEC HOW_MANY_TIMES_ONE_ANIM_WORK '2015-07-07';

SELECT * FROM getTableFromString('1,15,3');
