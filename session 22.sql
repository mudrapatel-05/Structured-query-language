/*
1. Use pandas' read_sql() function to load all records from a 'restaurants' table 
(with columns like name, cuisine, rating) in your local SQLite database into a DataFrame, 
then display the first 5 rows.
*/

/*
import sqlite3
import pandas as pd

conn = sqlite3.connect("restaurant.db")

query = """
SELECT *
FROM restaurants;
"""

restaurants_df = pd.read_sql(query, conn)

restaurants_df.head()

*/

/*
2. In a Jupyter Notebook, use the %sql magic command to run a SQL query that selects
 all movies with a rating above 8 from a 'movies' table, and display the results in the 
 notebook.
*/

/*
pip install ipython-sql

%load_ext sql

%sql sqlite:///movies.db

%%sql

SELECT *
FROM movies
WHERE rating > 8;
*/

/*
3. Combine SQL and Python to analyze Zomato-style order data: use pandas read_sql()
 to load the last 100 orders from an 'orders' table, then use DataFrame methods to find the 
 top 3 most ordered food items.
*/

/*
import sqlite3
import pandas as pd

conn = sqlite3.connect("zomato.db")

query = """
SELECT *
FROM orders
ORDER BY order_date DESC
LIMIT 100;
"""

orders_df = pd.read_sql(query, conn)

top_items = orders_df["food_item"].value_counts().head(3)

print(top_items)
*/

/*
4. After loading IPL match data from a 'matches' table into a pandas DataFrame, create a bar 
chart showing the number of matches played by each team using matplotlib or seaborn.<br><br>
<em><strong>Hint:</strong> Use groupby() in pandas to count matches per team before plotting.</em>
*/

/*
import sqlite3
import pandas as pd

conn = sqlite3.connect("ipl.db")

matches_df = pd.read_sql(
    "SELECT * FROM matches;",
    conn
)

team_matches = pd.concat(
    [matches_df["team1"], matches_df["team2"]]
).value_counts()

import matplotlib.pyplot as plt

team_matches.plot(
    kind="bar",
    figsize=(10,5)
)

plt.title("Matches Played by Each Team")
plt.xlabel("Team")
plt.ylabel("Number of Matches")
plt.xticks(rotation=45)

plt.show()
*/

/*
5. Use ChatGPT or Copilot to help you write a Jupyter Notebook cell that connects to a 
SQLite database, runs a SQL query to fetch all users who have placed more than 5 orders, 
and loads the result into a pandas DataFrame.
*/

/*
import sqlite3
import pandas as pd

# Connect to SQLite database
conn = sqlite3.connect("orders.db")

# SQL query
query = """
SELECT
    user_id,
    COUNT(*) AS total_orders
FROM orders
GROUP BY user_id
HAVING COUNT(*) > 5;
"""

# Load the result into a DataFrame
users_df = pd.read_sql(query, conn)

# Display the DataFrame
print(users_df)

# Close the database connection
conn.close()
*/