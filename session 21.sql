/*
1. Connect an Excel workbook to a SQL Server database using Power 
Query and load the 'Restaurants' table (assume it contains columns like name, cuisine, rating) 
into a new worksheet.
*/

/*
import sqlite3
import pandas as pd

conn = sqlite3.connect("restaurant.db")

query = """
SELECT *
FROM restaurants;
"""

df = pd.read_sql(query, conn)

df.head()
*/

/*
2. Set up a parameterized query in Power Query that allows you to filter the
 'Restaurants' data by cuisine type (e.g., only show 'Chinese' or 'South Indian') 
 based on a value entered in an Excel cell.<br><br><em><strong>Hint:</strong> Use Power Query's
 'Manage Parameters' feature and reference the cell value in your SQL query.</em>
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
3. Enable dynamic data refresh in your Excel sheet so that when new records are added 
to the 'Restaurants' table in SQL Server, you can update the Excel data with a single click.
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

orders = pd.read_sql(query, conn)

top_items = (
    orders["food_item"]
    .value_counts()
    .head(3)
)

print(top_items)

top_items = (
    orders
    .groupby("food_item")
    .size()
    .sort_values(ascending=False)
    .head(3)
)

print(top_items)
*/


/*
4. Modify your Power Query connection to include only restaurants with a rating above 4.0, 
and display the filtered results in a dashboard-style Excel sheet with a table and a bar chart.
*/

/*
import sqlite3
import pandas as pd

conn = sqlite3.connect("ipl.db")

matches = pd.read_sql(
    "SELECT * FROM matches;",
    conn
)

team_counts = pd.concat(
    [matches["team1"], matches["team2"]]
).value_counts()

import matplotlib.pyplot as plt

team_counts.plot(kind="bar")

plt.title("Matches Played by Each Team")
plt.xlabel("Team")
plt.ylabel("Matches Played")
plt.xticks(rotation=45)

plt.show()

import seaborn as sns
import matplotlib.pyplot as plt

team_counts = team_counts.reset_index()
team_counts.columns = ["Team", "Matches"]

sns.barplot(data=team_counts, x="Team", y="Matches")

plt.xticks(rotation=45)
plt.title("Matches Played by Each Team")

plt.show()
*/

/*
5. Use ChatGPT or Copilot to help you write a parameterized SQL query for Power Query that 
fetches all restaurants within a certain rating range (e.g., between 3.5 and 5.0), then implement and 
test it in your Excel workbook.
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

# Load results into a DataFrame
users_df = pd.read_sql(query, conn)

# Display the results
print(users_df)

# Close the connection
conn.close()
*/