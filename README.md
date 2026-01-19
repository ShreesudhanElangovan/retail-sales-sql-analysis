# 🏗️ Retail Sales Analytics Project (SQL Business Case Study)

Welcome to the **Retail Sales Analytics Project** repository!

This project demonstrates a complete **SQL-based analytics solution** — from schema design and data validation to revenue, profitability, product, and customer analysis.  
It is designed as a **portfolio-ready project** that follows real-world analytics and SQL best practices.

---

## 📌 Project Overview

RetailX has experienced fluctuating revenue and declining profit margins.  
The leadership team requires **data-driven insights** to understand what is driving performance and where improvements are needed.

This project simulates a real-world SQL analytics assignment using **structured queries and stored procedures** to support business decision-making.

---

## 🎯 Business Objective

The primary objective of this analysis is:

> **To identify key drivers of revenue and profitability and uncover improvement opportunities across products, customers, orders, and time.**

---

## 🗂️ Dataset Description

The analysis is based on four relational tables:

### Customers
- customer_id
- customer_name
- country
- signup_date

### Products
- product_id
- product_name
- category
- cost_price
- selling_price

### Orders
- order_id
- customer_id
- order_date
- region

### Order Items
- order_item_id
- order_id
- product_id
- quantity
- discount

All datasets are provided as CSV files in the `data/` folder.

---

## 🏗️ Schema Design

- Fully normalized relational schema
- Primary and foreign key constraints enforced
- Referential integrity maintained
- Indexes created for performance optimization

Schema creation is implemented using:

```sql
sp_create_retail_store_schema
