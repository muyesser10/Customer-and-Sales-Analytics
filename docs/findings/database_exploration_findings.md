# Database Exploration Findings

## 1. Dataset Overview

The dataset consists of three tables:

| Table | Row Count |
|------|----------:|
| dim_customers | 18,484 |
| dim_products | 295 |
| fact_sales | 60,398 |

---

## 2. Key Uniqueness (Primary Key Validation)

### Customer Table
- Total Rows: 18,484
- Unique Customer Keys: 18,484
- Status: ✅ No duplicates found

### Product Table
- Total Rows: 295
- Unique Product Keys: 295
- Status: ✅ No duplicates found

---

## 3. Data Quality (Null Analysis)

### dim_customers
- No null values detected in any column
- Status: ✅ Clean dataset

### dim_products
- Missing values found in:
  - category → 7 nulls
  - subcategory → 7 nulls
  - maintenance → 7 nulls
- Status: ⚠️ Minor missing values in categorical fields

### fact_sales
- Missing values found in:
  - order_date → 19 nulls
- All other columns are complete
- Status: ⚠️ Minor issue in order_date field

---

## 4. Time Range Analysis

- First Order Date: 2010-12-29
- Last Order Date: 2014-01-28
---

## 5. Key Insights

- The dataset is well-structured and follows a star schema design.
- Primary keys in both dimension tables are fully unique.
- Overall data quality is high with minimal missing values.
- fact_sales is the largest table, as expected in transactional datasets.
- Minor data quality issues exist in date and categorical fields, but they are not critical for analysis.

---

## 6. Conclusion

The dataset is clean and ready for analytical processing including:

- Customer segmentation
- Sales performance analysis
- Product performance analysis
- Time-series analysis