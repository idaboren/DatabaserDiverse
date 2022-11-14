--create database DemoDb;
use DemoDb;
create table Candy (
	[Name] nvarchar(max),
	[Type] nvarchar(max)
);

insert into Candy ([Name], [Type])
values ('Dumle', 'Choklad');

select * from Candy;

--drop table Candy;

