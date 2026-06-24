# Change Over Time Analysis

## Objective

The purpose of this analysis is to evaluate how key business metrics evolve over time, identify growth trends, detect seasonality patterns, and understand changes in customer activity and sales performance.

---

## Data Coverage Note

The dataset spans from **December 2010 to January 2014**.

Since **December 2010** and **January 2014** represent partial periods rather than complete years, they were included for completeness but excluded from business performance interpretations where appropriate.

Year-over-year and month-over-month comparisons should primarily focus on the fully available periods between **2011 and 2013**.

---

## Analysis Performed

### 1. Year-over-Year Revenue Growth

Analyzed annual revenue performance and calculated year-over-year growth rates using window functions.

#### Revenue by Year

| Year  |    Revenue |  YoY Growth |
| ----- | ---------: | ----------: |
| 2010* |     43,419 |           - |
| 2011  |  7,075,088 | +16,194.91% |
| 2012  |  5,842,231 |     -17.43% |
| 2013  | 16,344,878 |    +179.77% |
| 2014* |     45,642 |     -99.72% |

* Partial-year periods.

#### Findings

* Revenue expanded significantly during 2011.
* Revenue declined by 17.43% in 2012 before rebounding strongly.
* 2013 was the strongest year in the dataset, generating over $16.3M in sales.
* YoY comparisons involving 2010 and 2014 should be interpreted cautiously because both years contain incomplete data.

---

### 2. Monthly Business Performance

Tracked monthly business activity using:

* Total Sales
* Total Orders
* Active Customers
* Total Quantity Sold

#### Key Highlights

| Metric    | Lowest Month*  | Highest Month    |
| --------- | -------------- | ---------------- |
| Revenue   | Dec-2010 (43K) | Dec-2013 (1.87M) |
| Orders    | Dec-2010 (14)  | Dec-2013 (2,192) |
| Customers | Dec-2010 (14)  | Dec-2013 (2,133) |
| Quantity  | Dec-2010 (14)  | Dec-2013 (5,520) |

* Represents the first partial month in the dataset.

#### Findings

* Business activity accelerated significantly throughout 2013.
* December 2013 recorded the highest performance across all major KPIs.
* Revenue growth was supported by increases in both customer activity and order volume.

---

### 3. Month-over-Month Revenue Growth

Analyzed short-term revenue changes and sales momentum.

#### Notable Growth Periods

| Month     | MoM Growth |
| --------- | ---------: |
| Jan-2011* |   +982.00% |
| Jun-2012  |    +54.69% |
| Mar-2013  |    +36.11% |
| Jun-2013  |    +27.91% |

#### Largest Declines

| Month     | MoM Growth |
| --------- | ---------: |
| Jan-2014* |    -97.56% |
| Mar-2012  |    -26.33% |
| Jan-2012  |    -26.00% |
| Jul-2012  |    -19.92% |

* Influenced by partial-period data.

#### Findings

* Significant revenue expansion occurred throughout 2013.
* Growth became more consistent as the business matured.
* The decline observed in January 2014 is caused by incomplete data rather than actual business contraction.

---

### 4. Cumulative Revenue Trend

Calculated cumulative revenue using running totals.

#### Cumulative Revenue Milestones

| Period   | Cumulative Revenue |
| -------- | -----------------: |
| Dec-2010 |             43,419 |
| Dec-2011 |              7.12M |
| Dec-2012 |             12.96M |
| Dec-2013 |             29.31M |

#### Findings

* More than half of total revenue was generated during 2013.
* The cumulative revenue curve steepened considerably in 2013, indicating accelerated business growth.
* Total revenue reached approximately $29.3M by the end of the observation period.

---

### 5. Three-Month Moving Average

Applied a rolling three-month average to smooth monthly fluctuations.

#### Selected Results

| Month    | 3-Month Moving Average |
| -------- | ---------------------: |
| Jan-2011 |                256,607 |
| Jan-2012 |                608,422 |
| Jan-2013 |                673,377 |
| Dec-2013 |              1,776,026 |

#### Findings

* The moving average increased steadily throughout the dataset.
* Sales momentum accelerated significantly during 2013.
* Long-term growth remained positive despite temporary month-to-month volatility.

---

### 6. Monthly Customer Growth

Analyzed changes in active customer counts over time.

#### Highest Growth Months

| Month     | Customer Growth |
| --------- | --------------: |
| Jan-2011* |        +928.57% |
| Feb-2013  |        +118.98% |
| Jan-2013  |         +77.12% |
| Jun-2012  |         +53.62% |

* Influenced by the first partial month of the dataset.

#### Findings

* Customer acquisition was a primary driver of revenue growth.
* The strongest expansion period occurred during early 2013.
* Revenue growth and customer growth followed similar patterns throughout the dataset.

---

### 7. Quarterly Category Trends

Evaluated category performance across quarters.

#### Category Revenue by Quarter (2013)

| Quarter |     Bikes | Accessories | Clothing |
| ------- | --------: | ----------: | -------: |
| Q1 2013 | 2,501,271 |     120,674 |   56,763 |
| Q2 2013 | 3,719,990 |     171,974 |   81,300 |
| Q3 2013 | 4,102,113 |     175,765 |   86,951 |
| Q4 2013 | 5,030,333 |     199,018 |   98,726 |

#### Findings

* Bikes consistently dominated revenue generation.
* All categories demonstrated growth throughout 2013.
* Q4 2013 was the strongest quarter across every category.
* The majority of revenue growth was driven by the Bikes category.

---

## Overall Conclusions

* The business experienced substantial growth between 2011 and 2013.
* 2013 was the strongest year in terms of revenue, customers, orders, and units sold.
* Customer acquisition played a major role in overall business expansion.
* Revenue growth accelerated significantly during 2013, particularly in the second half of the year.
* Bikes remained the dominant product category and the primary contributor to sales growth.
* Q4 consistently delivered the strongest performance, suggesting a potential seasonal sales pattern.
* Partial periods at the beginning and end of the dataset should be excluded from strategic performance evaluations.
