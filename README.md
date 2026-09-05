# Retail Sales Analysis Using MySQL

## Project Overview

This project analyzes retail sales data using MySQL to understand sales performance, customer behavior, product categories, and sales trends.

The project focuses on data cleaning, data validation, exploratory data analysis (EDA), and business analysis using SQL.

## Objectives

* Set up a retail sales database using MySQL.
* Import and clean raw retail sales data.
* Identify and handle incomplete records.
* Validate the quality and consistency of the cleaned data.
* Analyze sales performance across product categories.
* Identify customer and purchasing patterns.
* Analyze sales trends by month and time of day.
* Generate meaningful business insights using SQL.

## Dataset

The dataset contains retail transaction records with information about:

* Transaction ID
* Sale Date
* Sale Time
* Customer ID
* Gender
* Age
* Product Category
* Quantity
* Price per Unit
* Cost of Goods Sold (COGS)
* Total Sale

### Dataset Summary

* Raw records: 2,000
* Incomplete records identified: 13
* Cleaned records analyzed: 1,987
* Unique customers: 155
* Product categories: Beauty, Clothing, Electronics
* Date range: January 1, 2022 to December 31, 2023

## Tools \& Technologies

* MySQL
* MySQL Workbench
* SQL
* GitHub
* CSV
* Markdown

## Database Setup

The project uses a MySQL database named:

`p1\\\_retail\\\_db`

The main table used for analysis is:

`retail\\\_sales`

The table contains transaction-level retail sales data.

## Data Cleaning

A staging table was used to preserve the original raw data during the cleaning process.

The cleaning process included:

1. Importing all 2,000 raw records into a staging table.
2. Identifying incomplete records.
3. Finding 13 records with missing values in important fields.
4. Converting text values into appropriate numeric and date/time data types.
5. Loading only complete records into the final `retail\\\_sales` table.
6. Validating the cleaned dataset.

The final analysis was performed on 1,987 complete transactions.

## Data Validation

Several checks were performed after cleaning:

* Checked for NULL values.
* Checked for duplicate transaction IDs.
* Checked the date range.
* Checked age and quantity values.
* Verified date and time formats.
* Checked the relationship between quantity, price per unit, and total sales.
* Reviewed potentially suspicious cost/sales relationships for further investigation.

## Exploratory Data Analysis

The analysis includes questions such as:

* How many transactions are in the dataset?
* How many unique customers are there?
* What product categories are available?
* What were the sales on a specific date?
* Which Clothing transactions had a quantity of 4 or more in November 2022?
* Which category generated the highest total sales?
* What is the average age of customers purchasing Beauty products?
* How many transactions had sales above ₹1,000?
* How are transactions distributed by gender and category?
* Which month had the highest average sale in each year?
* Who are the top 5 customers by total sales?
* How many unique customers purchased from each category?
* Which time-of-day shift had the highest number of transactions?

## Key Findings

### Sales Performance

* The cleaned dataset contains 1,987 transactions.
* Electronics generated the highest total sales at ₹311,445.
* Clothing generated ₹309,995 in total sales.
* Beauty generated ₹286,790 in total sales.
* Clothing had the highest number of transactions with 698.
* Electronics had 678 transactions.
* Beauty had 611 transactions.

### Customer Insights

* The dataset contains 155 unique customers.
* Customer 3 generated the highest sales among the top 5 customers with ₹38,440.
* Customer 1 generated ₹30,750.
* Customer 5 generated ₹30,405.
* Customer 2 generated ₹25,295.
* Customer 4 generated ₹23,580.
* Clothing had the highest number of unique customers with 149.
* Electronics had 144 unique customers.
* Beauty had 141 unique customers.
* The average age of customers purchasing Beauty products was 40.42 years.

### Sales Trends

* Evening was the busiest sales period with 1,275 transactions.
* Morning recorded 548 transactions.
* Afternoon recorded 164 transactions.
* July 2022 had the highest average sale at ₹541.34.
* February 2023 had the highest average sale at ₹535.53.
* There were 306 transactions with total sales above ₹1,000.

### Gender and Category Analysis

* Clothing had the highest number of transactions for both male and female customers.
* Male Clothing transactions: 351.
* Female Clothing transactions: 347.

## Reports

Detailed analysis is available in the `reports` folder:

* `sales\\\_summary.md` - Sales performance and category analysis.
* `trend\\\_analysis.md` - Monthly and time-of-day sales trends.
* `customer\\\_insights.md` - Customer behavior and customer-level analysis.

## Project Structure

```text
Retail-Sales-Analysis-SQL/
│
├── dataset/
│   └── retail\\\_sales.csv
│
├── sql/
│   └── retail\\\_sales\\\_analysis.sql
│
├── reports/
│   ├── sales\\\_summary.md
│   ├── trend\\\_analysis.md
│   └── customer\\\_insights.md
│
└── README.md
```

## Conclusion

The Retail Sales Analysis project successfully analyzed 1,987 cleaned transactions from 155 unique customers across three product categories: Beauty, Clothing, and Electronics.

Electronics generated the highest total sales, while Clothing recorded the highest number of transactions and unique customers. Evening was the busiest sales period, and high-value transactions contributed significantly to overall sales.

The analysis also identified the months with the highest average transaction values and the top customers based on total sales.

Overall, this project demonstrates how SQL can be used to clean retail data, perform exploratory analysis, identify sales and customer patterns, and generate meaningful business insights for decision-making.

## Author

**Raghu Ram Tatini**

Aspiring Data Analyst

