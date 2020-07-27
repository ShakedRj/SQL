# SQL- Fraud Detection

Fraud is everywhere these days—whether you are a small taco shop or a large international business. While there are emerging technologies that employ machine learning and artificial intelligence to detect fraud, many instances of fraud detection still require strong data analytics to find abnormal charges.


I will analyze historical credit card transactions and consumption patterns in order to identify possible fraudulent transactions.

Main tasks:

1. Data Modeling: Define a database model to store the credit card transactions data and create a new PostgreSQL database using the model.

2. Data Engineering: Create a database schema on PostgreSQL and populate the database from the CSV files.

3. Data Analysis: Analyze the data to identify possible fraudulent transactions.

## Data Modeling:

Creating an entity relationship diagram (ERD) by inspecting the provided CSV files.

Part of the challenge here is to figure out how many tables to create, as well as what kind of relationships needs to be defined among the tables.


## Data Engineering:

Using the database model as a blueprint, I created a database schema for each of the tables and relationships. 

After creating the database schema, I import the data from the corresponding CSV files.

## Data Analysis:

Now the data is prepared within the database, it's finally time to identify fraudulent transactions using SQL and Pandas DataFrames. I will analyze the data and I created a report within a Jupyter Notebook file to present my findings. The report will include the following findings:

* Isolating the transactions of each cardholder.

* Considering a certain time period:

      -What are the 100 highest transactions during this time period?

      -Do we see any fraudulent or anomalous transactions?
      
* What are the top five merchants prone to being hacked using small transactions?

* Creating Views for each one of the queries.


Another approach to identify fraudulent transactions is to look for outliers in the data. Standard deviation or quartiles are often used to detect outliers, this is done in the Outliers file.

