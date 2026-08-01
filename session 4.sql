/*
Write an SQL query to find all restaurants in a table called Restaurants whose names 
end with 'Cafe' using the LIKE operator.
*/

/*
SELECT *
FROM Restaurants
WHERE name LIKE '%Cafe';
*/

/*
In a Flipkart-style Products table, 
use the BETWEEN operator to select all products with a price between 500 and 1500 rupees.
*/

/*
SELECT *
FROM Products
WHERE price BETWEEN 500 AND 1500;
*/

/*
Write an SQL query to display all users from a Users table whose city 
is either 'Ahmedabad', 'Surat', or 'Vadodara' using the IN operator.
*/

/*
SELECT *
FROM Users
WHERE city IN ('Ahmedabad', 'Surat', 'Vadodara');
*/


/*
Given a table called Songs with columns song_name and artist_name, 
find all songs where the artist_name contains the letter sequence 'ar' 
anywhere in the name using the LIKE operator.
Hint: Use wildcards on both sides of the pattern.</em>
*/

/*
SELECT *
FROM Songs
WHERE artist_name LIKE '%ar%';
*/