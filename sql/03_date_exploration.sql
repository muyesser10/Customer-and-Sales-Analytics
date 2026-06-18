-- Order date range

SELECT 
MIN(order_date) AS first_order_date,
MAX(order_date) AS last_order_date,
DATE_DIFF(MAX(order_date), MIN(order_date), month) as order_range_months
FROM `analytics.fact_sales`
WHERE order_date IS NOT NULL;


-- Orders by year

SELECT
EXTRACT(YEAR FROM order_date) AS order_year,
COUNT(DISTINCT order_number) AS total_orders
FROM `analytics.fact_sales`
WHERE order_date IS NOT NULL
GROUP BY order_year
ORDER BY order_year;


-- Orders by month

SELECT
FORMAT_DATE('%Y-%m', order_date) AS order_month,
COUNT(DISTINCT order_number) AS total_orders
FROM `analytics.fact_sales`
WHERE order_date IS NOT NULL
GROUP BY order_month
ORDER BY order_month;



-- Sales by year

SELECT
EXTRACT(year FROM order_date) AS order_year,
SUM(sales_amount) AS total_sales
FROM `analytics.fact_sales`
WHERE order_date IS NOT NULL
GROUP BY order_year
ORDER BY order_year;


-- Sales by month

SELECT
FORMAT_DATE('%Y-%m', order_date) AS order_month,
SUM(sales_amount) AS total_sales
FROM `analytics.fact_sales`
WHERE order_date IS NOT NULL
GROUP BY order_month
ORDER BY order_month DESC;


-- Sales by quarter

SELECT
EXTRACT(year FROM order_date) AS order_year,
CONCAT('Q',EXTRACT(quarter from order_date)) AS quarter,
SUM(sales_amount) AS total_sales
FROM  `analytics.fact_sales`
WHERE order_date IS NOT NULL
GROUP BY order_year,quarter
ORDER BY order_year,quarter;


-- Average order value

SELECT
EXTRACT(year FROM order_date) AS order_year,
ROUND(
    SUM(sales_amount) / COUNT(DISTINCT order_number),
    2
) AS avg_order_value
FROM analytics.fact_sales
WHERE order_date IS NOT NULL
GROUP BY order_year
ORDER BY order_year;



