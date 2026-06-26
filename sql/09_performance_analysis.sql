
-- Product year over year performance

WITH product_yearly_sales AS(
  SELECT 
  product_key,
  EXTRACT(year FROM order_date) AS order_year,
  SUM(sales_amount) AS revenue
  FROM `analytics.fact_sales`
  GROUP BY product_key,order_year
),
revenue_with_lag AS (
  SELECT
  product_key,
  order_year,
  revenue,
  LAG(revenue) OVER(PARTITION BY product_key ORDER BY order_year) AS prev_year_revenue
  FROM product_yearly_sales
)

SELECT
product_key,
product_name,
order_year,
revenue,
prev_year_revenue,
ROUND(SAFE_DIVIDE(revenue,prev_year_revenue),2) AS growth_ratio
FROM revenue_with_lag
JOIN `analytics.dim_products`
USING(product_key)
WHERE ROUND(SAFE_DIVIDE(revenue,prev_year_revenue),2) IS NOT NULL
ORDER BY product_key,order_year;


-- Product performance in category

WITH product_revenue_by_category AS(
  SELECT
  category,
  product_name,
  SUM(sales_amount) AS total_product_revenue
  FROM `analytics.fact_sales`
  JOIN `analytics.dim_products`
  USING(product_key)
  GROUP BY category,product_name
),
category_average_revenue AS(
  SELECT
  category,
  product_name,
  total_product_revenue,
  ROUND(AVG(total_product_revenue) OVER(PARTITION BY category)) AS avg_revenue_per_category
  FROM product_revenue_by_category

)

SELECT 
category,
product_name,
total_product_revenue,
avg_revenue_per_category,
total_product_revenue - avg_revenue_per_category AS revenue_difference_from_category_avg,
CASE
    WHEN total_product_revenue > avg_revenue_per_category THEN 'Above Category Average'
    WHEN total_product_revenue < avg_revenue_per_category THEN 'Below Category Average'
    ELSE 'At Category Average'
  END AS product_performance_flag
FROM category_average_revenue;


-- Product revenue share

WITH sales_by_product AS(
  SELECT
  product_key,
  SUM(sales_amount) AS revenue
  FROM `analytics.fact_sales`
  GROUP BY product_key
),
total_revenue_calc AS(
  SELECT 
  SUM(revenue) AS total_revenue
  FROM sales_by_product
)

SELECT
p.product_key,
p.product_name,
s.revenue,
t.total_revenue,
ROUND(100*revenue/total_revenue,1) AS revenue_share_percentage
FROM sales_by_product s
JOIN `analytics.dim_products` p
ON s.product_key=p.product_key
CROSS JOIN total_revenue_calc t
ORDER BY revenue DESC;


-- Product growth matrix

WITH sales_filtered AS(
  SELECT
  product_key,
  sales_amount,
  order_date
  FROM `analytics.fact_sales`
  WHERE order_date >='2012-01-01'
  AND order_date<'2014-01-01'
),

sales_by_product AS(
  SELECT
  product_key,
  SUM(IF(order_date>='2012-01-01' AND order_date<'2013-01-01',sales_amount,0)) AS revenue_2012,
  SUM(IF(order_date>='2013-01-01' AND order_date<'2014-01-01',sales_amount,0)) AS revenue_2013
  FROM sales_filtered
  GROUP BY product_key

)

SELECT 
product_name,
revenue_2012,
revenue_2013,
CAST(ROUND(100*(revenue_2013-revenue_2012)/NULLIF(revenue_2012,0)) AS INT) AS growth_percentage,

CASE
        WHEN s.revenue_2013 > 500000
             AND s.revenue_2013 > s.revenue_2012
            THEN 'Star Product'

        WHEN s.revenue_2013 > 500000
             AND s.revenue_2013 <= s.revenue_2012
            THEN 'Cash Cow'

        WHEN s.revenue_2013 <= 500000
             AND s.revenue_2013 > s.revenue_2012
            THEN 'Emerging Product'

        ELSE 'Declining Product'
    END AS product_status

FROM sales_by_product s  
JOIN `analytics.dim_products` p
USING(product_key);


-- Customer performance ranking

WITH customer_sales_summary AS(
  SELECT
  customer_key,
  SUM(sales_amount) AS total_revenue,
  COUNT(DISTINCT order_number) AS total_orders
  FROM `analytics.fact_sales`
  GROUP BY customer_key
),

customer_kpi_metrics AS(
  SELECT
  customer_key,
  total_revenue,
  total_orders,
  ROUND(total_revenue/NULLIF(total_orders,0),1) AS avg_order_value
  FROM customer_sales_summary
)

SELECT 
customer_key,
total_revenue,
total_orders,
avg_order_value,
NTILE(10) OVER(ORDER BY total_revenue DESC) AS revenue_decile
FROM customer_kpi_metrics







