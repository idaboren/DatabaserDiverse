use everyloop;

-- 1. Företagets totala produktkatalog består av 77 unika produkter. 
--Om vi kollar bland våra ordrar, hur stor andel av dessa produkter 
--har vi någon gång leverarat till London?
-- Svar: 41/77

--select distinct
--company.products.Id
--from company.orders
--join company.order_details on company.order_details.OrderId = company.orders.Id
--join company.products on company.order_details.ProductId = company.products.Id
--where company.orders.ShipCity = 'London';

-- 2. Till vilken stad har vi levererat flest unika produkter?
-- Svar: Boise
--select ShipCity, count(distinct ProductId)
--from company.orders
--join company.order_details on company.order_details.OrderId = company.orders.Id
--join company.products on company.order_details.ProductId = company.products.Id
--group by ShipCity
--order by count(distinct ProductId) desc;

-- 3. Av de produkter som inte längre finns I vårat sortiment, 
-- hur mycket har vi sålt för totalt till Tyskland?
-- Svar: 12047,5 SEK

--select company.orders.ShipCountry, 
--sum(company.order_details.UnitPrice * company.order_details.Quantity ) as Total
--from company.orders
--join company.order_details on company.order_details.OrderId = company.orders.Id
--join company.products on company.order_details.ProductId = company.products.Id
--where company.products.Discontinued = 1 and company.orders.ShipCountry like 'Germany'
--group by ShipCountry

-- 4.För vilken produktkategori har vi högst lagervärde?
-- Svar: Seafood
--select company.categories.CategoryName, 
--sum(company.products.UnitsInStock)
--from company.categories
--join company.products on categories.Id = products.categoryId
--group by CategoryName
--order by sum(company.products.UnitsInStock) desc

-- 5. Från vilken leverantör har vi sålt flest produkter totalt 
-- under sommaren 2013?
-- Svar: Plutzer Lebensmittelgroßmärkte AG
--select CompanyName,
--sum(Quantity) as SoldProducts
--from company.suppliers
--join company.products on suppliers.Id = SupplierId
--join company.order_details on products.Id = ProductId
--join company.orders on order_details.OrderId = orders.Id
--where OrderDate >= '2013-06-01' 
--and OrderDate <= '2013-08-31'
--group by CompanyName
--order by SoldProducts desc

--------------------------------------------------------------------------

declare @playlist varchar(max) = 'Heavy Metal Classic';

--select music.genres.[Name] as Genre,
--music.artists.[Name] Artist,
--music.albums.Title as Album,
--music.tracks.[Name] Track,
--music.tracks.milliseconds as [Length], -- !!!
--music.tracks.Bytes/1000000 as Size,
--music.tracks.Composer as Composer
--from music.tracks
--join music.playlist_track on music.playlist_track.TrackId = music.tracks.TrackId
--join music.playlists on music.playlist_track.PlaylistId = music.playlists.PlaylistId
--join music.genres on music.tracks.GenreId = music.genres.GenreId
--join music.albums on music.tracks.AlbumId = music.albums.AlbumId
--join music.artists on music.albums.ArtistId = music.artists.ArtistId
--where music.playlists.[Name] like @playlist

-- 1. Av alla audiospår, vilken artist har längst total speltid?
-- Svar: Iron Maiden

--select music.artists.[Name] as Artist, 
--sum(music.tracks.Milliseconds) as [TotalLength]
--from music.tracks
--join music.playlist_track on music.playlist_track.TrackId = music.tracks.TrackId
--join music.playlists on music.playlist_track.PlaylistId = music.playlists.PlaylistId
--join music.genres on music.tracks.GenreId = music.genres.GenreId
--join music.albums on music.tracks.AlbumId = music.albums.AlbumId
--join music.artists on music.albums.ArtistId = music.artists.ArtistId
--join music.media_types on music.tracks.MediaTypeId = music.media_types.MediaTypeId
--where music.media_types.MediaTypeId != '3'
--group by music.artists.Name
--order by [TotalLength] desc

-- 2.Vad är den genomsnittliga speltiden på den artistens låtar?
-- Svar: 5,6 minuter (335108 milliseconds)

--select avg(music.tracks.milliseconds) as [AverageLength]
--from music.tracks
--join music.playlist_track on music.playlist_track.TrackId = music.tracks.TrackId
--join music.playlists on music.playlist_track.PlaylistId = music.playlists.PlaylistId
--join music.genres on music.tracks.GenreId = music.genres.GenreId
--join music.albums on music.tracks.AlbumId = music.albums.AlbumId
--join music.artists on music.albums.ArtistId = music.artists.ArtistId
--where music.artists.[Name] like 'Iron Maiden'
--group by artists.[Name]

--3. Vad är den sammanlagda filstorleken för all video?
-- Svar: 

select sum(cast(music.tracks.Bytes as bigint)/1000000) as TotalSize
from music.tracks
join music.media_types on music.tracks.MediaTypeId = music.media_types.MediaTypeId
where media_types.MediaTypeId = 3

