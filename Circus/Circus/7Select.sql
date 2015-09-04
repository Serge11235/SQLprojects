USE [CircusAuditDB];

--— ŒÀ‹ Œ ¬€—“”œÀ≈Õ»… ¬ ƒ≈Õ‹ ¬—≈√Œ
select * from Posters
	ORDER BY Event_data;

select Event_data, (select COUNT(*) from getTableFromString(Turn_List)) as Turn_Amount 
	from Posters
	ORDER BY Event_data;

select Event_data, SUM(Turn_Amount) Summ
	from (select Event_data, (select COUNT(*) from getTableFromString(Turn_List)) as Turn_Amount from Posters) name
	GROUP BY Event_data;


--— ŒÀ‹ Œ ¬€—“ œÀ≈Õ»… ” ¿ “®–¿ ¬ ƒ≈Õ‹ USE [CircusAuditDB];
select Personnel.Id_person, Personnel.FirstName, Posters.Event_data, Turns.ID_turn, Turns.Actors_List
	from Personnel, Posters, Turns
	where Id_person IN (select * from getTableFromString(Actors_List))
	  AND ID_turn IN (select id from (select * from getTableFromString(Turn_List)) parseTurn
								where parseTurn.id =ID_turn)

select Id_person, FirstName, COUNT(*) as Times
	from (	select Personnel.Id_person, Personnel.FirstName, Posters.Event_data, Turns.ID_turn, Turns.Actors_List
				from Personnel, Posters, Turns
				where Id_person IN (select * from getTableFromString(Actors_List))
				  AND ID_turn IN (select id from (select * from getTableFromString(Turn_List)) parseTurn
										where parseTurn.id =ID_turn)
		  ) nameCurr
	GROUP BY  Id_person, FirstName


select Event_data,FirstName, COUNT(*) as Times
	from (	select Personnel.Id_person, Personnel.FirstName, Posters.Event_data, Turns.ID_turn, Turns.Actors_List
				from Personnel, Posters, Turns
				where Id_person IN (select * from getTableFromString(Actors_List))
				  AND ID_turn IN (select id from (select * from getTableFromString(Turn_List)) parseTurn
										where parseTurn.id =ID_turn)
		  ) nameCurr
	GROUP BY  Event_data, FirstName
	ORDER BY Event_data

--— ŒÀ‹ Œ ¬€—“ œÀ≈Õ»… ” «¬≈–ﬂ ¬ ƒ≈Õ‹/— ŒÀ‹ Œ «¬≈–≈… ¬ ƒ≈Õ‹ USE [CircusAuditDB];
select Animals.ID_animal, Animals.TypeAnimal, Animals.Name,Animals_Set.Id_Meaning, Posters.Event_data, Turns.ID_turn, Turns.Animals_List
	from Animals,Animals_Set, Posters, Turns
	where Animals.ID_animal IN (select * from getTableFromString(Animals_List))
	  AND ID_turn IN (select id from (select * from getTableFromString(Turn_List)) parseTurn
								where parseTurn.id =ID_turn)
	  AND  Animals.TypeAnimal = Animals_Set.Id_Animal

select Event_data, Name, Id_Meaning, COUNT(*) as Times
	from (select Animals.ID_animal, Animals.TypeAnimal, Animals.Name,Animals_Set.Id_Meaning, Posters.Event_data, Turns.ID_turn, Turns.Animals_List
			from Animals,Animals_Set, Posters, Turns
					where Animals.ID_animal IN (select * from getTableFromString(Animals_List))
					AND ID_turn IN (select id from (select * from getTableFromString(Turn_List)) parseTurn
								where parseTurn.id =ID_turn)
					AND  Animals.TypeAnimal = Animals_Set.Id_Animal
		  ) nameCurr
	GROUP BY  Event_data, Name, Id_Meaning
	ORDER BY Event_data

select Name, Id_Meaning, COUNT(*) as Times
	from (select Animals.ID_animal, Animals.TypeAnimal, Animals.Name,Animals_Set.Id_Meaning, Posters.Event_data, Turns.ID_turn, Turns.Animals_List
			from Animals,Animals_Set, Posters, Turns
					where Animals.ID_animal IN (select * from getTableFromString(Animals_List))
					AND ID_turn IN (select id from (select * from getTableFromString(Turn_List)) parseTurn
								where parseTurn.id =ID_turn)
					AND  Animals.TypeAnimal = Animals_Set.Id_Animal
		  ) nameCurr
	GROUP BY  Name, Id_Meaning
	--HAVING (count(*)>2)


/*–¿¡Œ◊≈≈, ÕŒ Õ≈ “¿ Œ–√¿Õ»«¿÷»ﬂ
select Animals.TypeAnimal, Animals_Set.Id_Meaning
	from Animals
	INNER JOIN Animals_Set
	ON Animals.TypeAnimal=Animals_Set.Id_Animal;

select Posters.Event_data, Animals.Name,  (select COUNT(*) from Posters where CHARINDEX('5', Posters.Turn_List, 0)!=0) as TurnsNum
	from Posters, Animals, Animals_Set

	
	
select Event_data, SUM(TurnsNum) Summ
	from (select Posters.Event_data, Animals.Name, Animals.TypeAnimal,  (select COUNT(*) from Posters where CHARINDEX('5', Posters.Turn_List, 0)!=0) as TurnsNum
			from Posters, Animals) name
	GROUP BY Event_data;

select Name, SUM(TurnsNum) Summ
	from (select Posters.Event_data, Animals.Name, Animals.TypeAnimal,  (select COUNT(*) from Posters where CHARINDEX('5', Posters.Turn_List, 0)!=0) as TurnsNum
			from Posters, Animals) name
	GROUP BY Name;
	*/
