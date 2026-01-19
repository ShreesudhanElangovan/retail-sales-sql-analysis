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


🔍 Data Validation (Phase 1)

Before analysis, extensive data quality checks were performed:

Row count validation

Date range verification (2+ years of data)

Referential integrity checks

Duplicate detection

Invalid value detection

Identification of unsold products

Validation logic is centralized in:

sp_data_quality_checks

📊 Business Analysis (Phase 2)
Revenue & Profitability

Total revenue

Yearly and monthly revenue trends

Top revenue months

Best and worst products

Category-level contribution

Product Performance

High-volume but low-revenue products

Best product per category

Discount-driven loss products

Customer Analysis

High-value customers

Repeat vs one-time customers

Multi-year customers

Lost / inactive customers

Order Analysis

Orders with high item counts

Orders where discounts exceed profit

Each analysis area is implemented using modular stored procedures:

sp_revenue_analysis
sp_product_analysis
sp_customer_analysis
sp_order_analysis

💡 Key Insights

A small percentage of products contributes the majority of revenue

Several high-volume products are underpriced

Heavy discounting reduces profitability

Repeat and multi-year customers generate significantly higher revenue

Certain products and customers consistently underperform

Detailed insights are documented in:

insights/key_insights.md

📌 Business Recommendations

Revisit pricing strategy for high-volume, low-margin products

Optimize discount policies

Focus retention efforts on high-value customers

Rationalize underperforming products

Use monthly trends for inventory and promotion planning

Detailed recommendations are available in:

insights/recommendations.md

▶️ How to Run This Project
CREATE DATABASE retail_store;
USE retail_store;

CALL sp_create_retail_store_schema();
CALL sp_data_quality_checks();

CALL sp_revenue_analysis();
CALL sp_product_analysis();
CALL sp_customer_analysis();
CALL sp_order_analysis();

🛠️ Tools & Technologies

MySQL

MySQL Workbench

Jupyter Notebook

GitHub

Power BI (in progress)

👋 About Me

Shreesudhan Elangovan
Aspiring Data Analyst passionate about SQL analytics and business insight generation.
Actively seeking analytics opportunities to transform data into actionable decisions.
