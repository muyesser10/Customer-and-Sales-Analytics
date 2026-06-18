-- Customer distribution by country

SELECT 
country,
COUNT(*) AS total_customers
FROM `analytics.dim_customers`
GROUP BY country
ORDER BY total_customers DESC;


--Customer distrubution by gender
SELECT 
gender,
COUNT(*) AS total_customers
FROM `analytics.dim_customers`
GROUP BY gender
ORDER BY total_customers DESC;


--Customer distrubution by marital status
SELECT 
marital_status,
COUNT(*) AS total_customers
FROM `analytics.dim_customers`
GROUP BY marital_status
ORDER BY total_customers DESC;


-- Customer age segmentation
WITH customer_age AS (
  SELECT 
  customer_key,
  DATE_DIFF(current_date(),birthdate,year) AS age
  FROM `analytics.dim_customers`)

SELECT
COUNT(*) AS  total_customers,
CASE 
  WHEN age<30 THEN "under 30"
  WHEN age BETWEEN 30 AND 49 THEN "30-49"
  ELSE "50+"
END age_group
FROM customer_age
GROUP BY age_group
ORDER BY total_customers;



--Category distribution

SELECT 
category,
COUNT(*) AS total_products
FROM `analytics.dim_products`
GROUP BY category
ORDER BY total_products DESC;

--Subcategory distribution

SELECT 
subcategory,
COUNT(*) AS total_products
FROM `analytics.dim_products`
GROUP BY subcategory
ORDER BY total_products DESC;


--Product line distribution

SELECT 
product_line,
COUNT(*) AS total_products
FROM `analytics.dim_products`
GROUP BY product_line
ORDER BY total_products DESC





