-- sqlite example db for regression tests
-- schema must match test code's expectations

drop table if exists DataTypeTest;

create table DataTypeTest (
	intpk integer primary key,
	colCount int,
	field_INT INT,
	field_INTEGER INTEGER,
	field_TINYINT TINYINT,
	field_SMALLINT SMALLINT,
	field_MEDIUMINT MEDIUMINT,
	field_BIGINT BIGINT,
	field_UNSIGNED UNSIGNED BIG INT,
	field_INT2 INT2,
	field_INT8 INT8,
	field_CHARACTER CHARACTER(20),
	field_VARCHAR VARCHAR(255),
	field_VARYING VARYING CHARACTER(255),
	field_NCHAR NCHAR(55),
	field_NATIVE NATIVE CHARACTER(70),
	field_NVARCHAR NVARCHAR(100),
	field_TEXT TEXT,
	field_CLOB CLOB,
	field_BLOB BLOB,
	field_REAL REAL,
	field_DOUBLE DOUBLE,
	field_DOUBLEPRECISION DOUBLE PRECISION,
	field_FLOAT FLOAT,
	field_NUMERIC NUMERIC,
	field_DECIMAL DECIMAL(10,5),
	field_BOOLEAN BOOLEAN,
	field_DATE DATE,
	field_DATETIME DATETIME,
	field_NotNullInt int not null,
	field_NullInt int null
);

insert into DataTypeTest(
	intpk,
	colCount,
	-- https://www.sqlite.org/datatype3.html#affinity_name_examples
	field_INT,
	field_INTEGER,
	field_TINYINT,
	field_SMALLINT,
	field_MEDIUMINT,
	field_BIGINT,
	field_UNSIGNED,
	field_INT2,
	field_INT8,
	field_CHARACTER,
	field_VARCHAR,
	field_VARYING,
	field_NCHAR,
	field_NATIVE,
	field_NVARCHAR,
	field_TEXT,
	field_CLOB,
	field_BLOB,
	field_REAL,
	field_DOUBLE,
	field_DOUBLEPRECISION,
	field_FLOAT,
	field_NUMERIC,
	field_DECIMAL,
	field_BOOLEAN,
	field_DATE,
	field_DATETIME,
	field_NotNullInt
)values(
	10, --intpk
	31, --colCount
	20, --INT
	30, --INTEGER
	50, --TINYINT
	60, --SMALLINT
	70, --MEDIUMINT
	80, --BIGINT
	90, --UNSIGNED
	100, --INT2
	110, --INT8
	'field_CHARACTER', --CHARACTER
	'field_VARCHAR', --VARCHAR
	'field_VARYING', --VARYING
	'field_NCHAR', --NCHAR
	'field_NATIVE', --NATIVE
	'field_NVARCHAR', --NVARCHAR
	'field_TEXT', --TEXT
	'field_CLOB', --CLOB
	'field_BLOB', --BLOB
	'field_REAL', --REAL
	'field_DOUBLE', --DOUBLE
	'field_DOUBLEPRECISION', --DOUBLE PRECISION
	'field_FLOAT', --FLOAT
	'field_NUMERIC', --NUMERIC
	'field_DECIMAL', --DECIMAL
	1, --BOOLEAN
	'field_DATE', --DATE
	'field_DATETIME', --DATETIME'
	1984
),(
	11, --intpk
	0, --colCount
	-33, --INT
	30, --INTEGER
	50, --TINYINT
	60, --SMALLINT
	70, --MEDIUMINT
	80, --BIGINT
	90, --UNSIGNED
	100, --INT2
	110, --INT8
	'field_CHARACTER', --CHARACTER
	'field_VARCHAR', --VARCHAR
	'field_VARYING', --VARYING
	'field_NCHAR', --NCHAR
	'field_NATIVE', --NATIVE
	'field_NVARCHAR', --NVARCHAR
	'field_TEXT', --TEXT
	'field_CLOB', --CLOB
	'field_BLOB', --BLOB
	'field_REAL', --REAL
	'field_DOUBLE', --DOUBLE
	'field_DOUBLEPRECISION', --DOUBLE PRECISION
	'field_FLOAT', --FLOAT
	'field_NUMERIC', --NUMERIC
	'field_DECIMAL', --DECIMAL
	1, --BOOLEAN
	'field_DATE', --DATE
	'field_DATETIME', --DATETIME'
	1978
);

-- select * from DataTypeTest;

create table toy (
	toyId int PRIMARY KEY,
	toyName nvarchar(50),
	belongsToId int references pet(petId)
);

create table person (
	personId int PRIMARY KEY,
	personName nvarchar(50),
	favouritePetId int references pet(petId)
);

create table pet (
	petId int PRIMARY KEY,
	petName nvarchar(50),
	ownerId int references person(personId),
	favouritePersonId int references person(personId)
);

insert into person(personId,personName) values(1,'bob'),(2,'fred');
insert into pet(petId,petName, ownerId, favouritePersonId)values(5, 'kitty',1,2);
insert into pet(petId,petName, ownerId, favouritePersonId)values(6, 'fido',2,2);
insert into toy(toyId, toyName, belongsToId) values(11,'mouse',5);
insert into toy(toyId, toyName, belongsToId) values(12,'ball',6);
update person set favouritePetId = 5 where personId = 2;

/* for manual testing of diagrams, commented out to avoid interfering with regression test

-- tall, for checking diagram scaling manually
create table up1 ( upId int PRIMARY KEY);
create table up2 ( upId int PRIMARY KEY, anotherId int references up1(upId));
create table up3 ( upId int PRIMARY KEY, anotherId int references up2(upId));
create table up4 ( upId int PRIMARY KEY, anotherId int references up3(upId));
create table up5 ( upId int PRIMARY KEY, anotherId int references up4(upId));
create table up6 ( upId int PRIMARY KEY, anotherId int references up5(upId));
create table up7 ( upId int PRIMARY KEY, anotherId int references up6(upId));
create table up8 ( upId int PRIMARY KEY, anotherId int references up7(upId));
create table up9 ( upId int PRIMARY KEY, anotherId int references up8(upId));
create table up10 ( upId int PRIMARY KEY, anotherId int references up9(upId));
create table up11 ( upId int PRIMARY KEY, anotherId int references up10(upId));
create table up12 ( upId int PRIMARY KEY, anotherId int references up11(upId));
create table up13 ( upId int PRIMARY KEY, anotherId int references up12(upId));
create table up14 ( upId int PRIMARY KEY, anotherId int references up13(upId));
create table up15 ( upId int PRIMARY KEY, anotherId int references up14(upId));
create table up16 ( upId int PRIMARY KEY, anotherId int references up15(upId));
create table up17 ( upId int PRIMARY KEY, anotherId int references up16(upId));
create table up18 ( upId int PRIMARY KEY, anotherId int references up17(upId));
create table up19 ( upId int PRIMARY KEY, anotherId int references up18(upId));
create table up20 ( upId int PRIMARY KEY, anotherId int references up19(upId));

-- wide, for checking diagram scaling manually
create table parent ( parentId int PRIMARY KEY, grandParentId int references up20(upId));
create table child01 ( childId int PRIMARY KEY, parentId int references parent(parentId));
create table child02 ( childId int PRIMARY KEY, parentId int references parent(parentId));
create table child03 ( childId int PRIMARY KEY, parentId int references parent(parentId));
create table child04 ( childId int PRIMARY KEY, parentId int references parent(parentId));
create table child05 ( childId int PRIMARY KEY, parentId int references parent(parentId));
create table child06 ( childId int PRIMARY KEY, parentId int references parent(parentId));
create table child07 ( childId int PRIMARY KEY, parentId int references parent(parentId));
create table child08 ( childId int PRIMARY KEY, parentId int references parent(parentId));
create table child09 ( childId int PRIMARY KEY, parentId int references parent(parentId));
create table child10 ( childId int PRIMARY KEY, parentId int references parent(parentId));
create table child11 ( childId int PRIMARY KEY, parentId int references parent(parentId));
create table child12 ( childId int PRIMARY KEY, parentId int references parent(parentId));
create table child13 ( childId int PRIMARY KEY, parentId int references parent(parentId));
create table child14 ( childId int PRIMARY KEY, parentId int references parent(parentId));
create table child15 ( childId int PRIMARY KEY, parentId int references parent(parentId));
create table child16 ( childId int PRIMARY KEY, parentId int references parent(parentId));
create table child17 ( childId int PRIMARY KEY, parentId int references parent(parentId));
create table child18 ( childId int PRIMARY KEY, parentId int references parent(parentId));
create table child19 ( childId int PRIMARY KEY, parentId int references parent(parentId));
create table child20 ( childId int PRIMARY KEY, parentId int references parent(parentId));
*/

-- sort-filter testing

create table SortFilterTest (
  id int PRIMARY KEY,
  size int,
  colour nvarchar(50),
	pattern nvarchar(50)
);

insert into SortFilterTest (id, size, colour, pattern) values
	(1, 3,  'red',   'spotty'),
	(2, 4,  'green', 'spotty'),
	(3, 2,  'green', 'plain'),
	(4, 21, 'blue',  'plain'),
	(5, 23, 'blue',  'plain'),
	(6, 22, 'blue',  'plain'),
	(7, 2,  'red',   'tartan');

-- select id, size, colour, pattern from SortFilterTest ;
-- select '---';
-- select id, size, colour, pattern from SortFilterTest where pattern = 'plain' order by colour, size desc;

create table CompoundKeyParent(
	id int,
  padding int,
	colA varchar(10),
	colB varchar(10),
	badger varchar(50),
	primary key (colA, colB)
);

create table CompoundKeyAunty(
	id int,
	colB varchar(10),
	primary key (colB)
);

create table CompoundKeyChild(
	id int PRIMARY KEY,
	colA varchar(10),
	colB varchar(10),
	noise varchar(50),
	foreign key (colB) references CompoundKeyAunty(colB),
	foreign key (colA, colB) references CompoundKeyParent(colA, colB)
);

insert into CompoundKeyParent(id, colA, colB, badger)values
	(1,'a1', 'b1', 'mash'),
	(2,'a2', 'b2', 'bodger'),
	(3,'a2', 'b3', 'mmmmm'),
	(4,'a<&''2\6', 'b2', 'mwah ha ha');
insert into CompoundKeyAunty(id, colB)values
	(10, 'b1'),
	(11, 'b2'),
	(12, 'b3');
insert into CompoundKeyChild(id, colA, colB, noise)values
	(1,'a1', 'b1', 'pig'),
	(2,'a1', 'b1', 'swine'),
	(3,'a2', 'b2', 'horse'),
	(4,'a<&''2\6', 'b2', 'does it blend?');



create table FkParent(
  parentPk int primary key
);
create table FkChild(
  id int primary key,
  parentId int references FkParent(parentPk)
);

insert into FkParent(parentPk) values(10);
insert into FkParent(parentPk) values(11);
insert into FkParent(parentPk) values(12);
insert into FkChild(id, parentId) values(100,10);
insert into FkChild(id, parentId) values(101,10);
insert into FkChild(id, parentId) values(102,10);
insert into FkChild(id, parentId) values(110,11);
insert into FkChild(id, parentId) values(111,11);
insert into FkChild(id, parentId) values(112,11);

create table index_test(
  id int primary key,
  has_index varchar(10)
);
create index IX_on_has_index on index_test (has_index);
