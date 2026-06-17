/*
Database Exploration

Purpose:
- Explore database structure
- List all tables in the dataset
*/

SELECT
table_catalog,
table_schema,
table_name,
table_type
FROM analytics.INFORMATION_SCHEMA.TABLES;



-- Inspect columns of dim_customers

SELECT
column_name,
data_type,
is_nullable
FROM analytics.INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'dim_customers'
ORDER BY ordinal_position;


-- Inspect columns of dim_products

SELECT
column_name,
data_type,
is_nullable
FROM analytics.INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'dim_products'
ORDER BY ordinal_position;


-- Inspect columns of fact_sales

SELECT
column_name,
data_type,
is_nullable
FROM analytics.INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'fact_sales'
ORDER BY ordinal_position;


-- Row counts

SELECT COUNT(*) AS total_customers
FROM analytics.dim_customers;

SELECT COUNT(*) AS total_products
FROM analytics.dim_products;

SELECT COUNT(*) AS total_sales
FROM analytics.fact_sales;


-- Check uniquness of customer_key

SELECT COUNT(*) AS total_rows,
COUNT(DISTINCT(customer_key)) AS unique_customer_keys
FROM `analytics.dim_customers`;


-- Check uniqueness of product_key

SELECT
COUNT(*) AS total_rows,
COUNT(DISTINCT product_key) AS unique_product_keys
FROM analytics.dim_products;

-- Check nulls

SELECT
COUNTIF(customer_key IS NULL) AS null_customer_key,
COUNTIF(customer_id IS NULL) AS null_customer_id,
COUNTIF(first_name IS NULL) AS null_first_name,
COUNTIF(last_name IS NULL) AS null_last_name
FROM analytics.dim_customers;



SELECT
COUNTIF(product_key IS NULL) AS null_product_key,
COUNTIF(product_id IS NULL) AS null_product_id,
COUNTIF(product_number IS NULL) AS null_product_number,
COUNTIF(product_name IS NULL) AS null_product_name,
COUNTIF(category_id IS NULL) AS null_category_id,
COUNTIF(category IS NULL) AS null_category,
COUNTIF(subcategory IS NULL) AS null_subcategory,
COUNTIF(maintenance IS NULL) AS null_maintenance,
COUNTIF(cost IS NULL) AS null_cost,
COUNTIF(product_line IS NULL) AS null_product_line,
COUNTIF(start_date IS NULL) AS null_start_date
FROM analytics.dim_products;


SELECT
COUNTIF(order_number IS NULL) AS null_order_number,
COUNTIF(product_key IS NULL) AS null_product_key,
COUNTIF(customer_key IS NULL) AS null_customer_key,
COUNTIF(order_date IS NULL) AS null_order_date,
COUNTIF(shipping_date IS NULL) AS null_shipping_date,
COUNTIF(due_date IS NULL) AS null_due_date,
COUNTIF(sales_amount IS NULL) AS null_sales_amount,
COUNTIF(quantity IS NULL) AS null_quantity,
COUNTIF(price IS NULL) AS null_price
FROM analytics.fact_sales;


SELECT
MIN(order_date) AS first_order_date,
MAX(order_date) AS last_order_date
FROM analytics.fact_sales;


-- Check duplicate

SELECT
product_key,
COUNT(*) AS record_count
FROM analytics.dim_products
GROUP BY product_key
HAVING COUNT(*) > 1;


