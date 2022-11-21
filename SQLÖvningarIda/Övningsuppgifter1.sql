--use everyloop;
--create GameOfThrones2;
--select * into GameOfThrones2 from GameOfThrones;

--UPPGIFT 1
--select Title
--,format (GameOfThrones2.EpisodeInSeason, ('#E#00')) as 'Episode'
--,format (GameOfThrones2.Season, ('#S#00')) as 'Season'
--from GameOfThrones2;

--select Title
--,format (Season, ('S0#')) + 
--format (EpisodeInSeason, ('\E00')) as Episode
--from GameOfThrones2;

--select Title
--,concat('S',format(Season,'00'), 'E', format(EpisodeInSeason, '00')) as Episode
--from GameOfThrones;

--UPPGIFT 2
--select * from Users2;
--update Users2
--set UserName =lower(substring(FirstName, 1, 2)) +
--lower(substring(LastName, 1, 2))
--from Users2;

--UPPGIFT 3
--select * into AirPorts2 from Airports;

--update AirPorts2
--set DST = '-'
--where DST is null;

--update AirPorts2
--set Time = '-'
--where Time is null;

--select * from AirPorts2;

--UPPGIFT 4
--select * into Elements2 from Elements;

--delete from Elements2
--where Name = 'Herbium' 
--or Name = 'Helium' 
--or Name = 'Nitrogen' 
--or Name = 'Platinum' 
--or Name = 'Selenium'
--or Name like 'd%'
--or Name like 'k%'
--or Name like 'm%'
--or Name like 'o%'
--or Name like 'u%';

--select * from Elements2;

-- UPPGIFT 5
--Skapa en ny tabell med alla rader från tabellen Elements. 
--Den nya tabellen ska innehålla ”Symbol” och ”Name” från 
--orginalet, samt en tredje kolumn med värdet ’Yes’ för de 
--rader där ”Name” börjar med bokstäverna i ”Symbol”, och ’No’ 
--för de rader där de inte gör det.

--Ex: ’He’ -> ’Helium’ -> ’Yes’, ’Mg’ -> ’Magnesium’ -> ’No’.

--select Symbol, [Name] into Elements3 from Elements;
--alter table Elements3
--add NameSymbol varchar(3);
--update Elements3
--set NameSymbol = 'Yes'
--where (Name like Symbol + '%');
--update Elements3
--set NameSymbol = 'No'
--where NameSymbol is null;

--select * from Elements3;

--UPPGIFT 6
--Kopiera tabellen Colors till Colors2, men skippa kolumnen ”Code”. 
--Gör sedan en select från Colors2 som ger samma resultat som du 
--skulle fått från select * from Colors; 
--(Dvs, återskapa den saknade kolumnen från RGBvärdena i resultatet).

--select * into Colors2 from Colors;
--alter table Colors2
--drop column Code;


--alter table Colors2
--add Code nvarchar(max);

--update Colors2
--set Code = '#'
--+ format(Red, 'X')
--+ format(Green, 'X')
--+ format(Blue, 'X');

--update Colors2
--set Code = 
--convert(varbinary(1), Red) + convert(varbinary(1), Green) + convert(varbinary(1), Blue);

--declare @hex varbinary(max);
--update Colors2
--set @hex = convert(varbinary(1), Red) + convert(varbinary(1),Green)
--+ convert(varbinary(1), Blue) from Colors2;

--select
--[Name],
--Red,
--Green,
--Blue,
--convert(nvarchar, @hex) as Code
--convert(varbinary(1), Red) + convert(varbinary(1), Green) + convert(varbinary(1), Blue) as Code
--from Colors2;

--select * from Colors2;

--UPPGIFT 7
--Kopiera kolumnerna ”Integer” och ”String” från tabellen ”Types”
--till en ny tabell. Gör sedan en select från den nya tabellen som 
--ger samma resultat som du skulle fått från select * from types;

--select Integer, [String] into Types2 from Types;

--declare @d datetime = '2018-12-31';
--declare @b datetime = '09:00:00';
--select [Integer],
--format((cast(([Integer]) as float)/100), '0.##') as [Float],
--String,
--cast (dateadd(minute, [Integer], @d) +
--dateadd(day,[Integer], @b)as datetime2(7)) as DateTime,
--[Integer]%2 as Bool
--from Types2;

--select * from Types;