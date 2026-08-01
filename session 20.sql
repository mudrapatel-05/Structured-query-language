/*
1. Download a sample IPL match data CSV file and load it into a new SQL table called ipl_matches 
using your preferred SQL tool (MySQL Workbench, DBeaver, or Azure Data Studio).
*/

/*
CREATE DATABASE ipl_db;

USE ipl_db;

CREATE TABLE ipl_matches (
    id INT PRIMARY KEY,
    season INT,
    city VARCHAR(50),
    match_date DATE,
    team1 VARCHAR(100),
    team2 VARCHAR(100),
    toss_winner VARCHAR(100),
    winner VARCHAR(100),
    player_of_match VARCHAR(100),
    venue VARCHAR(150)
);

LOAD DATA INFILE 'C:/Downloads/ipl_matches.csv'
INTO TABLE ipl_matches
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
*/

/*
2. Write a SQL query to select all matches where the team 'Mumbai Indians' played,
 then export the query results as a CSV file named mi_matches.csv.
*/

/*
SELECT *
FROM ipl_matches
WHERE team1 = 'Mumbai Indians'
   OR team2 = 'Mumbai Indians';
*/

/*
3. Connect Microsoft Excel to your SQL database and import the ipl_matches table. 
Create a simple table in Excel that shows the total matches played by each team.
*/

/*
Data
↓
Get Data
↓
From Database
↓
From MySQL Database

Server Name

Database Name

ipl_matches

Load

Winner

Count of Winner
*/

/*
4. Connect Power BI Desktop to your SQL database, import the ipl_matches table, 
and create a pivot chart showing the number of wins for each team.
*/

/*
SELECT
    name,
    cuisine,
    rating
FROM Restaurants
WHERE rating > 4.0;



*/

/*
5. Use Python (with pandas and sqlalchemy) to read the mi_matches.csv file, filter matches 
where 'Mumbai Indians' won, and insert those rows into a new SQL table called mi_wins.<br><br><em>
<strong>Hint:</strong> Use pandas.read_csv(), DataFrame filtering, and to_sql() for this task.</em>

*/

/*
SELECT
    restaurant_id,
    name,
    cuisine,
    rating,
    city
FROM Restaurants
WHERE rating BETWEEN @MinRating AND @MaxRating;
*/