USE [CircusAuditDB];

--TEST "AP" TRIGGER
/*
INSERT INTO Personnel 
	VALUES ('dfgapppa','Taylor','Noah','2','1996','12', 'false', '099939918', '2000-05-05', NULL,'');
INSERT INTO Personnel 
	VALUES ('appa','Taylor','Noah','2','1996','12', 'false', '099939918', '2000-05-05', NULL,'');
	*/

--TEST TIGER TRIGGER
/*
INSERT INTO Animals
	VALUES ('1', 'Claw', '2010', '1', '', '1', 'not aggressive good trained');
*/

--TEST ElephantPeppy TRIGGER
/*
INSERT INTO Animals
	VALUES ('2', 'pappy', '2010', '1', '', '1', 'not aggressive good trained');
*/

--TEST time DELETE TRIGGER
/*
DELETE FROM Animals WHERE ID_animal=18;
*/

--TEST time INSERT TRIGGER
/*
INSERT INTO Animals
	VALUES ('2', 'pappy', '2010', '1', '', '1', 'not aggressive good trained');
	*/

--TEST time UPDATE TRIGGER
/*
UPDATE Animals
SET Name='Alf0', Birth = '2013'
WHERE Name ='Ara3';
*/


--TEST list inserting TRIGGER
/*
insert into Posters values ('2015-07-07','Harkov show','1,4,2,4,5,6,1');
insert into Posters values ('2015-07-07','Kiev show','1,2,4,5');
insert into Posters values ('2015-11-22','Touring circus','6,3,1');
insert into Posters values ('2015-08-07','Demo','3');
insert into Posters values ('2015-08-09','Demo2','3');*/