create table customers (
  customers_id INT unique,
  first_name TEXT,
  last_name text,
  email text,
  country text
  );


insert into customers values
  (1,'Joe','Haston','joeji@gamil.com','Germany'),
  (2,'Jack','Luna','jlka@hotmail.com','USA'),
  (3,'Mary','Jane','maryj@gamil.com','United Kingdom'),
  (4,'Max','Smith','maxth@gamil.com','USA'),
  (5,'Tom','Brown','tom@gamil.com','Canada');

.mode box
select * from customers;
-------------------------------------------------------------------




create table orders (
  orders_id int unique,
  orders_date date,
  customers_id int,
  product_id int,
  quantity int
);

insert into orders values
  (1,'2023-10-15',2,4,2),
  (2,'2023-10-19',1,3,3),
  (3,'2023-10-20',2,4,1),
  (4,'2023-10-29',3,2,2),
  (5,'2023-11-08',4,3,2),
  (6,'2023-11-08',4,1,1),
  (7,'2024-01-05',5,3,3);

.mode box
select * from orders;

-----------------------------------------------------------------------



create table menus (
  product_id int unique,
  product_name text,
  product_price int
);


insert into menus values
  (1,'Super Deluxe',10),
  (2,'Seafood Cocktail',12),
  (3,'Hawaiian',9),
  (4,'Shrimp Cocktail',15);

.mode box
select * from menus;
--------------------------------------------------------------------------
.mode box
select 
  orders_date,
  first_name,
  product_name,
  quantity
from orders
join customers on orders.customers_id = customers.customers_id
join menus on orders.product_id = menus.product_id;

--Serch for customers who live in USA
.mode box
select first_name,orders_date,product_name,count(*) 
from (select * from customers
  where country = 'USA') as customers_USA
join orders on customers_USA.customers_id = orders.customers_id
join menus on orders.product_id = menus.product_id
group by 1,2,3;

--find customers that buy pizza on 2023-10
.mode box
select orders_date,first_name,product_name,quantity
from (select * from orders
  where strftime('%Y-%m',orders_date) = '2023-10') as orders_2023_10
join customers on orders_2023_10.customers_id = customers.customers_id
join menus on orders_2023_10.product_id = menus.product_id;
