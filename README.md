# 📊 RetailX – SQL Analytics Business Case Study

## 🧠 Project Overview

RetailX is a mid-size e-commerce company experiencing fluctuating revenue and declining profit margins.  
The leadership team requires **data-driven insights** to understand performance drivers and identify areas for improvement.

This project simulates a **real-world SQL analytics assignment**, where raw transactional data is analyzed using **structured SQL queries and stored procedures** to support business decision-making.

---

## 🎯 Business Objective

The primary objective of this analysis is to:

> **Identify key drivers of revenue and profitability and uncover improvement opportunities across products, customers, orders, and time.**

---

## 🏢 Role & Context

- **Role:** Junior Data Analyst  
- **Reporting To:** Analytics Manager  
- **Business Type:** E-commerce Retail  

As a newly joined analyst, my responsibility was to:
- Validate raw data
- Design a reliable analytical schema
- Perform revenue, product, customer, and order analysis
- Translate SQL results into actionable business insights

---

## 🗂️ Dataset Description

The analysis is based on **four relational tables**:

### 1️⃣ Customers
| Column | Description |
|------|------------|
| customer_id | Unique customer identifier |
| customer_name | Customer name |
| country | Customer country |
| signup_date | Registration date |

### 2️⃣ Products
| Column | Description |
|------|------------|
| product_id | Unique product identifier |
| product_name | Product name |
| category | Product category |
| cost_price | Cost to company |
| selling_price | Selling price |

### 3️⃣ Orders
| Column | Description |
|------|------------|
| order_id | Unique order identifier |
| customer_id | Customer placing the order |
| order_date | Order date |
| region | Sales region |

### 4️⃣ Order Items
| Column | Description |
|------|------------|
| order_item_id | Unique order item |
| order_id | Order reference |
| product_id | Product sold |
| quantity | Units sold |
| discount | Discount applied |

---

## 🏗️ Schema Design

- Fully normalized relational schema  
- Primary and foreign key constraints enforced  
- Referential integrity maintained  
- Indexes created for performance optimization  

All schema creation logic is implemented using a stored procedure:

📌 **`sp_create_retail_store_schema`**

---

## 🔍 Data Validation Approach (Phase 1)

Before analysis, extensive data quality checks were performed:

- Row count validation for all tables
- Date range verification (2+ years of data)
- Referential integrity checks across tables
- Duplicate detection (orders, customers, order items)
- Invalid value detection:
  - Negative quantities
  - Invalid pricing (selling price ≤ cost price)
- Identification of unsold products

All validation logic is centralized in:

📌 **`sp_data_quality_checks`**

---

## 📈 Business Questions Answered (Phase 2)

### Revenue & Profitability
- Total revenue generated
- Revenue trends by year and month
- Top 5 revenue-generating months
- Best and worst performing products

### Product Performance
- High-volume but low-revenue products
- Best product in each category
- Products generating losses due to discounts

### Customer Analysis
- High-value customers (above-average revenue)
- Repeat vs one-time customers
- Multi-year customers
- Lost / inactive customers

### Order Analysis
- Orders with unusually high item counts
- Orders where total discount exceeds total profit

All analytical logic is implemented using **modular stored procedures**:

- `sp_revenue_analysis`
- `sp_product_analysis`
- `sp_customer_analysis`
- `sp_order_analysis`

---

## 💡 Key Insights (Phase 3)

- A small percentage of products contributes the majority of total revenue
- Several high-volume products are underpriced, resulting in low profitability
- Heavy discounting negatively impacts profit on certain orders
- Repeat and multi-year customers generate significantly higher revenue
- Some products and customers show consistent underperformance

📄 Detailed insights available here:  
👉 `insights/key_insights.md`

---

## 📌 Business Recommendations

- Revisit pricing strategy for high-volume, low-margin products
- Optimize discount policies to protect profitability
- Focus retention efforts on repeat and high-value customers
- Review and rationalize underperforming products
- Use monthly revenue trends for better inventory and promotion planning

📄 Full recommendations available here:  
👉 `insights/recommendations.md`

---

## 📄 Case Study Document

A detailed business case study suitable for recruiters and interviews is available here:

👉 `docs/RetailX_SQL_Analytics_Case_Study.docx`

---

## 🛠️ Tools & Technologies Used

- SQL (MySQL)
- MySQL Workbench
- Jupyter Notebook
- GitHub
- Power BI (dashboard in progress)

---

## 📁 Repository Structure

RetailX-SQL-Analytics/
│
├── schema/
│ ├── create_database.sql
│ └── sp_create_retail_store_schema.sql
│
├── data_quality/
│ └── sp_data_quality_checks.sql
│
├── analysis/
│ ├── sp_revenue_analysis.sql
│ ├── sp_product_analysis.sql
│ ├── sp_customer_analysis.sql
│ └── sp_order_analysis.sql
│
├── data/
│ ├── customers.csv
│ ├── products.csv
│ ├── orders.csv
│ └── order_items.csv
│
├── insights/
│ ├── key_insights.md
│ └── recommendations.md
│
├── docs/
│ └── RetailX_SQL_Analytics_Case_Study.docx
│
└── README.md

Hi, I’m Shreesudhan Elangovan, a Business Analyst with a strong focus on SQL-driven analysis, business insights, and data-informed decision-making. This project demonstrates my approach to translating raw business data into meaningful insights that support strategic planning, performance improvement, and stakeholder decision-making.

📫 Feel free to connect or explore more projects on my GitHub!
