# Customer & Sales Analytics with BigQuery & SQL

## Overview

This project demonstrates an end-to-end sales analytics workflow built entirely in **Google BigQuery and SQL**.

The objective is to transform raw transactional data into actionable business insights through data quality assessment, customer analytics, product performance analysis, KPI development, and time-series analytics.

---

## Business Problem

A retail company collects large volumes of transactional sales data but lacks a structured analytics layer to support business decision-making.

This project answers key business questions such as:

* Which customers generate the highest business value?
* Which products drive the majority of revenue?
* How has business performance changed over time?
* Which products should be prioritized?
* How concentrated is revenue across customers and products?

---

## Dataset

The project uses a **Star Schema** consisting of three analytical tables.

| Table           | Description        |
| --------------- | ------------------ |
| `dim_customers` | Customer dimension |
| `dim_products`  | Product dimension  |
| `fact_sales`    | Sales fact table   |

**Dataset Size**

* 18,484 Customers
* 295 Products
* 60,398 Sales Transactions

---

## Solution Workflow

```text
Raw Sales Database
        │
        ▼
Database Exploration
        │
        ▼
Data Quality Assessment
        │
        ▼
Exploratory Data Analysis
        │
        ▼
Customer & Product Analytics
        │
        ▼
KPI Development
        │
        ▼
Ranking & Window Function Analysis
        │
        ▼
Time-Series Analysis
        │
        ▼
Performance Analysis
        │
        ▼
Business Insights
```

---

## Data Model

The project is built on a Star Schema.

```text
           dim_customers
                 │
                 │
                 │
dim_products ─── fact_sales
```

---

## Project Scope

The project includes the following analytical modules:

* Database Exploration
* Data Quality Assessment
* Customer Analytics
* Product Analytics
* Sales Performance Analysis
* KPI Development
* Ranking Analysis
* Time-Series Analysis
* Cumulative Analysis
* Performance Analysis

---

## SQL Skills Demonstrated

### Data Exploration

* INFORMATION_SCHEMA
* Metadata Inspection
* Schema Discovery

### Data Quality

* Primary Key Validation
* Duplicate Detection
* NULL Analysis

### Advanced SQL

* Common Table Expressions (CTEs)
* Window Functions
* Conditional Aggregation
* Ranking Functions
* Running Totals
* Moving Average
* Pareto Analysis
* Customer Lifetime Value (CLV)

### BigQuery Features

* CREATE VIEW
* CREATE TABLE
* SAFE_DIVIDE()
* FORMAT_DATE()
* DATE_TRUNC()

---

## Key Business Insights

* Generated more than **$29.3M** in total revenue.
* Bikes contributed over **96%** of company revenue.
* Only **34 products** generated approximately **80%** of total revenue.
* Australia had the highest revenue per customer.
* Revenue accelerated significantly throughout **2013**.
* Customer revenue follows a strong Pareto distribution.
* High purchase frequency does not always indicate high customer value.

---

## Technologies Used

* Google BigQuery
* SQL Window Functions
* Star Schema
* Analytical SQL


---

## Repository Structure

```text
customer-sales-analytics/
│
├── README.md
├── sql/
│   ├── 01_database_exploration.sql
│   ├── 02_dimensions_exploration.sql
│   ├── 03_date_exploration.sql
│   ├── 04_measures.sql
│   ├── 05_magnitude_analysis.sql
│   ├── 06_ranking_analysis.sql
│   ├── 07_change_over_time.sql
│   ├── 08_cumulative_analysis.sql
│   └── 09_performance_analysis.sql
│
└── docs/
│    ├── business_insights.md
│    ├── findings.md
│
└── screenshots  
    
```

---

## Future Improvements

* Build interactive dashboards with Looker Studio.
* Transform analytical models using dbt.
* Implement automated data quality checks.
* Schedule recurring analytical pipelines in BigQuery.
* Extend customer segmentation using RFM Analysis.
* Develop predictive sales forecasting with BigQuery ML.

---




