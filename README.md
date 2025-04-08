# submitHomeworkHadassim5
## Part 1
###  Log & Time Series Analysis 
####  Files

- `part1.ipynb` – Main notebook containing all code and explanations.
- `logs.txt` – Large raw log file (millions of lines).
- `logs.txt.csv`, `logs.txt.xlsx` – Converted log data for easier handling.
- `time_series.parquet`, `time_series.xlsx` – Outputs of time-series data.
- `time_series.csv` – CSV file containing timestamped numerical values.

###  What This Project Does

#### Section A – Log Error Analysis

- Input: A huge log file `logs.txt`, each line represents a log entry with an error code.
- Goal: Identify the top N most frequent error codes.

Tasks:
1. Write code to split `logs.txt` into smaller parts for efficiency.
2. Count the frequency of each error code.
3. Identify and print the N most frequent error codes.
4. Analyze error distributions.
5. Store the results with clear labeling and source file info.

---

#### Section B – Time-Series Aggregation

- Input: `time_series.csv` with two columns: `Timestamp` and `Value`.

Tasks:
1. Verify that timestamps are in a valid format and handle missing or invalid data.
2. Compute the average value for each hour using `.dt.floor('h')` and `groupby`.
3. Create a table showing the hourly average (e.g. 6:00, 7:00, etc.).
4. Split the dataset into smaller chunks (e.g. by day or 1-hour segments).
5. Merge hourly summaries into a combined results file.
6. Discuss how the approach would change if data arrived as a stream.
7. Explore storing data in different formats (CSV, Parquet) and analyze tradeoffs.

---

###  Output Includes

- Table of most frequent error codes (Section A)
- Hourly average value table (Section B)
- CSV and Parquet files containing time-aggregated data
- Code that can adapt to streaming data or new formats

---

###  How to Run

1. Make sure you have Python 3.x and Jupyter installed.
2. Install required packages: pip install pandas matplotlib pyarrow openpyxl
3. Open the notebook: jupyter notebook part1.ipynb
4. Run each cell to see the full results.

## part2
### SQL Exercises – Family Relationships 

This project includes a set of SQL scripts that deal with modeling and querying family relationships using relational tables.
###  Files

- `person.sql` – Contains a list of people to be used in the family tree.
- `familyTies.sql` – Sets up a family relationships table with directional links between individuals.
- `exe2.sql` – Contains logic to complete missing relationship entries .

###  How to Run

Use SQL Server Management Studio (SSMS) or MySQL Server.

Steps:
1. Run `person.sql` to create the base data.
2. Run `familyTies.sql` to add the relationship table and insert connections.
3. Run `exe2.sql` to complete or fix missing mutual partner links.

###  Notes

- Make sure your database allows inserting into the same table you're selecting from.
- Consider using `NOT EXISTS` or `EXCEPT` to detect missing links.

---

## Part 3
# Theoretical Questions 

This part contains a PDF titled ` part3.pdf`, which includes a set of theoretical and analytical questions, written in Hebrew.

---

##  Topics Covered

- Personal interest in system design, electronics, and integration
- Evaluation of motivation (1–6 scale)
- Understanding components of a control system ( air conditioner used as the context)
- Reasoning-based questions about:
  - Input/output relationships in control systems
  - Component interactions
  - Decision logic and constraints

---

## part4:
### Grocery Management System – Full Stack ASP.NET Project
This is a full-stack project for managing queues between customers and suppliers, built in C# using ASP.NET Core Web API, with a local SQL Server database (`.mdf` file).
####  Project Structure:
####### part4/ ├── BLL/ # Business Logic Layer ├── API
#######                                        ├── Models
#######                                        ├── Sevices
#######       ├── DAL/ # Data Access Layer │ └── Database/ # Local database (groceryDatabase.mdf)
#######                                       ├── API
#######                                       ├── Models
#######                                       ├── Sevices
#######                                       ├── Migrations
#######       ├── WebAPI/ # API controllers ├── GroceryProject.sln # Solution file
#######                                     ├── appsettings.json # Configuration file
#######                                     ├── wwwroot
##  Project Goals

- Manage queues between grocery and suppliers
- Provide a RESTful API for CRUD operations on grocery, suppliers, and appointments
- Store and retrieve data using a local `.mdf` SQL Server database
- Follow a layered architecture: DAL, BLL, WebAPI

###  Getting Started

#### 1. Prerequisites

- Visual Studio 2022+
- SQL Server LocalDB
- .NET 6.0 or 7.0 SDK

#### 2. Open the Solution

Open the file: part4/GroceryProject.sln

#### 3. Verify the Database File Exists

Ensure the following file is present: part4/DAL/Database/groceryDatabase.mdf

If the `Database` folder is missing from Git, create it manually and place the `.mdf` file inside.

### 4. Configure Connection String

In `appsettings.json`, ensure the following connection string exists:


"ConnectionStrings": {
  "GroceryConnection": "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\DAL\\Database\\groceryDatabase.mdf;Integrated Security=True"
}

####  Running the Project
In Visual Studio, set the WebAPI project as the Startup Project.

Press F5 or click "Start Debugging".

Your browser will open with Swagger UI, where you can test the API.

###  Troubleshooting
#### Database file doesn't load?
Check that groceryDatabase.mdf exists under DAL/Database.

Make sure .gitignore doesn't exclude .mdf files.






### 👤 Author
Dvora Abrahams



