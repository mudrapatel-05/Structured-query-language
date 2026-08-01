/*
1. Create two tables: AppOrders (for orders placed via a food delivery app like Zomato) 
and InStoreOrders (for direct restaurant orders), each with columns: order_id, customer_name, 
amount, and order_date. Insert at least 3 sample records into each table.
*/

/*
CREATE TABLE AppOrders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    amount DECIMAL(10,2),
    order_date DATE
);

CREATE TABLE InStoreOrders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    amount DECIMAL(10,2),
    order_date DATE
);

INSERT INTO AppOrders (order_id, customer_name, amount, order_date)
VALUES
(101, 'Rahul', 450.00, '2026-08-01'),
(102, 'Sneha', 320.00, '2026-08-02'),
(103, 'Amit', 580.00, '2026-08-03');

INSERT INTO InStoreOrders (order_id, customer_name, amount, order_date)
VALUES
(201, 'Priya', 250.00, '2026-08-01'),
(202, 'Karan', 410.00, '2026-08-02'),
(203, 'Neha', 300.00, '2026-08-03');
*/

/*
2. Write a SQL query using UNION to combine all unique customer names from both 
AppOrders and InStoreOrders tables into a single list.
*/

/*
SELECT customer_name
FROM AppOrders

UNION

SELECT customer_name
FROM InStoreOrders;
*/
/*
3. Write a SQL query using UNION ALL to display every order (including duplicates if any) 
from both AppOrders and InStoreOrders, showing order_id, customer_name, amount, and order_date.
*/

/*
SELECT
    order_id,
    customer_name,
    amount,
    order_date
FROM AppOrders

UNION ALL

SELECT
    order_id,
    customer_name,
    amount,
    order_date
FROM InStoreOrders;
*/

/*
4. Demonstrate the difference between UNION and UNION ALL by adding a duplicate 
customer_name in both tables, then running both queries and noting the difference 
in the result count.<br><br><em><strong>Hint:</strong> UNION removes duplicates, 
UNION ALL does not.</em>
*/

/*
INSERT INTO InStoreOrders (order_id, customer_name, amount, order_date)
VALUES
(204, 'Rahul', 600.00, '2026-08-04');

SELECT customer_name
FROM AppOrders

UNION

SELECT customer_name
FROM InStoreOrders;

SELECT customer_name
FROM AppOrders

UNION ALL

SELECT customer_name
FROM InStoreOrders;
*/