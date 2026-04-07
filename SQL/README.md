# 📚 SQL Module — Relational Databases, ETL & Analytical Queries  
Comprehensive documentation of all SQL work across three themed sprints

This directory contains the complete SQL module developed during the Data Analytics program.  
It includes relational database exploration, schema evolution, data manipulation, ETL pipelines, and dimensional modeling.  
Each sprint focuses on a different real‑world SQL scenario, progressing from analysis to schema design and finally to data engineering.

The structure is organized by **theme**, not by sprint number, to make the repository clearer and more professional.

---

## 🗂️ Folder Structure

```
SQL/
│
├── transactions_analysis_sql/
│   ├── README.md
│   ├── transactions_analysis.sql
│   └── transactions_analysis_report.pdf
│
├── credit_card_extension_sql/
│   ├── README.md
│   ├── credit_card_extension.sql
│   └── credit_card_extension_report.pdf
│
└── marketplace_star_schema_sql/
    ├── README.md
    ├── marketplace_star_schema.sql
    └── marketplace_star_schema_report.pdf
```

Each folder contains:

- a **README.md** explaining the sprint  
- the **SQL script** with all queries  
- a **PDF report** with screenshots, outputs, and diagrams  

---

## 🧭 Overview of the Three SQL Projects

### **1. Transactions Analysis (Sprint 2)**  
Focus:  
- Understanding the relational schema  
- JOINs, subqueries, aggregations  
- Country‑level and company‑level sales insights  
- Identifying companies without transactions  
- Ranking days and countries by revenue  

This sprint builds the foundation for SQL analysis and relational reasoning.

---

### **2. Credit Card Extension (Sprint 3)**  
Focus:  
- Creating a new table (`credit_card`)  
- Adding foreign keys and enforcing referential integrity  
- Updating, inserting, and deleting records  
- Modifying table structure (ALTER TABLE)  
- Ensuring consistent timestamps  

This sprint simulates real‑world database maintenance and schema evolution.

---

### **3. Marketplace Star Schema & ETL (Sprint 4)**  
Focus:  
- Designing a star schema for analytical workloads  
- Creating staging tables for raw CSV ingestion  
- Loading data using `LOAD DATA INFILE`  
- Cleaning and transforming datasets  
- Merging user datasets into a unified dimension  
- Building fact and dimension tables  

This sprint mirrors a data engineering workflow from raw data to analytical model.

---

## 🎯 Skills Demonstrated Across the Module

- Relational database design  
- SQL DDL (CREATE, ALTER, DROP)  
- SQL DML (INSERT, UPDATE, DELETE)  
- JOINs, subqueries, aggregations  
- Data cleaning and transformation  
- ETL pipeline construction  
- Star schema modeling  
- Referential integrity and constraints  
- Documentation and reproducibility  

---

## 📄 How to Navigate

You can explore the module in two ways:

### **By theme**  
Each folder name describes the project’s purpose:
- *transactions_analysis_sql*  
- *credit_card_extension_sql*  
- *marketplace_star_schema_sql*

### **By complexity**  
If you prefer a progressive learning path:
1. **Sprint 2** → SQL analysis fundamentals  
2. **Sprint 3** → schema evolution + constraints  
3. **Sprint 4** → ETL + dimensional modeling  

---

## 🧩 About This Module

This SQL module reflects hands‑on, end‑to‑end work with realistic datasets.  
It demonstrates analytical thinking, technical rigor, and the ability to design and maintain relational systems — essential skills for data analytics, BI, and data engineering roles.
