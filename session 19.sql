/*
1. Run a SELECT query on a large 'orders' table (at least 10,000 rows) to find all orders for a 
specific user_id and measure the query execution time.
*/

/*
Orders (
    order_id INT,
    user_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

SELECT *
FROM Orders
WHERE user_id = 105;
*/

/*
2. Create an index on the user_id column of the 'orders' table and re-run the same SELECT 
query to measure the new execution time.<br><br><em><strong>Hint:</strong> Use CREATE INDEX 
idx_user_id ON orders(user_id); and compare the times before and after.</em>
*/

/*
CREATE INDEX idx_user_id
ON Orders(user_id);

SELECT *
FROM Orders
WHERE user_id = 105;
*/

/*
3. Use the EXPLAIN PLAN command to analyze how your SELECT query runs before and after adding 
the index, and write down the key differences you observe in the output.
*/

/*
EXPLAIN
SELECT *
FROM Orders
WHERE user_id = 105;

EXPLAIN
SELECT *
FROM Orders
WHERE user_id = 105;

*/

/*
4. Write a query for a 'products' table that avoids a full table scan by using an index on 
the 'category' column to fetch all products in a specific category.
*/

/*
CREATE INDEX idx_category
ON Products(category);

SELECT *
FROM Products
WHERE category = 'Electronics';

EXPLAIN
SELECT *
FROM Products
WHERE category = 'Electronics';
*/

/*
5. Suppose your SELECT query on the 'orders' table is still slow even after adding an index. 
Use EXPLAIN PLAN and research at least one more optimization technique (other than indexing) 
using an AI tool like ChatGPT or Copilot, and describe how you would apply it.
*/

/*
EXPLAIN
SELECT *
FROM Orders
WHERE user_id = 105;

SELECT
    order_id,
    order_date,
    total_amount
FROM Orders
WHERE user_id = 105;
*/