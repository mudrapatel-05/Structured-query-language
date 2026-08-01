/*
Create two tables in your SQL database: Users (user_id, username, city) 
and Orders (order_id, user_id, product, amount). 
Insert at least 3 users and 5 orders, making sure some users have no orders.
*/

/*
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    product VARCHAR(50),
    amount DECIMAL(10,2)
);

INSERT INTO Users VALUES
(1, 'Rahul', 'Delhi'),
(2, 'Priya', 'Mumbai'),
(3, 'Amit', 'Pune');

INSERT INTO Orders VALUES
(101, 1, 'Pizza', 500),
(102, 1, 'Burger', 250),
(103, 2, 'Pasta', 400),
(104, 2, 'Sandwich', 200),
(105, 4, 'Coffee', 150);

*/

/*
Write an SQL query using INNER JOIN to list all 
usernames and their ordered products, showing only 
users who have placed at least one order.
*/

/*
SELECT
    Users.username,
    Orders.product
FROM Users
INNER JOIN Orders
ON Users.user_id = Orders.user_id;
*/

/*
Write an SQL query using LEFT JOIN to display all usernames 
along with their ordered products. For users who 
haven't placed any orders, show NULL for the product.
*/

/*
SELECT
    Users.username,
    Orders.product
FROM Users
LEFT JOIN Orders
ON Users.user_id = Orders.user_id;
*/


/*
Write an SQL query using RIGHT JOIN to show all orders and 
the corresponding username for each order. If an order has a user_id that 
doesn't exist in the Users table, display NULL for the username.
Hint:Try deleting one user and keeping their order to test this case.
*/

/*
SELECT
    Users.username,
    Orders.product
FROM Users
RIGHT JOIN Orders
ON Users.user_id = Orders.user_id;
*/


/*
Suppose you want to analyze food delivery data like Zomato. 
Create a CustomerSegments table (segment_id, segment_name), and link it 
to Users with a foreign key. Write an SQL query to show each username, 
their segment name, and total order amount (use JOINs as needed).
*/

/*
doubt
*/