 -- task-2
 -- 1)
 select FirstName,LastName,email  from customers;
 -- 2)
 select orders.orderID,orders.totalamount,orders.OrderDate,FirstName,LastName from Customers,
  orders
 where orders.CustomerID=customers.CustomerID;
 -- 3)
 insert into customers(FirstName,LastName,Email,phone,Address) values
 ('sreenidhi','rajkumar','wxy@gmail.com',3456789000,'mumbai');
 -- 4)
 set sql_safe_updates=0;
 update products set price=price+(0.1)*price;
 select * from orderdetails;
 -- 5)
 delete from orders where OrderID=2;
 set foreign_key_checks=0;
 -- 6)
 insert into orders(OrderId,CustomerID,OrderDate,TotalAmount )
 values(11,11,'2025-06-07',3000);
 -- 7)
 update customers set email='sad@gmail.com',phone=4040404040,address='mumbai'
 where CustomerID=1;
 -- 8)
update orders o set totalamount=
(select sum(p.price*od.quantity) from products p join orderdetails od
on od.productID=p.productID
where o.orderid=od.orderid );
select * from orderdetails;
alter table orders modify totalamount int ;
-- 9)
delete from orders where CustomerId=4;-- it automatically deletes the value in orderdetails as we have applied on delete cascade
-- 10)
insert into products values
(11,'drone','surveillance',2000);
-- 11)
alter table orders add status varchar(255) not null;
set sql_safe_updates=0;
alter table orders modify status varchar(255) default 'pending';
update orders set status='pending';


update orders set status='shipped' where status='pending' and OrderID=8;
-- 12)
alter table customers add ordercount int;
update customers c set ordercount=(
select count(*) from orders
where c.CustomerID=orders.CustomerID
group by customerID);
select ordercount from customers;