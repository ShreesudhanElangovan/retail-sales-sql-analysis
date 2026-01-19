-- =====================================================
-- Stored Procedure: sp_customer_analysis
-- Purpose: Analyze customer value, loyalty, and churn
-- =====================================================

DROP PROCEDURE IF EXISTS sp_customer_analysis;
DELIMITER $$

CREATE PROCEDURE sp_customer_analysis()
BEGIN

    -- =====================================
    -- High-Value Customers
    -- Customers whose total revenue is above average
    -- =====================================

    WITH customerstats AS (
        SELECT
            c.customer_id,
            c.customer_name,
            ROUND(
                SUM(oi.quantity * p.selling_price * (1 - oi.discount)),
                2
            ) AS total_revenue
        FROM order_items oi
        INNER JOIN products p 
            ON oi.product_id = p.product_id
        INNER JOIN orders o 
            ON oi.order_id = o.order_id
        INNER JOIN customers c 
            ON o.customer_id = c.customer_id
        GROUP BY c.customer_id, c.customer_name
    )
    SELECT *
    FROM customerstats
    WHERE total_revenue > (
        SELECT AVG(total_revenue) FROM customerstats
    );

    -- =====================================
    -- Multi-Year Customers
    -- Customers who placed orders in more than one year
    -- =====================================

    SELECT 
        c.customer_id,
        COUNT(DISTINCT YEAR(o.order_date)) AS order_years,
        COUNT(o.order_id) AS total_orders
    FROM orders o
    INNER JOIN customers c 
        ON o.customer_id = c.customer_id
    GROUP BY c.customer_id
    HAVING COUNT(DISTINCT YEAR(o.order_date)) > 1
    ORDER BY total_orders DESC;

    -- =====================================
    -- Repeat Customers
    -- Customers who placed more than one order
    -- =====================================

    SELECT 
        c.customer_id,
        COUNT(o.order_id) AS total_orders
    FROM orders o
    INNER JOIN customers c 
        ON o.customer_id = c.customer_id
    GROUP BY c.customer_id
    HAVING COUNT(o.o

