use everyloop;

-- 1. F�retagets totala produktkatalog best�r av 77 unika produkter. 
--Om vi kollar bland v�ra ordrar, hur stor andel av dessa produkter 
--har vi n�gon g�ng leverarat till London?
-- Svar: 41/77

--select distinct
--company.products.ProductName
--from company.orders
--join company.order_details on company.order_details.OrderId = company.orders.Id
--join company.products on company.order_details.ProductId = company.products.Id
--where company.orders.ShipCity = 'London'
--;

--select * from company.orders
-- 2. Till vilken stad har vi levererat flest unika produkter?
-- Svar:
--select company.orders.ShipCity
--from company.orders
--join company.order_details on company.order_details.OrderId = company.orders.Id
--join company.products on company.order_details.ProductId = company.products.Id
--order by company.orders.ShipCity
--;