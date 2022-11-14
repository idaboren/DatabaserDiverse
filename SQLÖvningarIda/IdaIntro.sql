-- create database DjurDb;
--create table DjurTble(
--	[Namn] nvarchar(max) not null,
--	[Id] int Primary Key
--);

--insert into DjurTble ([Namn], [Id])
--values 
--('Hamster',1),
--('Hund', 2),
--('Katt', 3)
--	('Kanin', 4);

--select * from DjurTble
--where Namn like '%a%';

--drop table DjurTble;

--drop database DjurDb;

--create database KlassenDb;

--create table personer(
--[Id] int Primary Key,
--[Förnamn] nvarchar(max) not null,
--[Efternamn] nvarchar(max) not null,
--[Ålder] int,
--[Hemort] nvarchar(max) not null);

insert into personer ([Förnamn], [Efternamn], [Ålder], [Hemort])
values ('Ida', 'Borén', 28, 'Göteborg')

select * from personer;
