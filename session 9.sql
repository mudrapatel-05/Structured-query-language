/*
1. Create two tables, influencers and brands, with at least 3 sample rows each. 
Use a FULL OUTER JOIN to list all influencers and brands, showing influencer_name and brand_name, 
matching on city. If there is no match, display NULL for the missing side.
 Use LEFT JOIN, RIGHT JOIN, and UNION if your SQL dialect does not support FULL OUTER JOIN directly.
*/

/*
CREATE TABLE influencers (
    id INT PRIMARY KEY,
    influencer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE brands (
    id INT PRIMARY KEY,
    brand_name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO influencers VALUES
(1, 'Aarav', 'Mumbai'),
(2, 'Neha', 'Delhi'),
(3, 'Riya', 'Pune');

INSERT INTO brands VALUES
(101, 'Nike', 'Mumbai'),
(102, 'Adidas', 'Bangalore'),
(103, 'Puma', 'Delhi');

SELECT
    i.influencer_name,
    b.brand_name,
    i.city
FROM influencers i
LEFT JOIN brands b
ON i.city = b.city

UNION

SELECT
    i.influencer_name,
    b.brand_name,
    b.city
FROM influencers i
RIGHT JOIN brands b
ON i.city = b.city;
*/

/* 
2. Given a table called playlists with columns (id, playlist_name, 
parent_playlist_id), write a SELF JOIN query to display each playlist 
alongside its parent playlist's name, similar to how Spotify might nest playlists.
*/

/*
CREATE TABLE playlists (
    id INT PRIMARY KEY,
    playlist_name VARCHAR(50),
    parent_playlist_id INT
);

INSERT INTO playlists VALUES
(1, 'Workout', NULL),
(2, 'Morning Workout', 1),
(3, 'Evening Workout', 1),
(4, 'Cardio Mix', 2);

SELECT
    child.playlist_name AS Playlist,
    parent.playlist_name AS Parent_Playlist
FROM playlists child
LEFT JOIN playlists parent
ON child.parent_playlist_id = parent.id;
*/

/*
3. Create two tables: users and offers. Write a CROSS JOIN query 
to generate all possible combinations of users and offers, displaying 
user_name and offer_title. Explain in a comment how this could be used for a 
Flipkart-style personalized offer campaign.
*/

/*
CREATE TABLE users (
    id INT PRIMARY KEY,
    user_name VARCHAR(50)
);

CREATE TABLE offers (
    id INT PRIMARY KEY,
    offer_title VARCHAR(100)
);

INSERT INTO users VALUES
(1,'Rahul'),
(2,'Sneha'),
(3,'Karan');

INSERT INTO offers VALUES
(101,'10% Off Electronics'),
(102,'Buy 1 Get 1 Free'),
(103,'Free Delivery');

SELECT
    u.user_name,
    o.offer_title
FROM users u
CROSS JOIN offers o;
*/


/*
4. You have an employees table with columns (id, name, manager_id). 
Write a SELF JOIN to display each employee's name along with their manager's name. 
Then, modify your query to only show employees who do not have a manager (i.e., top-level managers).
*/

/*
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    manager_id INT
);

INSERT INTO employees VALUES
(1,'Amit',NULL),
(2,'Priya',1),
(3,'Rohit',1),
(4,'Neha',2),
(5,'Kunal',2);

SELECT
    e.name AS Employee,
    m.name AS Manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.id;

SELECT
    e.name AS Top_Level_Manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.id
WHERE e.manager_id IS NULL;
*/

/*
5. Use ChatGPT or Copilot to help you write a SQL query that finds all pairs
of users from a users table who live in the same city (excluding pairs where the user 
is compared with themselves). Paste the query and briefly describe how the AI helped you improve or debug it.
*/


/*
SELECT
    u1.user_name AS User1,
    u2.user_name AS User2,
    u1.city
FROM users u1
JOIN users u2
ON u1.city = u2.city
AND u1.id < u2.id;
*/