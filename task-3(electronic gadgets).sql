-- task-3
-- 1)
select * from orders
join customers
on Customers.customerID=orders.CustomerID;
-- 2)
select ProductName,(price*quantity) as Total_revenue from products
join orderDetails
on products.ProductID=OrderDetails.ProductID;
-- 3)
select FirstName,LastName,phone from customers
where ordercount>=1;
-- 4)
select ProductName,max(Quantity) from products
join OrderDetails
on products.ProductID=OrderDetails.ProductID
group by ProductName;
-- 5)
alter table products change description category varchar(255);
select category from products;
-- 6)
select FirstName,LastName,avg(TotalAmount) from customers c
join orders
on c.CustomerID=orders.CustomerID
group by c.customerID;
-- 7)
select OrderID,c.firstname,c.lastname,(TotalAmount) as Total_revenue from Orders
join customers c
on c.CustomerID=orders.CustomerID
group by OrderID
order by totalamount desc limit 1;

-- 8)
insert into products values(12,'computer','consumer electronics',200000);
select ProductName,count(*) as count from products
group by ProductName;
-- 9)
select TotalAmount as total_revenue from orders
where OrderDate between '2025-01-25' and '2025-04-02' ;
-- 10)
select * from customers where customerID=(select CustomerID from orders
where OrderID=(select OrderID from OrderDetails where productID=10));