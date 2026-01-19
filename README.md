🏗️ Retail Sales Analytics Project (SQL Business Case Study)

Welcome to the Retail Sales Analytics Project repository!

This project demonstrates a complete SQL-based analytics solution — from schema design and data validation to revenue, profitability, and customer analysis.
It is designed as a portfolio-ready business case study that highlights industry-aligned SQL analytics best practices.

📋 Project Requirements
🎯 Objective

Develop a structured SQL analytics solution using MySQL to analyze retail sales data and generate actionable business insights that support data-driven decision-making.

RetailX has experienced fluctuating revenue and declining profit margins. Leadership requires analytical insights to understand:

What drives revenue and profit

What is underperforming

Where corrective action is needed

🧾 Project Specifications
🗂️ Data Source

Transactional retail data provided as CSV files

Four core entities:

Customers

Products

Orders

Order Items

🏗️ Schema Design

Fully normalized relational schema

Primary and foreign key constraints enforced

Referential integrity maintained

Indexes created for query performance optimization

All schema creation logic is implemented using a stored procedure:

sp_create_retail_store_schema

🔍 Data Quality & Validation

Before analysis, extensive data validation checks were performed to ensure accuracy and reliability.

Validation Scope

Row count validation across all tables

Date range verification (2+ years of data)

Referential integrity checks

Duplicate detection:

Orders

Customers

Order items

Invalid value detection:

Negative quantities

Invalid pricing (selling price ≤ cost price)

Identification of unsold products

All checks are centralized in:

sp_data_quality_checks

📊 Analytics & Business Questions
Revenue & Profitability Analysis

Total revenue generated

Revenue trends by year and month

Top 5 revenue-generating months

Best and worst performing products

Revenue contribution by category

Product Performance

High-volume but low-revenue products

Best-performing product in each category

Products generating losses due to heavy discounting

Customer Analysis

High-value customers (above-average revenue)

Repeat vs one-time customers

Multi-year customers

Lost / inactive customers

Order Analysis

Orders with unusually high item counts

Orders where total discount exceeds total profit

All analytical logic is implemented using modular stored procedures:

sp_revenue_analysis
sp_product_analysis
sp_customer_analysis
sp_order_analysis

💡 Key Insights

A small percentage of products contributes the majority of total revenue

Several high-volume products are underpriced, leading to low profitability

Heavy discounting negatively impacts profit on certain orders

Repeat and multi-year customers contribute significantly higher revenue

Some products and customers show consistent underperformance

📌 Business Recommendations

Revisit pricing strategy for high-volume, low-margin products

Optimize discount policies to protect profitability

Focus retention efforts on repeat and high-value customers

Review and rationalize underperforming products

Use monthly revenue trends to plan promotions and inventory more effectively

🛠️ Tools & Technologies Used

MySQL

MySQL Workbench

Jupyter Notebook (query execution & validation)

GitHub (version control & documentation)

Power BI (dashboarding & visualization — in progress)

🚀 Project Value

This project demonstrates:

Strong SQL fundamentals

Real-world business problem solving

Data validation discipline

Modular and scalable analytics design

Clear translation of data into business insights

🧾 License

This project is licensed under the MIT License.
You are free to use, modify, and share this project with proper attribution.

👋 About Me

Hello! I’m Shreesudhan Elangovan, a passionate aspiring Data Analyst with hands-on experience in SQL analytics, data validation, and business insight generation.

I am actively seeking opportunities where I can apply my skills to transform data into meaningful, actionable insights.
