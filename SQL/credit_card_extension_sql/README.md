# 📌 Credit Card Extension — SQL Schema Update & Data Manipulation  
Enhancing the Transactions Database with a New Table and Referential Integrity

This sprint focuses on extending the existing **transactions** database by introducing a new table (`credit_card`) and establishing proper relationships with the existing tables (`transaction` and `company`).  
It also includes data updates, record insertion, constraint management, and structural modifications.

---

## 🎯 Objectives

- Create a new table: **credit_card**
- Insert credit card records from the provided dataset
- Establish a **foreign key** relationship between `transaction.credit_card_id` and `credit_card.id`
- Update specific records (e.g., correcting IBAN values)
- Insert a new transaction with dependencies
- Modify table structure (e.g., enforcing NOT NULL + DEFAULT timestamp)
- Remove a column from an existing table
- Delete specific records from the `transaction` table

---

## 🗂️ Files in This Folder

- **credit_card_extension.sql** — full SQL script for all tasks  
- **credit_card_extension_report.pdf** — detailed report with screenshots and outputs  
- **README.md** — documentation of the sprint (this file)

---

## 🧱 Database Changes Implemented

### ✔️ 1. Creation of `credit_card` table  
Fields include:
- `id` (PK)  
- `iban`  
- `pin`  
- `cvv`  
- `expiring_date`  
- `pan` (later removed)

### ✔️ 2. Foreign Key Relationship  
`transaction.credit_card_id` → `credit_card.id`  
- Ensures referential integrity  
- Uses `ON DELETE SET NULL` to avoid orphaned records  

### ✔️ 3. Data Manipulation  
- Updating IBAN for card `CcU‑2938`  
- Inserting a new company, credit card, and transaction  
- Updating NULL timestamps to `CURRENT_TIMESTAMP`  
- Enforcing default timestamp behavior  

### ✔️ 4. Schema Modification  
- Dropping the `pan` column from `credit_card`  
- Making `timestamp` in `transaction` **NOT NULL** with default value  

### ✔️ 5. Record Deletion  
- Removing a specific transaction by ID  

---

## 📈 ER Diagram (Conceptual Overview)

The updated schema now includes:
credit_card (1) ────< (N) transaction >──── (1) company

---

## 🧩 Skills Demonstrated

- SQL DDL (CREATE, ALTER, DROP)
- SQL DML (INSERT, UPDATE, DELETE)
- Foreign key constraints
- Data cleaning and correction
- Schema evolution and documentation

---

## 📄 Notes

This sprint emphasizes **database integrity**, **schema evolution**, and **controlled data manipulation**, reflecting real‑world database maintenance workflows.