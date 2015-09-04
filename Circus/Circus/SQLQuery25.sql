use [AdventureWorks2012];

CREATE TABLE test(
id int,
	name varchar(10),
)
INSERT INTO test VALUES (1,'%1234sdf');
INSERT INTO test VALUES (2,'%1234sdf');
INSERT INTO test VALUES (3,'%1234sdf');
INSERT INTO test VALUES (4,'12_34_df');
INSERT INTO test VALUES (5,'1_234sdf');

SELECT * FROM test where NOT name IS NULL;
SELECT * FROM test where name like '/%%' ESCAPE '/';

DROP TABLE test;

 declare @bool int;
	if((NULL>2)) set @bool=1;
	if(3>2) set @bool=2;
	
 PRINT @bool;