create table customers (
  customers_id INT unique,
  first_name TEXT,
  last_name text,
  email text,
  city text
  );


insert into customers values
  (0,'-','-','-','-'),
  (1,'Joe','Haston','joeji@gamil.com','Chiang Mai'),
  (2,'Jack','Luna','jlka@hotmail.com','Bangkok'),
  (3,'Mary','Jane','maryj@gamil.com','Nakhon Pathom'),
  (4,'Max','Smith','maxth@gamil.com','Bankok'),
  (5,'Tom','Brown','tom@gamil.com','Phuket');

.mode box
select * from customers;
-------------------------------------------------------------------



create table menus (
  product_id int unique,
  product_name text,
  product_type text,
  product_price int
);


insert into menus values
  (1,'Espresso','Hot',55),
  (2,'Espresso','Cold',65),
  (3,'Americano','Hot',50),
  (4,'Americano','Cold',60),
  (5,'Latte','Hot',55),
  (6,'Latte','Cold',65),
  (7,'Cappuccino','Hot',60),
  (8,'Cappuccino','Cold',70),
  (9,'Mocha','Hot',60),
  (10,'Mocha','Cold',70),
  (11,'Macchiato','Hot',65),
  (12,'Macchiato','Cold',75);

.mode box
select * from menus;


-------------------------------------------------------------------
create table orders (
  orders_id int unique,
  orders_date date,
  customers_id int,
  product_id int,
  quantity int
);

insert into orders values
  (1,'2023-12-15',2,1,2),
  (2,'2023-12-15',0,4,3),
  (3,'2023-12-15',1,4,1),
  (4,'2023-12-15',3,2,2),
  (5,'2023-12-15',0,3,2),
  (6,'2023-12-16',0,1,1),
  (7,'2023-12-16',0,3,3),
  (8,'2023-12-16',0,2,2),
  (9,'2023-12-16',2,1,1),
  (10,'2023-12-16',2,4,1),
  (11,'2023-12-16',2,5,1),
  (12,'2023-12-16',0,4,1),
  (13,'2023-12-16',1,7,1),
  (14,'2023-12-16',5,8,1),
  (15,'2023-12-16',4,9,1),
  (16,'2023-12-16',3,10,1),
  (17,'2023-12-16',0,4,1),
  (18,'2023-12-16',0,4,1),
  (19,'2023-12-16',3,4,1),
  (20,'2023-12-16',5,4,1),
  (21,'2023-12-16',0,2,1),
  (22,'2023-12-16',0,6,1),
  (23,'2023-12-17',5,10,1),
  (24,'2023-12-17',3,10,1),
  (25,'2023-12-17',4,4,1),
  (26,'2023-12-17',0,4,1),
  (27,'2023-12-17',0,4,1),
  (28,'2023-12-17',2,1,1),
  (29,'2023-12-17',4,4,1),
  (30,'2023-12-17',0,10,1),
  (31,'2023-12-17',2,1,1),
  (32,'2023-12-17',0,10,1),
  (33,'2023-12-18',0,4,1),
  (34,'2023-12-18',0,4,1),
  (35,'2023-12-18',2,1,1),
  (36,'2023-12-18',4,4,1),
  (37,'2023-12-18',5,8,1),
  (38,'2023-12-18',0,4,1),
  (39,'2023-12-18',1,4,1),
  (40,'2023-12-18',0,4,1),
  (41,'2023-12-18',0,1,1),
  (42,'2023-12-18',0,2,1),
  (43,'2023-12-19',4,4,1),
  (44,'2023-12-19',3,2,1),
  (45,'2023-12-19',5,4,1),
  (46,'2023-12-19',3,2,1),
  (47,'2023-12-19',4,6,1),
  (48,'2023-12-19',2,1,1),
  (49,'2023-12-19',0,1,1),
  (50,'2023-12-19',0,4,1),
  (51,'2023-12-20',2,1,1),
  (52,'2023-12-20',0,4,1),
  (53,'2023-12-20',0,4,1),
  (54,'2023-12-20',0,4,1),
  (55,'2023-12-20',0,4,1),
  (56,'2023-12-20',0,4,1),
  (57,'2023-12-20',0,10,1),
  (58,'2023-12-20',0,12,1),
  (59,'2023-12-20',0,8,1),
  (60,'2023-12-20',0,4,1),
  (61,'2023-12-20',0,6,1),
  (62,'2023-12-20',0,4,1),
  (63,'2023-12-20',0,2,1),
  (64,'2023-12-20',0,11,1),
  (65,'2023-12-20',0,4,1),
  (66,'2023-12-20',0,8,1),
  (67,'2023-12-20',0,12,1),
  (68,'2023-12-20',0,4,3),
  (69,'2023-12-20',2,1,1),
  (70,'2023-12-20',4,4,1),
  (71,'2023-12-20',0,4,1),
  (72,'2023-12-21',0,4,1),
  (73,'2023-12-21',3,2,1),
  (74,'2023-12-21',4,6,1),
  (75,'2023-12-21',0,8,1),
  (76,'2023-12-21',0,10,1),
  (77,'2023-12-21',1,5,1),
  (78,'2023-12-21',0,4,3),
  (79,'2023-12-21',0,12,1),
  (80,'2023-12-21',0,4,2);
  

.mode box
select * from orders;

-----------------------------------------------------------------------



.mode box
select 
  orders_date,
  first_name,
  product_name,
  quantity
from orders
join customers on orders.customers_id = customers.customers_id
join menus on orders.product_id = menus.product_id;

--total revenue
.mode box
select sum(quantity*product_price) as total_price
from orders
join menus on menus.product_id = orders.product_id;

--total cup
.mode box
select product_name, product_type,count()
from orders
join menus on menus.product_id = orders.product_id
where product_type = 'Hot'
group by 1
order by 3 desc;

.mode box
select product_name, product_type,count()
from orders
join menus on menus.product_id = orders.product_id
where product_type = 'Cold'
group by 1
order by 3 desc ;

--Find customers who are not members.
.mode box
select first_name,orders_date,product_name,count(*) 
from (select * from customers
  where city = '-') as customers_Bkk
join orders on customers_Bkk.customers_id = orders.customers_id
join menus on orders.product_id = menus.product_id
group by 1,2,3;

--find customers that buy coffee on 2023-10
.mode box
select orders_date,first_name,product_name,product_type,quantity
from (select * from orders
  where strftime('%Y-%m',orders_date) = '2023-12') as orders_2023_10
join customers on orders_2023_10.customers_id = customers.customers_id
join menus on orders_2023_10.product_id = menus.product_id;
