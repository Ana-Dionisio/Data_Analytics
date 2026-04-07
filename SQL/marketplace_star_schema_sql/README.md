# 📌 Marketplace Star Schema — ETL, Data Cleaning & Dimensional Modeling  
Building a Star Schema for Analytical Workloads

This sprint focuses on designing and implementing a **star schema** for a marketplace dataset.  
It includes loading CSV files, cleaning and transforming raw data, and constructing dimension and fact tables suitable for analytical queries.

---

## 🎯 Objectives

- Analyze CSV structure and identify relationships  
- Design a **star schema** with:
  - 1 fact table (`transactions`)
  - multiple dimension tables (`products`, `companies`, `credit_cards`, `users`)
- Create temporary staging tables for raw CSV ingestion  
- Load data using `LOAD DATA INFILE`  
- Clean and transform data types  
- Merge American and European users into a unified `users` dimension  
- Prepare the schema for BI‑style analytics  

---

## 🗂️ Files in This Folder

- **marketplace_star_schema.sql** — full ETL + schema creation script  
- **marketplace_star_schema_report.pdf** — detailed report with screenshots and outputs  
- **README.md** — documentation of the sprint (this file)

---

## 🧱 Workflow Summary

### ✔️ 1. Staging Tables  
Temporary tables created with all fields as `VARCHAR(500)` to allow flexible ingestion.

### ✔️ 2. CSV Loading  
Using:

```sql
LOAD DATA INFILE ...
```

- Loaded datasets:
  - `products.csv`
  - `companies.csv`
  - `credit_cards.csv`
  - `american_users.csv`
  - `european_users.csv`
  - `transactions.csv`

### ✔️ 3. Data Cleaning  
- Converted numeric fields to `FLOAT`, `INT`, or `DECIMAL`  
- Normalized date formats  
- Removed invalid characters  
- Split multi‑value fields where needed  

### ✔️ 4. User Dimension Consolidation  
Merged American and European users into a single `users` table:

```
american_users_temp  →  
                       users_temp  →  users (dimension)
european_users_temp  →
```

### ✔️ 5. Star Schema Construction

Final schema:

```
                 products (dim)
                       ↑
                       │
credit_cards (dim) ← transactions (fact) → companies (dim)
                       │
                       ↓
                    users (dim)
```

### ✔️ 6. Fact Table Preparation  
- Cleaned `product_ids`  
- Ensured referential integrity  
- Converted timestamps  
- Standardized geographic coordinates  

---

## 📈 Skills Demonstrated

- ETL pipeline design  
- Star schema modeling  
- Data type normalization  
- Bulk loading with `LOAD DATA INFILE`  
- Data cleaning and transformation  
- Dimensional modeling for analytics  

---

## 📄 Notes

This sprint simulates a real‑world data engineering workflow, from raw CSV ingestion to a fully structured analytical schema ready for BI tools and SQL analytics.
```
