USE [CircusAuditDB];

INSERT INTO Activity_Set (Id_Action, Id_Meaning) VALUES ('1','action');
INSERT INTO Activity_Set (Id_Action, Id_Meaning) VALUES ('2','sick');
INSERT INTO Activity_Set (Id_Action, Id_Meaning) VALUES ('3','tour');
INSERT INTO Activity_Set (Id_Action, Id_Meaning) VALUES ('4','sales');

INSERT INTO Animals_Set (Id_Animal, Id_Meaning) VALUES ('1','tiger');
INSERT INTO Animals_Set (Id_Animal, Id_Meaning) VALUES ('2','elephant');
INSERT INTO Animals_Set (Id_Animal, Id_Meaning) VALUES ('3','horse');
INSERT INTO Animals_Set (Id_Animal, Id_Meaning) VALUES ('4','bird');
INSERT INTO Animals_Set (Id_Animal, Id_Meaning) VALUES ('5','tortoise');

INSERT INTO Blood_Group_Set (Id_blood, Id_Meaning) VALUES ('1','1+');
INSERT INTO Blood_Group_Set (Id_blood, Id_Meaning) VALUES ('2','2+');
INSERT INTO Blood_Group_Set (Id_blood, Id_Meaning) VALUES ('3','3+');
INSERT INTO Blood_Group_Set (Id_blood, Id_Meaning) VALUES ('4','4+');
INSERT INTO Blood_Group_Set (Id_blood, Id_Meaning) VALUES ('5','1-');
INSERT INTO Blood_Group_Set (Id_blood, Id_Meaning) VALUES ('6','2-');
INSERT INTO Blood_Group_Set (Id_blood, Id_Meaning) VALUES ('7','3-');
INSERT INTO Blood_Group_Set (Id_blood, Id_Meaning) VALUES ('8','4-');

INSERT INTO Education_Set (Id_education, Id_Meaning) VALUES ('1','no educate');
INSERT INTO Education_Set (Id_education, Id_Meaning) VALUES ('2','secondary');
INSERT INTO Education_Set (Id_education, Id_Meaning) VALUES ('3','higher not actor');
INSERT INTO Education_Set (Id_education, Id_Meaning) VALUES ('4','higher actor');

INSERT INTO Type_turn_Set (Id_turn, Id_Meaning) VALUES ('1','clown');
INSERT INTO Type_turn_Set (Id_turn, Id_Meaning) VALUES ('2','juggler');
INSERT INTO Type_turn_Set (Id_turn, Id_Meaning) VALUES ('3','equilibriste');
INSERT INTO Type_turn_Set (Id_turn, Id_Meaning) VALUES ('4','force turn');
INSERT INTO Type_turn_Set (Id_turn, Id_Meaning) VALUES ('5','animals');
INSERT INTO Type_turn_Set (Id_turn, Id_Meaning) VALUES ('6','illusionist');

INSERT INTO Job_2klass (Id_specialization, Id_Meaning) VALUES ('1','master');
INSERT INTO Job_2klass (Id_specialization, Id_Meaning) VALUES ('2','assistant');
INSERT INTO Job_2klass (Id_specialization, Id_Meaning) VALUES ('3','headmaster');
INSERT INTO Job_2klass (Id_specialization, Id_Meaning) VALUES ('4','accounting');
INSERT INTO Job_2klass (Id_specialization, Id_Meaning) VALUES ('5','cleaner');
INSERT INTO Job_2klass (Id_specialization, Id_Meaning) VALUES ('6','engineer');
INSERT INTO Job_2klass (Id_specialization, Id_Meaning) VALUES ('7','marketer');
INSERT INTO Job_2klass (Id_specialization, Id_Meaning) VALUES ('8','clown');
INSERT INTO Job_2klass (Id_specialization, Id_Meaning) VALUES ('9','juggler');
INSERT INTO Job_2klass (Id_specialization, Id_Meaning) VALUES ('10','equilibriste');
INSERT INTO Job_2klass (Id_specialization, Id_Meaning) VALUES ('11','force show');
INSERT INTO Job_2klass (Id_specialization, Id_Meaning) VALUES ('12','illusionist');

INSERT INTO Job_1klass (Id_TypePers, Id_Meaning, Specialization) VALUES ('1','trainer', '1');
INSERT INTO Job_1klass (Id_TypePers, Id_Meaning, Specialization) VALUES ('2','trainer', '2');
INSERT INTO Job_1klass (Id_TypePers, Id_Meaning, Specialization) VALUES ('3','administration', '3');
INSERT INTO Job_1klass (Id_TypePers, Id_Meaning, Specialization) VALUES ('4','administration', '4');
INSERT INTO Job_1klass (Id_TypePers, Id_Meaning, Specialization) VALUES ('5','service', '5');
INSERT INTO Job_1klass (Id_TypePers, Id_Meaning, Specialization) VALUES ('6','service', '6');
INSERT INTO Job_1klass (Id_TypePers, Id_Meaning, Specialization) VALUES ('7','service', '7');
INSERT INTO Job_1klass (Id_TypePers, Id_Meaning, Specialization) VALUES ('8','actor', '8');
INSERT INTO Job_1klass (Id_TypePers, Id_Meaning, Specialization) VALUES ('9','actor', '9');
INSERT INTO Job_1klass (Id_TypePers, Id_Meaning, Specialization) VALUES ('10','actor', '10');
INSERT INTO Job_1klass (Id_TypePers, Id_Meaning, Specialization) VALUES ('11','actor', '11');
INSERT INTO Job_1klass (Id_TypePers, Id_Meaning, Specialization) VALUES ('12','actor', '12');

INSERT INTO Animals (TypeAnimal, Name, Birth, Blood_Group, Documents,Activity, Skills) 
	VALUES ('5', 'Josh', '1954', '3', '', '3', 'slow creep');
INSERT INTO Animals 
	VALUES ('5','Stew', '1990', '2', '', '4', 'fast swim');
INSERT INTO Animals
	VALUES ('1', 'Claw', '2010', '1', '', '1', 'not aggressive good trained');
INSERT INTO Animals
	VALUES ('1', 'Fang', '2010', '1', '', '1', 'not aggressive good trained');
INSERT INTO Animals 
	VALUES ('1', 'Paw', '2010', '1', '', '1', 'not aggressive frisky trained');
INSERT INTO Animals 
	VALUES ('1', 'King', '2009', '6', '', '1', 'head bit aggressive ');
INSERT INTO Animals 
	VALUES ('2', 'Tusk', '2011', '5', '', '1', 'clever, powerfull');
INSERT INTO Animals  
	VALUES ('3', 'White', '2012', '7', '', '1', 'ride around the circle');
INSERT INTO Animals 
	VALUES ('3', 'Snow', '2012', '7', '', '1', 'ride around the circle');
INSERT INTO Animals
	VALUES ('3','Dark', '2013', '2', '', '1', 'beat the hoof ride around the circle');
INSERT INTO Animals
	VALUES ('4', 'Ara1', '2012', NULL, '', '1', 'tamed, disappearing skill(illusion)');
INSERT INTO Animals 
	VALUES ('4', 'Ara2', '2013', NULL, '', '1', 'tamed');
INSERT INTO Animals
	VALUES ('4', 'Ara3', '2012', NULL, '', '1', 'tamed');
INSERT INTO Animals (TypeAnimal, Name, Birth, Blood_Group, Documents,Activity, Skills) 
	VALUES ('4', 'Ara4', '2014', NULL, '', '1', 'tamed');

insert into Personnel values ('Diz','Smith','Vernon','3','1975','1', 'true', '0999379991', '2005-05-05', NULL,'');
insert into Personnel values ('Bob','Johnson','Wesley','2','1980','2', 'false', '0999379992', '2006-01-01', NULL,'');
insert into Personnel values ('Jack','Williams','Victor','2','1985','2', 'false', '0999379993', '2005-10-09', NULL,'');
insert into Personnel values ('Jimmy','Jones','Jack','3','1966','3', 'false', '0999379994', '1995-05-05', NULL,'');
insert into Personnel values ('Karl','Brown','Troy','4','1981','4', 'false', '0999379995', '2000-05-05', NULL,'');
insert into Personnel values ('Adam','Davis','Sheldon','2','1986','5', 'false', '0999379996', '2013-05-05', NULL,'');
insert into Personnel values ('Leonard','Miller','Ron','1','1970','5', 'false', '0999379997', '2014-05-05', '2015-01-09','');
insert into Personnel values ('Ross','Wilson','Vincent','2','1990','5', 'false', '0999379998', '2015-05-05', NULL,'');
insert into Personnel values ('Kelly','White','Marry','2','1990','5', 'false', '0999379998', '2015-10-09', NULL,'');
insert into Personnel values ('Roy','Moore','Oscar','4','1989','6', 'false', '0999379999', '2000-05-05',  NULL,'');
insert into Personnel values ('Jack','Taylor','Noah','2','1996','7', 'false', '0999379910', '2000-05-05', NULL,'');
insert into Personnel values ('Bill','Smith','Miles','1','1980','7', 'false', '0999379911', '2000-05-05',  NULL,'');
insert into Personnel values ('Harry','Anderson','Lee','1','1980','8', 'false', '0999379912', '2000-05-05', NULL,'');
insert into Personnel values ('Adam','Davis','Sheldon','3','1986','8', 'false', '0999379913', '2013-05-05', NULL,'');
insert into Personnel values ('Leonard','Miller','Ron','3','1970','9', 'false', '0999379914', '2014-05-05', NULL,'');
insert into Personnel values ('Ross','Wilson','Vincent','2','1990','10', 'false', '099979915', '2015-05-05', NULL,'');
insert into Personnel values ('Kelly','White','Marry','2','1990','11', 'false', '099939916', '2015-10-09', NULL,'');
insert into Personnel values ('Roy','Moore','Oscar','4','1989','12', 'false', '099937917', '2000-05-05', NULL,'');
insert into Personnel values ('Jack','Taylor','Noah','2','1996','12', 'false', '099939918', '2000-05-05', NULL,'');

insert into Turns values ('HappyUSsad','00:20:00','1','13,14','1,2','')
insert into Turns values ('Fire juggler','00:20:00','2','15','','')
insert into Turns values ('Over the cliff','00:20:00','3','16','','')
insert into Turns values ('Forse','00:20:00','4','17','7,9,10','')
insert into Turns values ('Wild-Wild-West','00:20:00','5','1,2,3','3,4,5,6','')
insert into Turns values ('Illusion','00:20:00','6','18,19','11,12,13','')

insert into Posters values ('2015-08-14','New show','1,2,3,4', 200.);
insert into Posters values ('2015-08-19','Open air','3,4,5,6', 400.);
insert into Posters values ('2015-07-07','Harkov show','1,4,2,4,5,6,1', 300.);
insert into Posters values ('2015-07-07','Kiev show','1,2,4,5', 200.);
insert into Posters values ('2015-11-22','Touring circus','6,3,1', 200.);
insert into Posters values ('2015-08-07','Demo','3', 100.);
insert into Posters values ('2015-08-09','Demo2','3', 100.);