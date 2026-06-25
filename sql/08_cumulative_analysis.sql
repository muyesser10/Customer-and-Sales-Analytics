
-- Monthly cumulative business performance

SELECT
order_month,
total_sales AS total_revenue,
SUM(total_sales) OVER(ORDER BY order_month) AS cumulative_revenue,
SUM(total_orders) OVER(ORDER BY order_month) AS cumulative_orders,
SUM(total_quantity) OVER(ORDER BY order_month) AS cumulative_quantity
FROM `analytics.monthly_sales`
ORDER BY order_month;


-- Revenue contribution

SELECT 
order_month,
total_sales AS revenue,
SUM(total_sales) OVER(ORDER BY order_month) AS running_revenue,
SUM(total_sales) OVER() AS total_revenue,

ROUND(100*(SUM(total_sales) OVER(ORDER BY order_month)/SUM(total_sales) OVER()),2) AS cumulative_revenue_share
FROM `analytics.monthly_sales`
ORDER BY order_month;


-- Revenue momentum

WITH growth AS(
  SELECT
  order_month,
  total_sales AS revenue,
  LAG(total_sales) OVER(ORDER BY order_month) AS prev_revenue,
  ROUND(100*(total_sales - LAG(total_sales) OVER(ORDER BY order_month))/(LAG(total_sales)   OVER(ORDER BY order_month))) AS  mom_growth
  FROM `analytics.monthly_sales`
)

SELECT *,

CASE
    WHEN growth_acceleration > 20 THEN '🚀 Rapid Growth'
    WHEN growth_acceleration < -20 THEN '💥 Sharp Decline'
    ELSE '➡️ Stable'
  END AS trend_flag,

  CASE
    WHEN growth_acceleration > 20 THEN '#00C853'
    WHEN growth_acceleration < -20 THEN '#D50000'
    ELSE '#9E9E9E'
  END AS color_code

FROM(
  SELECT
  order_month,
  mom_growth,
  LAG(mom_growth) OVER(ORDER BY  order_month) AS prev_mom_growth,
  (mom_growth - LAG(mom_growth) OVER(ORDER BY  order_month)) AS growth_acceleration
  FROM growth);

-- Customer summary table

CREATE OR REPLACE TABLE analytics.customer_summary AS
SELECT
customer_key,
order_date,
sales_amount,
SUM(sales_amount) OVER(PARTITION BY customer_key ORDER BY order_date,order_number) AS customer_cumulative_revenue,
ROW_NUMBER() OVER(PARTITION BY customer_key ORDER BY order_date,order_number) AS customer_order_sequence
FROM `analytics.fact_sales`;

-- Customer lifetime cumulative revenue

SELECT *
FROM `analytics.customer_summary`;


-- Customer info

SELECT
customer_key,
SUM(sales_amount) AS customer_lifetime_value,
ROUND(AVG(sales_amount)) AS average_order_value,
MIN(order_date)  AS first_order_date,
MAX(order_date)  AS last_order_date,
COUNT(*)  AS total_orders
FROM `analytics.customer_summary`
GROUP BY customer_key
ORDER BY customer_lifetime_value DESC;


-- Top contributor customers

WITH customer_revenue AS(
  SELECT 
  customer_key,
  SUM(sales_amount) AS revenue
  FROM `analytics.fact_sales`
  GROUP BY customer_key
),

segmented_customers AS(

  SELECT *,
  CASE
    WHEN cumulative_share <= 80 THEN 'VIP Customers'
    WHEN cumulative_share <= 95 THEN 'Mid Customers'
    ELSE 'Low Value Customers'
  END AS customer_segment
  FROM(
  SELECT
  customer_key,
  revenue,
  SUM(revenue) OVER(ORDER BY revenue DESC) AS running_revenue,
  SUM(revenue) OVER() AS total_revenue,
  ROUND(100*(SUM(revenue) OVER(ORDER BY revenue DESC)/SUM(revenue) OVER()),2) AS cumulative_share
  FROM customer_revenue))

SELECT 
customer_segment,
COUNT(*) AS number_of_customers,
ROUND(100*COUNT(*)/SUM(COUNT(*)) OVER(),2) AS percentage
FROM segmented_customers

GROUP BY customer_segment
ORDER BY number_of_customers DESC













