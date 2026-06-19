
-- Top 10 products by revenue

SELECT 
p.product_name,
SUM(sales_amount) AS total_revenue,
RANK() OVER(ORDER BY SUM(sales_amount) DESC ) AS revenue_rank
FROM `analytics.fact_sales` s 
LEFT JOIN `analytics.dim_products` p  
USING(product_key)
GROUP BY p.product_name
QUALIFY revenue_rank<=10
ORDER BY revenue_rank;


-- Bottom 10 products by revenue

SELECT 
p.product_name,
SUM(sales_amount) AS total_revenue,
RANK() OVER(ORDER BY SUM(sales_amount) ASC ) AS revenue_rank
FROM `analytics.fact_sales` s 
LEFT JOIN `analytics.dim_products` p  
USING(product_key)
GROUP BY p.product_name
QUALIFY revenue_rank<=10
ORDER BY revenue_rank;


-- Top 10 customers by revenue

SELECT
s.customer_key,
c.first_name,
c.last_name,
s.total_revenue,
s.revenue_rank
FROM(
  SELECT 
  customer_key,
  SUM(sales_amount) AS total_revenue,
  RANK() OVER(ORDER BY SUM(sales_amount) DESC ) AS revenue_rank
  FROM `analytics.fact_sales` s 
  GROUP BY customer_key
  QUALIFY revenue_rank<=10) s
LEFT JOIN `analytics.dim_customers` c  
USING(customer_key)
ORDER BY revenue_rank;
  

-- Top 10 customers by order frequency

SELECT
c.customer_key,
c.first_name,
c.last_name,
COUNT(DISTINCT s.order_number) AS total_orders,
RANK() OVER(ORDER BY COUNT(DISTINCT s.order_number) DESC ) AS order_rank
FROM `analytics.fact_sales` s 
JOIN `analytics.dim_customers` c
USING(customer_key)
GROUP BY c.customer_key,c.first_name,c.last_name
QUALIFY order_rank<=10
ORDER BY order_rank;


-- Top 10 customers based on revenue and order frequency (union of both rankings)

WITH customer_metrics AS(
  SELECT 
  c.first_name,
  c.last_name,
  c.customer_key,
  SUM(s.sales_amount) AS total_revenue,
  COUNT(DISTINCT s.order_number) AS total_orders
  FROM `analytics.fact_sales` s 
  LEFT JOIN `analytics.dim_customers` c
  USING(customer_key)
  GROUP BY c.first_name,c.last_name,c.customer_key
)

SELECT *,
RANK() OVER(ORDER BY total_revenue DESC) AS revenue_rank,
RANK() OVER(ORDER BY total_orders DESC) AS orders_rank
FROM customer_metrics
QUALIFY revenue_rank<=10 OR orders_rank<=10;


-- Top products by category

WITH product_revenue AS(
  SELECT
  p.category,
  p.product_name,
  SUM(sales_amount) AS total_revenue
  FROM `analytics.fact_sales` s 
  LEFT JOIN `analytics.dim_products` p 
  USING(product_key)
  GROUP BY p.category,p.product_name

)

SELECT *,
RANK() OVER(PARTITION BY category ORDER BY total_revenue DESC) AS category_rank
FROM product_revenue
QUALIFY category_rank<=3
ORDER BY category,category_rank;


-- Top products per country

WITH country_product AS(
  SELECT
  COALESCE(NULLIF(country,'n/a'),'Unknown') AS country,
  p.product_name,
  SUM(sales_amount) AS total_revenue
  FROM `analytics.fact_sales` s 
  JOIN `analytics.dim_customers` c
  USING(customer_key)
  JOIN `analytics.dim_products` p 
  USING(product_key)
  GROUP BY c.country,p.product_name

)

SELECT *,
RANK() OVER(PARTITION BY country ORDER BY total_revenue DESC) AS country_rank
FROM country_product
QUALIFY country_rank<=3
ORDER BY country,country_rank;


-- Market dominance check

WITH product_revenue2 as(
  SELECT 
  p.product_name,
  SUM(sales_amount) AS revenue
  FROM `analytics.fact_sales` s 
  JOIN `analytics.dim_products` p 
  USING(product_key)
  GROUP BY p.product_name )

SELECT *,
SUM(revenue) OVER(ORDER BY revenue DESC) AS running_revenue,
SUM(revenue) OVER() AS total_revenue,
ROUND(100*SUM(revenue) OVER(ORDER BY revenue DESC)/SUM(revenue) OVER(),2) AS cumulative_share
FROM product_revenue2
ORDER BY revenue DESC;


-- Pareto

WITH product_revenue3 AS (
    SELECT
        p.product_name,
        SUM(sales_amount) AS revenue
    FROM analytics.fact_sales s
    JOIN analytics.dim_products p
    USING(product_key)
    GROUP BY p.product_name
),

pareto AS (
    SELECT
        *,
        ROUND(
            100 *
            SUM(revenue) OVER(ORDER BY revenue DESC)
            /
            SUM(revenue) OVER(),
            2
        ) AS cumulative_share
    FROM product_revenue3
)

SELECT COUNT(*) AS products_to_reach_80pct
FROM pareto
WHERE cumulative_share <= 80;








