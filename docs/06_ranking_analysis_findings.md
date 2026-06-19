# Ranking Analysis

## Objective

The purpose of this analysis is to identify top-performing and low-performing products, customers, and regions using ranking techniques and window functions.

The analysis focuses on:

- Top and bottom revenue-generating products
- Top customers by revenue
- Top customers by order frequency
- Product performance within categories
- Product performance across countries
- Revenue concentration (Pareto Analysis)

---

## Top 10 Products by Revenue

| Rank | Product Name | Total Revenue |
|------|-------------|--------------:|
| 1 | Mountain-200 Black-46 | 1,373,454 |
| 2 | Mountain-200 Black-42 | 1,363,128 |
| 3 | Mountain-200 Silver-38 | 1,339,394 |
| 4 | Mountain-200 Silver-46 | 1,301,029 |
| 5 | Mountain-200 Black-38 | 1,294,854 |
| 6 | Mountain-200 Silver-42 | 1,257,368 |
| 7 | Road-150 Red-48 | 1,205,786 |
| 8 | Road-150 Red-62 | 1,202,208 |
| 9 | Road-150 Red-52 | 1,080,556 |
| 10 | Road-150 Red-56 | 1,055,510 |

### Findings

- Mountain-200 product family dominates overall revenue generation.
- Premium bike products generate significantly higher revenue than accessories and clothing products.
- The top 10 revenue-generating products are exclusively bike products.

---

## Bottom 10 Products by Revenue

| Rank | Product Name | Total Revenue |
|------|-------------|--------------:|
| 1 | Racing Socks - L | 2,430 |
| 2 | Racing Socks - M | 2,682 |
| 3 | Patch Kit/8 Patches | 6,382 |
| 4 | Bike Wash - Dissolver | 7,272 |
| 5 | Touring Tire Tube | 7,440 |
| 6 | Road Tire Tube | 9,504 |
| 7 | Half-Finger Gloves - L | 10,632 |
| 8 | Classic Vest - S | 10,944 |
| 9 | Half-Finger Gloves - S | 11,712 |
| 10 | Half-Finger Gloves - M | 11,976 |

### Findings

- The lowest-performing products are mostly low-cost accessories and clothing items.
- Revenue contribution from these products is negligible compared to bike products.
- These products may be important for customer experience but are not major revenue drivers.

---

## Top Customers by Revenue

| Rank | Customer | Revenue |
|------|----------|---------:|
| 1 | Kaitlyn Henderson | 13,294 |
| 1 | Nichole Nara | 13,294 |
| 3 | Margaret He | 13,268 |
| 4 | Randall Dominguez | 13,265 |
| 5 | Adriana Gonzalez | 13,242 |

### Findings

- Revenue among top customers is highly competitive and closely distributed.
- No single customer dominates overall business revenue.
- Revenue appears to be broadly distributed across the customer base.

---

## Top Customers by Order Frequency

| Customer | Total Orders |
|----------|-------------:|
| Dalton Perez | 28 |
| Mason Roberts | 28 |
| Several Customers | 27 |

### Findings

- Customers with the highest order counts are not necessarily the highest revenue generators.
- Frequent purchasing behavior does not automatically indicate high customer value.

---

## Revenue vs Order Frequency Comparison

### Findings

Several customers ranked first in order frequency were ranked far lower in revenue generation.

Examples:

| Customer | Revenue Rank | Order Rank |
|----------|-------------:|-----------:|
| Dalton Perez | 7153 | 1 |
| Mason Roberts | 6916 | 1 |

### Business Insight

Order volume alone is not sufficient for measuring customer value.

Customer evaluation should include both:

- Purchase frequency
- Revenue contribution

This finding highlights the importance of customer segmentation and Customer Lifetime Value (CLV) analysis.

---

## Top Products Within Categories

### Bikes

| Rank | Product |
|------|----------|
| 1 | Mountain-200 Black-46 |
| 2 | Mountain-200 Black-42 |
| 3 | Mountain-200 Silver-38 |

### Accessories

| Rank | Product |
|------|----------|
| 1 | Sport-100 Helmet - Red |
| 2 | Sport-100 Helmet - Blue |
| 3 | Sport-100 Helmet - Black |

### Clothing

| Rank | Product |
|------|----------|
| 1 | Women's Mountain Shorts - L |
| 2 | Women's Mountain Shorts - M |
| 3 | Long-Sleeve Logo Jersey - L |

### Findings

- Product leaders differ significantly by category.
- Bikes generate the highest revenue overall.
- Accessories and Clothing have their own category leaders despite contributing less revenue.

---

## Top Products by Country

| Country | Top Product |
|----------|------------|
| Australia | Road-150 Red-62 |
| Canada | Mountain-200 Black-42 |
| France | Mountain-200 Black-46 |
| Germany | Mountain-200 Silver-46 |
| United Kingdom | Mountain-200 Black-42 |
| United States | Mountain-200 Black-46 |

### Findings

- Product preferences vary across countries.
- Mountain-200 variants consistently appear among the highest-performing products globally.
- Regional demand patterns can support localized marketing strategies.

---

## Pareto Analysis (80/20 Principle)

### Results

| Metric | Value |
|----------|------:|
| Total Products | 295 |
| Products Generating First 80% of Revenue | 34 |
| Portfolio Share | 11.5% |

### Findings

- Only 34 products generate 80% of total revenue.
- These products represent approximately 11.5% of the entire product portfolio.
- Revenue generation is highly concentrated among a relatively small number of products.

### Business Insight

The product portfolio exhibits a strong Pareto distribution.

A small subset of products drives the majority of company revenue.

This insight can support:

- Inventory optimization
- Product prioritization
- Marketing budget allocation
- Revenue forecasting

---

## Key Findings

- Mountain-200 bike variants dominate total revenue generation.
- Low-cost accessories contribute very little revenue.
- High order frequency does not necessarily translate into high customer value.
- Product preferences vary across countries.
- Revenue generation is heavily concentrated among a small subset of products.
- Only 34 products (11.5% of the catalog) generate 80% of total revenue.
- The business exhibits a strong Pareto distribution.