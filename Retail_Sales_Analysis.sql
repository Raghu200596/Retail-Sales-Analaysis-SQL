CREATE DATABASE p1_retail_db;
USE p1_retail_db;
CREATE TABLE retail_sales
(
    transactions_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(10),
    age INT,
    category VARCHAR(35),
    quantity INT,
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT
);

SELECT COUNT(*) AS total_rows
FROM retail_sales;

DROP TABLE IF EXISTS retail_sales_staging;
CREATE TABLE retail_sales_staging (
    transactions_id VARCHAR(50),
    sale_date VARCHAR(50),
    sale_time VARCHAR(50),
    customer_id VARCHAR(50),
    gender VARCHAR(50),
    age VARCHAR(50),
    category VARCHAR(50),
    quantiy VARCHAR(50),
    price_per_unit VARCHAR(50),
    cogs VARCHAR(50),
    total_sale VARCHAR(50)
);
select count(*) from retail_sales_staging;
SELECT *
FROM retail_sales_staging
WHERE age = ''
   OR quantiy = ''
   OR price_per_unit = ''
   OR cogs = ''
   OR total_sale = '';
DROP TABLE IF EXISTS retail_sales;
CREATE TABLE retail_sales
(
    transactions_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(10),
    age INT,
    category VARCHAR(35),
    quantity INT,
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT
);

INSERT INTO retail_sales
(
    transactions_id,
    sale_date,
    sale_time,
    customer_id,
    gender,
    age,
    category,
    quantity,
    price_per_unit,
    cogs,
    total_sale
)
SELECT
    CAST(transactions_id AS UNSIGNED),
    STR_TO_DATE(sale_date, '%Y-%m-%d'),
    sale_time,
    CAST(customer_id AS UNSIGNED),
    gender,
    CAST(age AS UNSIGNED),
    category,
    CAST(quantiy AS UNSIGNED),
    CAST(price_per_unit AS DECIMAL(10,2)),
    CAST(cogs AS DECIMAL(10,2)),
    CAST(total_sale AS DECIMAL(10,2))
FROM retail_sales_staging
WHERE age <> ''
  AND quantiy <> ''
  AND price_per_unit <> ''
  AND cogs <> ''
  AND total_sale <> '';

  SELECT *
FROM retail_sales
WHERE transactions_id IS NULL
   OR sale_date IS NULL
   OR sale_time IS NULL
   OR customer_id IS NULL
   OR gender IS NULL
   OR age IS NULL
   OR category IS NULL
   OR quantity IS NULL
   OR price_per_unit IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL;

SELECT COUNT(*) AS null_records
FROM retail_sales
WHERE transactions_id IS NULL
   OR sale_date IS NULL
   OR sale_time IS NULL
   OR customer_id IS NULL
   OR gender IS NULL
   OR age IS NULL
   OR category IS NULL
   OR quantity IS NULL
   OR price_per_unit IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL;

SELECT COUNT(*) AS clean_records
FROM retail_sales;

SELECT
    transactions_id,
    COUNT(*) AS count
FROM retail_sales
GROUP BY transactions_id
HAVING COUNT(*) > 1;

SELECT *
FROM retail_sales
WHERE transactions_id IS NULL
   OR transactions_id <= 0;

SELECT *
FROM retail_sales
WHERE sale_date IS NULL;

SELECT *
FROM retail_sales
WHERE sale_date < '2022-01-01'
   OR sale_date > '2023-12-31';

SELECT sale_date, COUNT(*) AS count
FROM retail_sales
GROUP BY sale_date
HAVING COUNT(*) > 1
ORDER BY count DESC;

SELECT *
FROM retail_sales
WHERE sale_time IS NULL;

SELECT sale_time, COUNT(*) AS count
FROM retail_sales
GROUP BY sale_time
HAVING COUNT(*) > 1
ORDER BY count DESC;

SELECT *
FROM retail_sales
WHERE sale_time < '00:00:00'
   OR sale_time > '23:59:59';

SELECT *
FROM retail_sales
WHERE customer_id IS NULL
   OR customer_id <= 0;

SELECT customer_id, COUNT(*) AS purchases
FROM retail_sales
GROUP BY customer_id
HAVING COUNT(*) > 1
ORDER BY purchases DESC;

SELECT COUNT(DISTINCT customer_id) AS unique_customers
FROM retail_sales;

SELECT *
FROM retail_sales
WHERE gender IS NULL
   OR TRIM(gender) = '';
 
SELECT DISTINCT gender
FROM retail_sales;

SELECT *
FROM retail_sales
WHERE age IS NULL;
 
SELECT *
FROM retail_sales
WHERE age < 18
   OR age > 100;
   
SELECT age, COUNT(*) AS count
FROM retail_sales
GROUP BY age
ORDER BY age;

SELECT *
FROM retail_sales
WHERE category IS NULL
   OR TRIM(category) = '';
 
SELECT DISTINCT category
FROM retail_sales;
 
SELECT category, COUNT(*) AS count
FROM retail_sales
GROUP BY category
ORDER BY count DESC;
 
SELECT *
FROM retail_sales
WHERE quantity IS NULL;

SELECT *
FROM retail_sales
WHERE quantity <= 0;

SELECT *
FROM retail_sales
WHERE quantity < 1
   OR quantity > 4;

SELECT quantity, COUNT(*) AS count
FROM retail_sales
GROUP BY quantity
ORDER BY quantity;

SELECT *
FROM retail_sales
WHERE price_per_unit IS NULL;

SELECT *
FROM retail_sales
WHERE price_per_unit <= 0;

SELECT *
FROM retail_sales
WHERE price_per_unit NOT IN (25, 30, 50, 300, 500);
 
SELECT *
FROM retail_sales
WHERE cogs IS NULL;
 
SELECT *
FROM retail_sales
WHERE cogs < 0;

SELECT
    MIN(cogs) AS minimum_cogs,
    MAX(cogs) AS maximum_cogs
FROM retail_sales;
 
SELECT *
FROM retail_sales
WHERE total_sale IS NULL;
 
SELECT *
FROM retail_sales
WHERE total_sale <= 0;
 
SELECT *
FROM retail_sales
WHERE total_sale <> (quantity * price_per_unit);

#EDA(exploratory data analasis)
SELECT COUNT(*) AS total_records
FROM retail_sales;

SELECT COUNT(DISTINCT customer_id) AS unique_customers
FROM retail_sales;

SELECT COUNT(*) AS total_transactions
FROM retail_sales;

SELECT DISTINCT category
FROM retail_sales;

SELECT
    category,
    COUNT(*) AS total_transactions
FROM retail_sales
GROUP BY category
ORDER BY total_transactions DESC;

SELECT *
FROM retail_sales
WHERE sale_date = '2022-11-05';

SELECT *
FROM retail_sales
WHERE category = 'Clothing'
  AND sale_date >= '2022-11-01'
  AND sale_date < '2022-12-01';
  
SELECT
    category,
    SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY category
ORDER BY total_sales DESC;

SELECT
    ROUND(AVG(age), 2) AS average_age
FROM retail_sales
WHERE category = 'Beauty';

SELECT *
FROM retail_sales
WHERE total_sale > 1000;

SELECT
    gender,
    category,
    COUNT(*) AS total_transactions
FROM retail_sales
GROUP BY gender, category
ORDER BY gender, total_transactions DESC;


WITH monthly_avg AS
(
    SELECT
        YEAR(sale_date) AS sale_year,
        MONTH(sale_date) AS sale_month,
        AVG(total_sale) AS avg_sale
    FROM retail_sales
    GROUP BY
        YEAR(sale_date),
        MONTH(sale_date)
),
ranked_months AS
(
    SELECT
        sale_year,
        sale_month,
        avg_sale,
        RANK() OVER
        (
            PARTITION BY sale_year
            ORDER BY avg_sale DESC
        ) AS sales_rank
    FROM monthly_avg
)
SELECT
    sale_year,
    sale_month,
    ROUND(avg_sale, 2) AS avg_sale
FROM ranked_months
WHERE sales_rank = 1
ORDER BY sale_year;

SELECT
    customer_id,
    SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY customer_id

ORDER BY total_sales DESC
LIMIT 5;

SELECT
    category,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM retail_sales
GROUP BY category
ORDER BY unique_customers DESC;
 
SELECT
    CASE
        WHEN HOUR(sale_time) < 12 THEN 'Morning'
        WHEN HOUR(sale_time) < 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift,
    COUNT(*) AS total_transactions
FROM retail_sales
GROUP BY shift
ORDER BY total_transactions DESC;













 
 
 
 
 

 













 
 
 
 
 
 
   

 

  
  



