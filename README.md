📊 RetailX – Revenue & Profitability Analytics (SQL + Power BI)
🧠 Project Overview

RetailX is a mid-size e-commerce company experiencing fluctuating revenue and declining profit margins.
Leadership requires data-driven insights to understand what is driving performance and where corrective action is needed.

This project simulates a real-world analytics assignment, where transactional data is analyzed using SQL, data quality checks, and analytical modeling, and insights are presented through an executive Power BI dashboard.

🎯 Business Objective

The primary objective of this analysis is to:

Identify key drivers of revenue and profitability and uncover actionable improvement opportunities across products, customers, orders, and time.


🗂️ Dataset Overview

The analysis is based on four relational tables:

1.Customer
| Column Name   | Description                |
| ------------- | -------------------------- |
| customer_id   | Unique customer identifier |
| customer_name | Name of the customer       |
| country       | Customer’s country         |
| signup_date   | Date the customer joined   |

2.Product
| Column Name   | Description               |
| ------------- | ------------------------- |
| product_id    | Unique product identifier |
| product_name  | Product name              |
| category      | Product category          |
| cost_price    | Cost to company           |
| selling_price | Selling price             |

3. Orders
| Column Name | Description                   |
| ----------- | ----------------------------- |
| order_id    | Unique order identifier       |
| customer_id | Customer who placed the order |
| order_date  | Date of order                 |
| region      | Sales region                  |

4. Order Items
| Column Name   | Description          |
| ------------- | -------------------- |
| order_item_id | Unique order item ID |
| order_id      | Order reference      |
| product_id    | Product sold         |
| quantity      | Number of units sold |
| discount      | Discount applied     |


🏗️ Schema Design

Fully normalized relational schema

Primary and foreign key constraints enforced

Referential integrity maintained

Indexes created for performance optimization

All schema creation logic is implemented using:

📌 sp_create_retail_store_schema

🔍 Data Validation & Quality Checks (Phase 1)

Comprehensive data quality checks were performed before analysis:

Row count validation across all tables

Date range verification (2022–2024)

Referential integrity validation

Duplicate detection (customers, orders, order items)

Invalid value checks:

Negative quantities

Invalid pricing (selling price ≤ cost price)

Identification of unsold products

All validation logic is centralized in:

📌 sp_data_quality_checks

📈 Business Analysis Performed (Phase 2)
Revenue & Profitability

Total revenue and total profit

Monthly and yearly revenue trends

Profit margin trend analysis

Top and bottom performing products

Product Performance

High-volume, low-margin products

Best-performing product in each category

Discount-heavy products impacting profitability

Customer Analysis

High-value customers

Repeat vs one-time customers

Multi-year customers

Lost / inactive customers

Order Analysis

Orders with unusually high item quantities

Orders where total discounts exceed total profit

All analysis is implemented using modular stored procedures:

sp_revenue_analysis

sp_product_analysis

sp_customer_analysis

sp_order_analysis

💡 Key Business Insights (Phase 3)

A small percentage of products contributes the majority of revenue

Several high-volume products are underpriced, leading to margin erosion

Heavy discounting negatively impacts profitability on certain orders

Repeat and multi-year customers generate significantly higher lifetime value

Some product categories consistently underperform and require review

📄 Detailed insights:
👉 insights/key_insights.md

📌 Business Recommendations

Revisit pricing strategy for high-volume, low-margin products

Introduce tighter discount governance to protect margins

Prioritize retention strategies for repeat and high-value customers

Rationalize or reposition underperforming products

Use monthly revenue trends to improve inventory and promotion planning

📄 Detailed recommendations:
👉 insights/recommendations.md

📊 Power BI Executive Dashboard

An interactive Power BI dashboard was developed to translate SQL insights into executive-ready visuals.

Dashboard Highlights

KPI Cards: Revenue, Profit, Margin, Orders, AOV

Monthly revenue and profit margin trends

Revenue contribution by category

Top 5 products by revenue

High-value customers overview

Discount impact on profitability

📁 Dashboard files:

/dashboard/
├── RetailX_Revenue_Profitability_Dashboard.pbix
└── dashboard_screenshot.png

📄 Case Study Document

A full business storytelling case study suitable for interviews and recruiter review:

👉 docs/RetailX_SQL_Analytics_Case_Study.docx

🛠️ Tools & Technologies

SQL (MySQL)

MySQL Workbench

Jupyter Notebook

Power BI

GitHub

📁 Repository Structure
RetailX-SQL-Analytics/
│
├── schema/
├── data_quality/
├── analysis/
├── data/
├── insights/
├── dashboard/
├── docs/
└── README.md

👋 About Me

Hi, I’m Shreesudhan Elangovan, a Business Analyst with a strong focus on SQL-driven analysis, business insights, and data-informed decision-making.

📫 Feel free to connect or explore more projects on my GitHub!
