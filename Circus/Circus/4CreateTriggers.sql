--
USE [CircusAuditDB];

if not exists(select * from sys.tables where name = 'CopyPers')
	CREATE TABLE CopyPers(
	Id_pers INT IDENTITY PRIMARY KEY,
	Violator VARCHAR(20),
	Name_pers VARCHAR(20),
	Comment VARCHAR(20),
);

if not exists(select * from sys.tables where name = 'TurnListParse')
	CREATE TABLE TurnListParse( 
		Id_pers INT IDENTITY PRIMARY KEY,
		NumberOfTurn int,
		Event_date date,
		Name varchar(20),
		FOREIGN KEY (NumberOfTurn) REFERENCES Type_turn_Set(Id_turn),
	);

GO
IF OBJECT_ID('restrictionAP') IS NOT NULL
DROP TRIGGER restrictionAP
GO
CREATE TRIGGER restrictionAP 
	ON Personnel
	INSTEAD OF INSERT 
	AS
	declare @id_pers int;
	declare @name_pers varchar(20);
	declare @comment varchar(20);
	declare @surname varchar(20);
	declare @secondname varchar(20);
	declare @education int;
	declare @birth int;
	declare @job int;
	declare @maintrainer bit;
	declare @phonenumber int;
	declare @charge date;
	declare @discharge date;
	declare @document varchar(20);
	declare @user varchar(20);

	select @id_pers = i.Id_person from inserted i;	
	select @name_pers=i.FirstName from inserted i;	
	select @surname =i.Surname from inserted i;
	select @secondname =i.SecondName from inserted i;
	select @education =i.Education from inserted i;
	select @birth =i.Birth from inserted i;
	select @job =i.Job from inserted i;
	select @maintrainer =i.Main_Trainer from inserted i;
	select @phonenumber =i.PhoneNumber from inserted i;
	select @charge =i.Charge_data from inserted i;
	select @discharge =i.DIScharge_data from inserted i;
	select @document =i.Documents from inserted i;
	set @comment=GETDATE();
	select @user = CURRENT_USER;

	IF CHARINDEX('ap', @name_pers) > 0
		insert into CopyPers (Violator, Name_pers, Comment)values(@user, @name_pers, @comment);
	ELSE 
		insert into Personnel values (@name_pers, @surname, @secondname,@education,@birth,@job , @maintrainer, @phonenumber,  @charge, @discharge,@document);


GO
IF OBJECT_ID('restrictionTiger') IS NOT NULL
DROP TRIGGER restrictionTiger
GO
CREATE TRIGGER restrictionTiger 
	ON Animals
	FOR INSERT 
	AS
	declare @typeAnimal int;

	select @typeAnimal = i.TypeAnimal from inserted i
	
	if (@typeAnimal=1)
		begin
			PRINT 'restrict tiger';
			ROLLBACK;
		end


GO
IF OBJECT_ID('restrictionElPAPPY') IS NOT NULL
DROP TRIGGER restrictionElPAPPY
GO
CREATE TRIGGER restrictionElPAPPY
	ON Animals
	FOR INSERT 
	AS
	declare @typeAnimal int;
	declare @name varchar(20);

	select @typeAnimal = i.TypeAnimal from inserted i
	select @name = i.Name from inserted i
	
	if ((@typeAnimal=2) AND(@name='pappy'))
		begin
			PRINT 'restrict PAPPY';
			ROLLBACK;
		end


GO
IF OBJECT_ID('restrictionDeleteByTime') IS NOT NULL
DROP TRIGGER restrictionDeleteByTime
GO
CREATE TRIGGER restrictionDeleteByTime
	ON Animals
	FOR DELETE 
	AS
	declare @timeNow int;
	select @timeNow = DATEPART ( hour , GETDATE());

	if (( @timeNow < 13) OR (@timeNow >20))
		begin
			PRINT 'restricted delete.since 20-00 to 13-00.';
			ROLLBACK;
		end


GO
IF OBJECT_ID('restrictionInsertByTime') IS NOT NULL
DROP TRIGGER restrictionInsertByTime
GO
CREATE TRIGGER restrictionInsertByTime
	ON Animals
	FOR INSERT 
	AS
	declare @timeNow int;
	select @timeNow = DATEPART ( hour , GETDATE());

	if (( @timeNow > 13) OR (@timeNow <7))
		begin
			PRINT 'restricted insert.since 13-00 to 07-00.';
			ROLLBACK;
		end
GO


GO
IF OBJECT_ID('restrictionUpdateByTime') IS NOT NULL
DROP TRIGGER restrictionUpdateByTime
GO
CREATE TRIGGER restrictionUpdateByTime
	ON Animals
	FOR UPDATE
	AS
	declare @timeNow int;
	select @timeNow = DATEPART ( hour , GETDATE());

	if (( @timeNow > 13) OR (@timeNow <7))
		begin
			PRINT 'restricted Update.since 13-00 to 07-00.';
			ROLLBACK;
		end

/*
GO
IF OBJECT_ID('insertWithSubtable') IS NOT NULL
DROP TRIGGER insertWithSubtable
GO
CREATE TRIGGER insertWithSubtable
	ON Posters
	FOR INSERT
	AS
	declare @event_data DATE;
	declare @name varchar(20);
	declare @list varchar(100);

	select @event_data = i.Event_data from inserted i;
	select @name = i.Name from inserted i;
	select @list = i.Turn_List from inserted i;
			
	declare @countSymb int;
	SELECT @countSymb = len( @list) - len(replace( @list,',',''));
	declare @currDetect int;
	declare @nextDetect int;
	SELECT @currDetect =1;
	SELECT @nextDetect =1;

	insert into TurnListParse values (CONVERT(int, SUBSTRING(@list, 0,CHARINDEX(',', @list, 1))),@event_data,@name);
	WHILE (@countSymb>1)
		BEGIN
			SELECT @nextDetect = CHARINDEX(',', @list, @currDetect);
			SELECT @currDetect = CHARINDEX(',', @list, @nextDetect+1);
			insert into TurnListParse values (CONVERT(int, SUBSTRING(@list, @nextDetect+1,@currDetect-@nextDetect-1)),@event_data,@name);
			SELECT @countSymb = @countSymb-1;
		END
	insert into TurnListParse values (CONVERT(int, RIGHT ( @list, len( @list)- @currDetect)),@event_data,@name);
	*/