-- Customers by country

SELECT
COALESCE(NULLIF(country,'n/a'),'Unknown') AS country,
COUNT(*) AS total_customers
FROM `analytics.dim_customers`
GROUP BY country
ORDER BY total_customers DESC;


-- Customers by gender

SELECT
gender,
COUNT(*) AS total_customers
FROM `analytics.dim_customers`
GROUP BY gender
ORDER BY total_customers DESC;


-- Products by category

SELECT
category,
COUNT(*) AS total_products
FROM `analytics.dim_products`
GROUP BY category
ORDER BY total_products DESC;


-- Products by product line

SELECT
product_line,
COUNT(*) AS total_products
FROM analytics.dim_products
GROUP BY product_line
ORDER BY total_products DESC;


-- Cost distribution

SELECT 
category,
MIN(cost) AS min_cost,
MAX(cost) AS max_cost,
ROUND(AVG(cost)) AS avg_cost
FROM `analytics.dim_products`
GROUP BY category 
ORDER BY avg_cost DESC;


-- Revenue distribution by category

SELECT 
p.category,
SUM(s.sales_amount) AS total_revenue
FROM `analytics.fact_sales` s
LEFT JOIN `analytics.dim_products` p 
ON s.product_key=p.product_key
GROUP BY p.category
ORDER BY total_revenue DESC;


-- Revenue distribution by country

SELECT 
COALESCE(NULLIF(c.country,'n/a'),'Unknown') AS country,
SUM(sales_amount) AS total_revenue
FROM `analytics.fact_sales` s
LEFT JOIN `analytics.dim_customers` c
ON s.customer_key=c.customer_key
GROUP BY country
ORDER BY total_revenue DESC;


-- Average revenue per customer by country

SELECT 
COALESCE(NULLIF(c.country,'n/a'),'Unknown') AS country,
ROUND(SUM(s.sales_amount)/COUNT(DISTINCT c.customer_key),2) AS avg_revenue_per_customer
FROM `analytics.fact_sales` s 
LEFT JOIN `analytics.dim_customers` c 
USING(customer_key)
GROUP BY country
ORDER BY avg_revenue_per_customer DESC;


-- Revenue share by subcategory

SELECT
p.category,
p.subcategory,
SUM(sales_amount) AS total_revenue,
CONCAT(ROUND(100*(SUM(sales_amount)/SUM(SUM(sales_amount)) OVER()),2),'%') AS revenue_share_percentage
FROM `analytics.fact_sales` s 
LEFT JOIN `analytics.dim_products` p
USING(product_key)
GROUP BY category,subcategory
ORDER BY revenue_share_percentage DESC;


-- Top 3 subcategories by quantity within each country, with total revenue included

WITH ranked_data AS (
SELECT 
COALESCE(NULLIF(c.country,'n/a'),'Unknown') AS country,
category,
subcategory,
SUM(s.quantity)  AS total_sold,
SUM(sales_amount) AS total_revenue
FROM `analytics.fact_sales` s 
LEFT JOIN `analytics.dim_customers` c
ON s.customer_key=c.customer_key
LEFT JOIN `analytics.dim_products` p
ON s.product_key=p.product_key
GROUP BY  country,category,subcategory)


SELECT *,
ROW_NUMBER() OVER(PARTITION BY country ORDER BY total_sold DESC) AS rank_sold
FROM ranked_data
QUALIFY rank_sold<=3
ORDER BY country,rank_sold




