
-- KPI dasboard
SELECT 'Total Sales' AS metric, SUM(sales_amount) AS value
FROM analytics.fact_sales

UNION ALL

SELECT 'Total Quantity', SUM(quantity)
FROM analytics.fact_sales

UNION ALL

SELECT 'Average Price', ROUND(AVG(price),2)
FROM analytics.fact_sales

UNION ALL

SELECT 'Total Orders', COUNT(DISTINCT order_number)
FROM analytics.fact_sales

UNION ALL

SELECT 'Total Customers', COUNT(*)
FROM analytics.dim_customers

UNION ALL

SELECT 'Customers With Orders', COUNT(DISTINCT customer_key)
FROM analytics.fact_sales

UNION ALL

SELECT 'Total Products', COUNT(*)
FROM analytics.dim_products;


-- Average revenue per order

SELECT 
ROUND(SUM(sales_amount)/COUNT(DISTINCT order_number),2) AS  avg_revenue_per_order
FROM `analytics.fact_sales`;



-- Average revenue per customer

SELECT 
ROUND(SUM(sales_amount)/COUNT(DISTINCT customer_key),2) AS  avg_revenue_per_customer
FROM `analytics.fact_sales`;


-- Average selling price

SELECT
ROUND(SUM(sales_amount)/SUM(quantity),2) AS avg_selling_price
FROM `analytics.fact_sales`;


-- Customer coverage

SELECT
COUNT(DISTINCT customer_key) AS customer_with_orders,
(SELECT COUNT(*) FROM `analytics.dim_customers`) AS total_customers,
CONCAT(ROUND(100*COUNT(DISTINCT customer_key) / (SELECT COUNT(*) FROM `analytics.dim_customers`),2),'%') AS customer_coverage_percentage
FROM `analytics.fact_sales`;


-- Product coverage

SELECT
COUNT(DISTINCT product_key) AS sold_products,
(SELECT COUNT(*) FROM analytics.dim_products) AS total_products,
CONCAT(ROUND(100*COUNT(DISTINCT product_key)/ (SELECT COUNT(*) FROM analytics.dim_products),2),'%') AS product_coverage_percentage
FROM `analytics.fact_sales`;


-- Order frequency

SELECT
ROUND(COUNT(DISTINCT order_number) / COUNT(DISTINCT customer_key),2) AS orders_per_customer
FROM `analytics.fact_sales`;


-- Revenue concentration

SELECT
MIN(sales_amount) AS lowest_transaction,
MAX(sales_amount) AS highest_transaction,
ROUND(AVG(sales_amount),2) AS average_transaction
FROM `analytics.fact_sales`





