use everyloop;

-- 1. F�retagets totala produktkatalog best�r av 77 unika produkter. 
--Om vi kollar bland v�ra ordrar, hur stor andel av dessa produkter 
--har vi n�gon g�ng leverarat till London?
-- Svar: 49/77

--select company.order_details.OrderId, 
--company.order_details.ProductId, 
--company.products.ProductName, 
--company.Orders.ShipCity
--from company.orders
--join company.order_details on company.order_details.OrderId = company.orders.Id
--join company.products on company.order_details.ProductId = company.products.Id
--where company.orders.ShipCity = 'London';
--;

