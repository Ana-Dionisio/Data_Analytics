# 📌 Transactions Analysis — SQL Queries & Relational Exploration  
Exploring the Transactions Database Using JOINs, Subqueries and Aggregations

This sprint focuses on exploring a relational database containing **companies** and **transactions**, using SQL to answer analytical questions, inspect relationships, and extract insights.  
The work includes schema understanding, JOIN operations, subqueries, aggregations, and business‑oriented SQL analysis.

---

## 🎯 Objectives

- Inspect the structure of the `company` and `transaction` tables  
- Understand primary and foreign key relationships  
- Perform JOIN‑based queries  
- Use subqueries to filter and aggregate data  
- Identify countries, companies, and sales patterns  
- Compute averages, counts, and rankings  
- Retrieve transactions based on business rules  
- Identify companies without transactions  

---

## 🗂️ Files in This Folder

- **transactions_analysis.sql** — full SQL script with all queries  
- **transactions_analysis_report.pdf** — detailed report with screenshots and outputs  
- **README.md** — documentation of the sprint (this file)

---

## 🧱 Database Structure

### ✔️ Tables Included

#### **company**
Stores company metadata.

Key fields:
- `id` (PK)  
- `company_name`  
- `phone`  
- `email`  
- `country`  
- `website`  

#### **transaction**
Stores individual payment transactions.

Key fields:
- `id` (PK)  
- `credit_card_id`  
- `company_id` (FK → company.id)  
- `user_id`  
- `lat`, `longitude`  
- `timestamp`  
- `amount`  
- `declined`  

### ✔️ Relationship

```
company (1) ────< (N) transaction
```

Each company can have multiple transactions; each transaction belongs to exactly one company.

---

## 🧪 Key SQL Tasks Completed

### ✔️ 1. Countries generating sales  
Using `JOIN` + `DISTINCT` to list all countries with at least one transaction.

### ✔️ 2. Number of countries involved  
Counting unique countries contributing to sales.

### ✔️ 3. Company with the highest average transaction amount  
Using `GROUP BY`, `AVG()`, and `ORDER BY`.

### ✔️ 4. Transactions from companies in Germany  
Using a **subquery** to filter by country.

### ✔️ 5. Companies with above‑average sales  
Nested subqueries comparing company averages to the global average.

### ✔️ 6. Companies without transactions  
Identifying companies whose IDs do not appear in the `transaction` table.

### ✔️ 7. Top 5 revenue days  
Aggregating by date and ranking by total sales.

### ✔️ 8. Average sales by country  
Computing and ordering country‑level averages.

### ✔️ 9. Transactions from companies in the same country as “Non Institute”  
Combining JOINs and subqueries to filter by a target company’s country.

---

## 📈 Insights Extracted

- Sales originate from **15 different countries**.  
- The company with the highest average sales is **Ac Fermentum Incorporated**.  
- Several companies exist in the database without any recorded transactions.  
- Revenue peaks occur on specific days, useful for marketing and operations.  
- Countries show significant variation in average transaction amounts.

---

## 🧩 Skills Demonstrated

- JOINs (INNER JOIN)  
- Subqueries (IN, nested SELECTs)  
- Aggregations (AVG, COUNT, SUM)  
- Filtering and ordering  
- Grouped analysis  
- Schema interpretation  
- Business‑oriented SQL reasoning  

---

## 📄 Notes

This sprint establishes the foundation for SQL analysis by combining relational understanding with practical business queries.  
It sets the stage for the schema evolution in Sprint 3 and the ETL + star schema modeling in Sprint 4.



