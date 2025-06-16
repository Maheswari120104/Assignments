-- task-4
-- 1)
select * from customers where customerID not in(select customerID from orders);
-- 2)
select quantityinstock from inventory where productid in(select productid from products);
-- 3)
select sum(TotalAmount) from orders where orderid in (select orderid from orderdetails);
-- 4)
select avg(quantity) from orderdetails
join products
on products.productID=orderdetails.productID
where category='Smartphones';
-- 5)
select sum(Totalamount) from orders o
where o.customerID in (select customerID from customers where customerid=8);
-- 6)
select * from customers where ordercount =(select ordercount from customers order by ordercount desc limit 1); 
-- 7)
select category from products p where productid =(select od.productid from orderdetails od  group by od.productid order by
 sum(quantity)  desc limit 1);
-- 8)
select FirstName,LastName,( select max(TotalAmount) from orders) as max_total from customers
 where CustomerID=(select o.CustomerID from orders o order by TotalAmount desc limit 1);
 -- 9)
 select avg(avg_sales) from(select sum(totalamount)/count(*) as avg_sales from orders
 group by orderID) as total_sales;
 -- 10)
 select firstname,lastname,ordercount from customers where customerid in(select customerid from orderdetails);
 