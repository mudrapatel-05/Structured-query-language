-- Section A (Concpt application)


-- Answer 1 


SELECT restaurant_name,
       SUM(total_amount) AS total_revenue,
       COUNT(order_id) AS total_orders
FROM orders
GROUP BY restaurant_name
HAVING SUM(total_amount) > 100000
   AND COUNT(order_id) >= 50;


-- Answer 2 


SELECT customers.customer_name,
       orders.order_id,
       orders.order_date
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id;


-- Answer 3


SELECT agent_name,
       AVG(delivery_time) AS avg_time
FROM deliveries
GROUP BY agent_name
HAVING AVG(delivery_time) <
(
    SELECT AVG(delivery_time)
    FROM deliveries
);


-- Answer 4

/*
I would use DENSE_RANK() because it gives continuous ranking without 
skipping numbers. This makes it easier to identify the top restaurants in each city.
*/

-- Answer 5 


SELECT customer_name,
       total_spend,
       CASE
           WHEN total_spend > 5000 THEN 'Platinum'
           WHEN total_spend >= 2000 THEN 'Gold'
           ELSE 'Standard'
       END AS customer_type
FROM customers;


-- Answer 6 


CREATE INDEX idx_customer
ON orders(customer_id);


-- Section B (Practical Coding Tasks)

-- Task 1


CREATE TABLE food_orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    restaurant_name VARCHAR(50),
    item_ordered VARCHAR(50),
    quantity INT,
    price_per_item DECIMAL(10,2),
    order_date DATE,
    city VARCHAR(50)
);

INSERT INTO food_orders VALUES
(1,'Rahul','Pizza Hut','Pizza',2,300,'2026-07-01','Mumbai'),
(2,'Priya','McDonalds','Burger',1,150,'2026-07-02','Surat'),
(3,'Amit','Dominos','Pizza',3,250,'2026-07-03','Mumbai'),
(4,'Sneha','Subway','Sandwich',2,180,'2026-07-04','Ahmedabad'),
(5,'Karan','Pizza Hut','Pasta',1,220,'2026-07-05','Mumbai'),
(6,'Neha','Dominos','Garlic Bread',2,120,'2026-07-06','Surat'),
(7,'Rohan','McDonalds','Fries',3,100,'2026-07-07','Mumbai'),
(8,'Anjali','Subway','Wrap',2,200,'2026-07-08','Ahmedabad');

SELECT *
FROM food_orders
WHERE city = 'Mumbai'
ORDER BY price_per_item DESC;

SELECT DISTINCT restaurant_name
FROM food_orders;

SELECT *
FROM food_orders
ORDER BY price_per_item DESC
LIMIT 5;



-- Task 2 


CREATE TABLE delivery_orders (
    order_id INT PRIMARY KEY,
    restaurant_name VARCHAR(50),
    city VARCHAR(50),
    total_amount DECIMAL(10,2),
    order_status VARCHAR(30),
    order_date DATE
);

INSERT INTO delivery_orders VALUES
(1,'Pizza Hut','Mumbai',1200,'Delivered','2026-07-01'),
(2,'Dominos','Mumbai',1500,'Delivered','2026-07-02'),
(3,'McDonalds','Surat',800,'Delivered','2026-07-03'),
(4,'Pizza Hut','Mumbai',2200,'Delivered','2026-07-04'),
(5,'Subway','Ahmedabad',1800,'Delivered','2026-07-05'),
(6,'Pizza Hut','Mumbai',2500,'Delivered','2026-07-06'),
(7,'Dominos','Surat',3000,'Delivered','2026-07-07'),
(8,'Subway','Ahmedabad',1700,'Delivered','2026-07-08'),
(9,'Pizza Hut','Mumbai',2000,'Delivered','2026-07-09'),
(10,'Dominos','Mumbai',2500,'Delivered','2026-07-10');

SELECT
restaurant_name,
SUM(total_amount) AS total_revenue,
COUNT(order_id) AS total_orders,
AVG(total_amount) AS average_order
FROM delivery_orders
GROUP BY restaurant_name;

SELECT
restaurant_name,
SUM(total_amount) AS total_revenue,
COUNT(order_id) AS total_orders,
AVG(total_amount) AS average_order
FROM delivery_orders
GROUP BY restaurant_name
HAVING SUM(total_amount) > 5000;

SELECT
restaurant_name,
SUM(total_amount) AS total_revenue,
COUNT(order_id) AS total_orders,
AVG(total_amount) AS average_order,
CASE
WHEN SUM(total_amount) > 10000 THEN 'High Revenue'
ELSE 'Moderate Revenue'
END AS Revenue_Status
FROM delivery_orders
GROUP BY restaurant_name
HAVING SUM(total_amount) > 5000;


-- Task 3


CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    phone VARCHAR(15)
);

CREATE TABLE restaurants (
    restaurant_id INT PRIMARY KEY,
    name VARCHAR(50),
    cuisine_type VARCHAR(30),
    city VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    restaurant_id INT,
    amount DECIMAL(10,2),
    order_date DATE
);

INSERT INTO customers VALUES
(1,'Rahul','Mumbai','9876543210'),
(2,'Priya','Surat','9876543211'),
(3,'Amit','Mumbai','9876543212'),
(4,'Sneha','Ahmedabad','9876543213'),
(5,'Rohan','Surat','9876543214'),
(6,'Neha','Mumbai','9876543215');

INSERT INTO restaurants VALUES
(101,'Pizza Hut','Italian','Mumbai'),
(102,'Dominos','Italian','Mumbai'),
(103,'McDonalds','Fast Food','Surat'),
(104,'Subway','Healthy','Ahmedabad'),
(105,'Burger King','Fast Food','Surat'),
(106,'KFC','Fast Food','Mumbai');

INSERT INTO orders VALUES
(1,1,101,1200,'2026-07-01'),
(2,2,103,800,'2026-07-02'),
(3,3,102,1500,'2026-07-03'),
(4,4,104,1800,'2026-07-04'),
(5,1,106,900,'2026-07-05'),
(6,3,101,2200,'2026-07-06');


SELECT
customers.name,
restaurants.name,
orders.amount
FROM orders
INNER JOIN customers
ON orders.customer_id = customers.customer_id
INNER JOIN restaurants
ON orders.restaurant_id = restaurants.restaurant_id;

SELECT
customers.name,
orders.order_id,
orders.amount
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id;

SELECT
customers.name,
restaurants.name,
orders.amount
FROM orders
INNER JOIN customers
ON orders.customer_id = customers.customer_id
INNER JOIN restaurants
ON orders.restaurant_id = restaurants.restaurant_id
WHERE customers.city = restaurants.city;


-- Task 4


CREATE TABLE deliveries (
    delivery_id INT PRIMARY KEY,
    agent_name VARCHAR(50),
    restaurant_name VARCHAR(50),
    delivery_time_mins INT,
    order_date DATE
);

INSERT INTO deliveries VALUES
(1,'Raj','Pizza Hut',25,'2026-07-01'),
(2,'Raj','Dominos',20,'2026-07-02'),
(3,'Amit','Subway',30,'2026-07-03'),
(4,'Amit','Pizza Hut',35,'2026-07-04'),
(5,'Rohan','KFC',18,'2026-07-05'),
(6,'Rohan','McDonalds',22,'2026-07-06'),
(7,'Neha','Dominos',28,'2026-07-07'),
(8,'Neha','Pizza Hut',26,'2026-07-08'),
(9,'Raj','KFC',24,'2026-07-09'),
(10,'Amit','McDonalds',32,'2026-07-10');

WITH agent_stats AS
(
SELECT
agent_name,
AVG(delivery_time_mins) AS avg_delivery_time
FROM deliveries
GROUP BY agent_name
)

SELECT
agent_name,
avg_delivery_time,
RANK() OVER(ORDER BY avg_delivery_time ASC) AS agent_rank,

CASE
WHEN avg_delivery_time <=
(
SELECT AVG(delivery_time_mins)
FROM deliveries
)
THEN 'On Track'
ELSE 'Needs Improvement'
END AS Status

FROM agent_stats;


-- Section C


CREATE DATABASE food_delivery;
USE food_delivery;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE restaurants (
    restaurant_id INT PRIMARY KEY,
    restaurant_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE delivery_agents (
    agent_id INT PRIMARY KEY,
    agent_name VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    restaurant_id INT,
    agent_id INT,
    order_amount DECIMAL(10,2),
    delivery_time_mins INT,
    order_date DATE,

    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id),
    FOREIGN KEY (agent_id) REFERENCES delivery_agents(agent_id)
);

INSERT INTO customers VALUES
(1,'Rahul','Mumbai'),
(2,'Priya','Mumbai'),
(3,'Amit','Surat'),
(4,'Sneha','Ahmedabad'),
(5,'Rohan','Surat'),
(6,'Neha','Mumbai'),
(7,'Karan','Ahmedabad'),
(8,'Anjali','Mumbai'),
(9,'Pooja','Surat'),
(10,'Arjun','Ahmedabad');

INSERT INTO restaurants VALUES
(101,'Pizza Hut','Mumbai'),
(102,'Dominos','Mumbai'),
(103,'McDonalds','Surat'),
(104,'Subway','Ahmedabad'),
(105,'KFC','Mumbai'),
(106,'Burger King','Surat'),
(107,'Food Plaza','Ahmedabad'),
(108,'Spice Villa','Mumbai'),
(109,'Royal Bites','Surat'),
(110,'Cafe Town','Ahmedabad');

INSERT INTO delivery_agents VALUES
(1,'Raj'),
(2,'Amit'),
(3,'Neha'),
(4,'Ravi'),
(5,'Karan'),
(6,'Suresh'),
(7,'Pooja'),
(8,'Ankit'),
(9,'Deep'),
(10,'Riya');

INSERT INTO orders VALUES
(1,1,101,1,1200,25,'2026-07-01'),
(2,2,102,2,1500,22,'2026-07-02'),
(3,3,103,3,800,30,'2026-07-03'),
(4,4,104,4,1800,28,'2026-07-04'),
(5,5,106,5,2200,26,'2026-07-05'),
(6,6,105,6,2500,24,'2026-07-06'),
(7,7,107,7,1600,32,'2026-07-07'),
(8,8,108,8,3000,20,'2026-07-08'),
(9,9,109,9,2700,23,'2026-07-09'),
(10,10,110,10,1900,27,'2026-07-10');

SELECT
restaurant_id,
COUNT(order_id) AS total_orders,
SUM(order_amount) AS total_revenue,
AVG(order_amount) AS average_order
FROM orders
GROUP BY restaurant_id
HAVING COUNT(order_id) > 3;


SELECT
customer_id,
SUM(order_amount) AS total_spend,

CASE
WHEN SUM(order_amount) > 5000 THEN 'Platinum'
WHEN SUM(order_amount) >= 2000 THEN 'Gold'
ELSE 'Standard'
END AS Customer_Type

FROM orders
GROUP BY customer_id
ORDER BY total_spend DESC;

SELECT
r.city,
r.restaurant_name,
SUM(o.order_amount) AS total_revenue,

DENSE_RANK() OVER(
PARTITION BY r.city
ORDER BY SUM(o.order_amount) DESC
) AS ranking

FROM restaurants r
JOIN orders o
ON r.restaurant_id = o.restaurant_id

GROUP BY r.city,r.restaurant_name;



SELECT *

FROM
(
SELECT
*,

ROW_NUMBER() OVER(
PARTITION BY customer_id
ORDER BY order_date DESC
) AS rn

FROM orders
) AS recent_orders

WHERE rn = 1;


CREATE VIEW vw_daily_order_summary AS

SELECT

o.order_date,
c.customer_name,
r.restaurant_name,
a.agent_name,
o.order_amount,
o.delivery_time_mins

FROM orders o

JOIN customers c
ON o.customer_id = c.customer_id

JOIN restaurants r
ON o.restaurant_id = r.restaurant_id

JOIN delivery_agents a
ON o.agent_id = a.agent_id;


SELECT *
FROM vw_daily_order_summary
WHERE order_date >= CURDATE() - INTERVAL 7 DAY;


-- Section D

/*
Write a MySQL query to find the top 3 delivery agents in each city 
based on the number of completed orders. Show each agent's average 
delivery time and rank them using a window function. Include only 
agents who have completed more than 5 orders in that city. Sort the 
output by city and rank.
*/

-- AI's Original Query
SELECT
city,
agent_name,
COUNT(order_id) AS completed_orders,
AVG(delivery_time_mins) AS avg_delivery_time,

RANK() OVER(
PARTITION BY city
ORDER BY COUNT(order_id) DESC
) AS ranking

FROM deliveries

WHERE order_status='Completed'

GROUP BY city,agent_name

ORDER BY city,ranking;



-- Corrected query 
SELECT
city,
agent_name,
COUNT(order_id) AS completed_orders,
AVG(delivery_time_mins) AS avg_delivery_time,

RANK() OVER(
PARTITION BY city
ORDER BY COUNT(order_id) DESC
) AS ranking

FROM deliveries

WHERE order_status = 'Completed'

GROUP BY city, agent_name

HAVING COUNT(order_id) > 5

ORDER BY city, ranking;

