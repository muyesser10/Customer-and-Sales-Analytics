# Performance Analysis

## Overview

This analysis evaluates business performance from multiple perspectives using advanced SQL window functions and analytical techniques.

The objective is not only to identify top-performing products and customers but also to measure growth trends, benchmark performance against peers, evaluate market contribution, and classify business entities according to their commercial impact.

The analysis focuses on answering questions such as:

- Which products are growing year over year?
- Which products outperform their category?
- Which products contribute the most revenue?
- Which products are growing, declining, or becoming future opportunities?
- Which customers generate the highest business value?

---

# Business Questions

The following business questions are addressed:

1. Which products achieved the highest Year-over-Year (YoY) revenue growth?
2. Which products perform above or below their category average?
3. Which products contribute the largest percentage of company revenue?
4. Which products should be classified as Star, Cash Cow, Emerging, or Declining?
5. Which customers belong to the highest revenue segments?

---

# SQL Techniques Used

- Common Table Expressions (CTEs)
- Window Functions
- LAG()
- NTILE()
- AVG() OVER()
- SAFE_DIVIDE()
- CASE Expressions
- Conditional Aggregation
- CROSS JOIN
- EXTRACT()
- NULLIF()
- Multi-stage analytical pipelines

---

# Analysis 1 — Product Year-over-Year Performance

## Business Problem

Business managers need to understand whether products are improving or declining compared to previous years.

Rather than comparing raw revenue values, Year-over-Year growth provides a standardized performance metric.

---

## SQL Approach

The analysis:

- aggregates yearly revenue per product
- retrieves previous year's revenue using LAG()
- calculates growth ratios using SAFE_DIVIDE()
- joins product metadata for readability

---

## Key Insights

- Most bicycle models experienced their largest revenue expansion during 2012–2013.
- Newly launched products naturally show extremely high growth ratios because previous-year revenue is very small.
- Products with growth ratios below **1.0** indicate declining yearly performance.


---

# Analysis 2 — Product Performance Within Category

## Business Problem

High revenue alone does not indicate good performance.

A product should also be evaluated relative to similar products inside the same category.

---

## SQL Approach

The analysis:

- calculates revenue per product
- computes category average using window functions
- compares each product against its category benchmark
- assigns performance labels

---

## Key Insights

- Several Mountain Bike models perform substantially above the average revenue of the Bikes category.
- Many Accessories generate revenue below category average despite maintaining steady sales.
- Category benchmarking helps identify products that deserve additional marketing investment.

---

# Analysis 3 — Product Revenue Contribution

## Business Problem

Management needs to know which products generate most company revenue.

This supports prioritization of inventory, forecasting, pricing strategy, and production planning.

---

## SQL Approach

The analysis:

- computes total revenue per product
- calculates overall company revenue
- derives each product's revenue contribution percentage

---

## Key Insights

- Revenue distribution is highly concentrated.
- Mountain-200 and Road-150 product families account for a significant share of overall revenue.
- Many accessory products individually contribute less than **0.1%** of total revenue.

This indicates a classic long-tail sales distribution.

---

# Analysis 4 — Product Growth Matrix

## Business Problem

Not every growing product deserves the same strategic treatment.

Products should be categorized according to both revenue size and growth performance.

---

## SQL Approach

Products are classified using business rules based on:

- revenue in 2012
- revenue in 2013
- growth percentage

Products are labeled as:

- Star Product
- Cash Cow
- Emerging Product
- Declining Product

---

## Key Insights

### Star Products

High revenue with continued growth.

Examples include multiple Mountain-200 models that combine large sales volume with strong annual expansion.

---

### Emerging Products

Growing products with lower revenue that have future potential.

These products may benefit from increased marketing or inventory investment.

---

### Cash Cows

High-revenue products with slowing growth.

These products generate stable income despite limited expansion.

---

### Declining Products

Products showing reduced revenue compared to the previous year.

Some of these represent discontinued product lines, while others require business review.

> **Important Dataset Note**

Products appearing only during 2013 are naturally classified as Emerging because no comparable revenue exists for 2012.

Likewise, products disappearing after 2012 are classified as Declining.

These classifications are influenced by product life-cycle timing rather than customer demand alone.

---

# Analysis 5 — Customer Performance Ranking

## Business Problem

Revenue is not evenly distributed across customers.

Identifying high-value customers supports CRM, loyalty programs, and targeted marketing.

---

## SQL Approach

The analysis:

- aggregates customer revenue
- calculates average order value
- counts customer orders
- segments customers into revenue deciles using NTILE(10)

---

## Key Insights

- Top decile customers generate significantly higher revenue than the remaining customer base.
- Many customers place only one or two orders, resulting in low lifetime value.
- Average order value varies considerably even among customers with similar total revenue, indicating different purchasing behaviors.

---

# Overall Business Findings

The performance analysis reveals several important patterns:

- Revenue is concentrated in a relatively small number of bicycle products.
- Mountain-200 product family dominates company revenue.
- Accessories generate comparatively low individual revenue but broaden product diversity.
- Product life-cycle effects strongly influence yearly growth metrics.
- Customer revenue follows a highly skewed distribution, emphasizing the importance of customer segmentation.


