USE [CircusAuditDB]; 

GO
if not exists(select * from sys.tables where name = 'Feed_Set')
CREATE TABLE Feed_Set(
	Id_FS INT IDENTITY  PRIMARY KEY,
	Id_Meaning VARCHAR(20) NOT NULL,
	MoneyValuePerKg DECIMAL(18,2) NOT NULL,
)

GO
if not exists(select * from sys.tables where name = 'Feeding')
CREATE TABLE Feeding(
	Id_feeding INT IDENTITY  PRIMARY KEY,
	Id_animalFK INT NOT NULL,
	Id_type INT NOT NULL,
	KgValuePerDay DECIMAL(18,4) NOT NULL,
	FOREIGN KEY (Id_animalFK) REFERENCES Animals(ID_animal),
	FOREIGN KEY (Id_type) REFERENCES Feed_Set(Id_FS),
)
/*
insert into Feed_Set Values('Meat', 85.50);
insert into Feed_Set Values('Fish', 50.50);
insert into Feed_Set Values('Oats', 25.50);
insert into Feed_Set Values('Greenery', 50.00);
insert into Feed_Set Values('Seeds', 40.00);
insert into Feed_Set Values('Vitamine', 260.00);

insert into Feeding values(1, 1, 5.);
insert into Feeding values(1, 6, 0.001);
insert into Feeding values(2, 4, 10.);
insert into Feeding values(3, 3, 3.);
insert into Feeding values(4, 5, 0.1);
insert into Feeding values(5, 4, 0.05);
insert into Feeding values(5, 6, 0.0005);
*/
GO
CREATE TABLE #lossTable(
	TypeOfAnimal int,
	totalloss money,
	)

--SELECT * FROM Feeding;
--SELECT * FROM Feed_Set;

--SELECT Id_animalFK as TypeOfAnimal, KgValuePerDay, MoneyValuePerKg, (KgValuePerDay*MoneyValuePerKg) as loss
	--FROM Feed_Set, Feeding
	--WHERE Feed_Set.Id_FS in (Feeding.Id_type)

INSERT INTO #lossTable
  SELECT TypeOfAnimal, SUM(loss) as totalloss
	FROM 
	(
	SELECT Id_animalFK as TypeOfAnimal, KgValuePerDay, MoneyValuePerKg, (KgValuePerDay*MoneyValuePerKg) as loss
	FROM Feed_Set, Feeding
	WHERE Feed_Set.Id_FS in (Feeding.Id_type)
	) as currtable
	GROUP BY TypeOfAnimal

SELECT * FROM #lossTable;

SELECT Id_turn, (SELECT COUNT(*) FROM getTableFromString (Animals_List)) as CountAnimByTurn
	FROM Turns 

SELECT Id_poster, Turn_List, Prise, (SELECT COUNT(*) FROM getTableFromString (Turn_List)) as TurnCount, Prise/(SELECT COUNT(*) FROM getTableFromString (Turn_List)) as PriceByTurnThisDay
	FROM  Posters

GO
select ID_animal, TypeAnimal, (select totalloss from #lossTable where TypeOfAnimal=Animals.TypeAnimal) as loss,
	   Animals.Name, Event_data, Id_poster, Turn_List, Animals_List, (SELECT COUNT(*) FROM getTableFromString (Animals_List)) as CountAnimByTurn
	from Animals, Posters, Turns
	where ((ID_turn in (select * from getTableFromString(Turn_List))) AND  (ID_animal in (select * from getTableFromString(Animals_List))))
	ORDER BY Id_poster

GO
DROP TABLE #lossTable;