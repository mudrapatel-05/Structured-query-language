/*
Open your SQL editor and run a query to select all columns from a table 
named restaurants using SELECT * FROM restaurants;.
*/

-- SELECT* FROM resturants;

/*
Write an SQL query to display only the name and rating columns 
from the table zomato_reviews.
*/

-- SELECT name, rating FROM zomato_reviews

/*
Write an SQL query to select the movie_name and release_year columns 
from a table called movies, but rename movie_name as 'Title' and release_year 
as 'Year Released' in the output using the AS keyword.
*/

/*
SELECT
	moive_name AS title,
    release_year AS "year released"
FROM movies;
*/

/*
In a table called products, write an SQL query that selects all columns and add a
 comment in your SQL code explaining what the query does.
 Hint: Use -- to write a single-line comment above your query.</em>
*/

/*
-- This query selects all columns and all records from the products table
SELECT *
FROM products;
*/