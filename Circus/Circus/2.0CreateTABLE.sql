USE [CircusAuditDB];

--словарь "признаки активности"
if not exists(select * from sys.tables where name = 'Activity_Set')
CREATE TABLE Activity_Set(
	Id_Action INT PRIMARY KEY,
	Id_Meaning VARCHAR(20)
);

--словарь "группа крови"
if not exists(select * from sys.tables where name = 'Blood_Group_Set')
CREATE TABLE Blood_Group_Set(
	Id_Blood INT PRIMARY KEY, 
	Id_Meaning VARCHAR(20)
);

--словарь "виды животных"
if not exists(select * from sys.tables where name = 'Animals_Set')
CREATE TABLE Animals_Set(
	Id_Animal INT PRIMARY KEY,
	Id_Meaning VARCHAR(20)
);

--база животных
if not exists(select * from sys.tables where name = 'Animals')
CREATE TABLE Animals(
	ID_animal INT IDENTITY PRIMARY KEY, 
	TypeAnimal int NULL,
	Name VARCHAR(20) NOT NULL default '', 
	Birth INT NOT NULL default 0, 
	Blood_Group INT NULL,
	Documents TEXT NOT NULL default '',
	Activity INT NULL,
	Skills TEXT NOT NULL default '',
	FOREIGN KEY (Blood_Group) REFERENCES Blood_Group_Set(Id_Blood),
	FOREIGN KEY (Activity) REFERENCES Activity_Set(Id_Action),
	FOREIGN KEY (TypeAnimal) REFERENCES Animals_Set(Id_Animal),
	-- ограничение значений группы крови/активности значениями из словаря
);

-- словарь "специализация персонала"
if not exists(select * from sys.tables where name = 'Job_2klass')
CREATE TABLE Job_2klass(
	Id_specialization INT PRIMARY KEY,
	Id_Meaning VARCHAR(20)
);

-- словарь "типы персонала"
if not exists(select * from sys.tables where name = 'Job_1klass')
CREATE TABLE Job_1klass(
	Id_TypePers INT PRIMARY KEY,
	Id_Meaning VARCHAR(20),
	Specialization INT NULL,
	FOREIGN KEY (Specialization) REFERENCES Job_2klass(Id_specialization),
);

-- словарь "уровни образования"
if not exists(select * from sys.tables where name = 'Education_Set')
CREATE TABLE Education_Set(
	Id_education INT PRIMARY KEY,
	Id_Meaning VARCHAR(20)
);

--база персонала
if not exists(select * from sys.tables where name = 'Personnel')
CREATE TABLE Personnel(
	Id_person INT IDENTITY PRIMARY KEY, 
	FirstName VARCHAR(20) NOT NULL check(CHARINDEX('ap', FirstName,0)=0) default '', 
	Surname VARCHAR(20) NOT NULL default '', 
	SecondName VARCHAR(20) NOT NULL default '', 
	Education INT NULL, 
	Birth INT NOT NULL default 0, 	
	Job INT NULL,
	Main_Trainer BIT,
	PhoneNumber INT NOT NULL default '', 
	Charge_data DATE NOT NULL, 
	DIScharge_data DATE NULL,
	Documents TEXT NOT NULL default '',
	FOREIGN KEY (Education) REFERENCES Education_Set(Id_education),
	FOREIGN KEY (Job) REFERENCES Job_1klass(Id_TypePers),
);
/*INSERT INTO Personnel 
	VALUES ('dfgapppa','Taylor','Noah','2','1996','12', 'false', '099939918', '2000-05-05', NULL,'');
INSERT INTO Personnel 
	VALUES ('appa','Taylor','Noah','2','1996','12', 'false', '099939918', '2000-05-05', NULL,'');*/

--база афиш
if not exists(select * from sys.tables where name = 'Posters')
CREATE TABLE Posters(
	Id_poster INT IDENTITY PRIMARY KEY,
	Event_data DATE NOT NULL, 
	Name VARCHAR(20) NOT NULL default '',
	Turn_List VARCHAR(100) NOT NULL default '', 
	Prise DECIMAL(18,2) NOT NULL,
);

-- словарь "типы номеров"
if not exists(select * from sys.tables where name = 'Type_turn_Set')
CREATE TABLE Type_turn_Set(
	Id_turn INT PRIMARY KEY,
	Id_Meaning VARCHAR(20)
);

--база номеров(выступлений)
if not exists(select * from sys.tables where name = 'Turns')
CREATE TABLE Turns(
	ID_turn INT IDENTITY PRIMARY KEY, 
	Name_turn  VARCHAR(20) NOT NULL default '',
	Time_turn TIME NOT NULL default '',
	Type_turn INT NULL,
	Actors_List VARCHAR(100) NOT NULL default '', 
	Animals_List VARCHAR(100) NOT NULL default '', 
	Comment  VARCHAR(500) NOT NULL default '',
	FOREIGN KEY (Type_turn) REFERENCES Type_turn_Set(Id_turn),
);

--база ответственных за животных
if not exists(select * from sys.tables where name = 'Responsers')
CREATE TABLE Responsers(
	Trainers_List VARCHAR(100) NOT NULL default '', 
	Staff_List VARCHAR(100) NOT NULL default '', 
);
