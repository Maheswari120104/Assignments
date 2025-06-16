-- Task-1
-- 1)
create database TechShop;
use TechShop;
-- 2) and 4)
create table customers(
CustomerID int primary key auto_increment,
FirstName varchar(200) not null,
LastName varchar(200) not null,
Email varchar(200) not null,
Phone varchar(20) not null,
Address varchar(200)
);

create table Products(
ProductId int primary key ,
ProductName varchar(200) ,
Description varchar(200),
Price int not null
);
create table orders(
OrderID int primary key not null,
CustomerID int,
foreign key(CustomerID) references customers(CustomerID) on delete  cascade,
OrderDate Date not null,
TotalAmount float not null
);

create table OrderDetails(
OrderDetailID int primary key not null,
OrderID int,
foreign key(OrderID) references orders(OrderID) on delete cascade,
ProductID int,
foreign key(productId) references Products(ProductID) on delete cascade,
Quantity int not null
);
create table Inventory(
InventoryID int primary key not null,
ProductID int,
foreign key(productID) references Products(ProductID) on delete cascade,
QuantityInStock int,
LastStockUpdate datetime not null
);

-- 5)
insert into customers(FirstName,LastName,Email,Phone,Address)
 values('Maheswari','sankar','abc@gmail.com',6543200000,'chennai'),
 ('Mari','san','anc@gmail.com',6243210000,'chennai'),
 ('Mahe','sankar','amc@gmail.com',1234560000,'chennai'),
 ('Mahes','sankar','arc@gmail.com',6543200000,'chennai'),
 ('ritu','baskar','aec@gmail.com',2345000000,'chennai'),
 ('nandhu','raj','abd@gmail.com',6543210000,'chennai'),
 ('logi','babu','dba@gmail.com',6543220000,'chennai'),
 ('logesh','raj','bdc@gmail.com',6543230000,'chennai'),
 ('sundari','sankar','bac@gmail.com',6543280000,'chennai'),
 ('saravana','sankar','cab@gmail.com',6543340000,'chennai');
 select * from customers;
 set foreign_key_checks=1;
insert into Products(ProductId,ProductName,Description,Price )
 values(1,'Laptop','Computing Gadgets',500000),
 (2,'Mouse','Computer Accessories',100000),
 (3,'computer','Computing Gadgets',30000),
 (4,'charger','Mobile Accessories',8000),
 (5,'air conditioner','Cooling Devices',50000),
 (6,'microwave oven','Kitchen Appliances',10000),
 (7,'fridge','Home Appliances',90000),
 (8,'washing machine','Washing Equipment',20000),
 (9,'television','Entertainment Devices',30000),
 (10,'android','Smartphones',10000);
 
 alter table products change description category varchar(255);
 
 select * from customer;
 insert into orders(OrderID,CustomerID,OrderDate,TotalAmount )
 values(1,1,'2025-01-20',500000),
 (2,3,'2025-01-2',100000),
 (3,4,'2025-01-25',30000),
 (4,5,'2025-02-25',1000),
 (5,6,'2025-01-25',50),
 (6,7,'2025-02-12',100),
 (7,8,'2025-02-14',5),
 (8,9,'2025-03-20',20),
 (9,2,'2025-03-25',30),
 (10,10,'2025-03-26',100);
 
 insert into OrderDetails(OrderDetailId,OrderID,ProductID,Quantity )
 values(1,2,1,100),
 (2,3,2,10),
 (3,4,3,30),
 (4,5,6,10),
 (5,6,7,50),
 (6,7,8,100),
 (7,8,9,50),
 (8,9,10,20),
 (9,10,4,30),
 (10,1,5,100);
 set foreign_key_checks=1;
insert into Inventory(InventoryId,ProductID,QuantityInStock,LastStockUpdate)
 values(1,1,10,'2025-01-12 14:00:00'),
 (2,2,11,'2025-01-18 14:01:00'),
 (3,3,20,'2025-01-20 14:02:00'),
 (4,4,40,'2025-01-20 14:02:00'),
 (5,5,50,'25-01-20 14:02:00'),
 (6,6,60,'2025-01-20 14:02:00'),
 (7,7,70,'2025-01-20 14:02:00'),
 (8,8,80,'2025-01-20 14:02:00'),
 (9,10,90,'2025-01-20 14:02:00'),
 (10,9,100,'2025-01-20 14:02:00');
 
 