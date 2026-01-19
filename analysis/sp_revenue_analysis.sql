-- =====================================================
-- Stored Procedure: sp_revenue_analysis
-- Purpose: Analyze revenue trends and performance
-- =====================================================

DROP PROCEDURE IF EXISTS sp_revenue_analysis;
DELIMITER $$

CREATE PROCEDURE sp_revenue_analysis()
BEGIN

    -- =====================================
    -- Total Revenue
    -- =====================================

    SELECT 
        ROUND(
            SUM(oi.quantity * p.selling_price * (1 - oi.discount)),
            2
        ) AS total_revenue
    FROM order_items oi
    INNER JOIN products p 
        ON oi.product_id = p.product_id;

    -- =====================================
    -- Revenue by Year
    -- =====================================

    SELECT 
        YEAR(o.order_date) AS order_year,
        ROUND(
            SUM(oi.quantity * p.selling_price * (1 - oi.discount)),
            2
        ) AS total_revenue
    FROM order_items oi
    INNER JOIN products p 
        ON oi.product_id = p.product_id
    INNER JOIN orders o 
        ON oi.order_id = o.order_id
    GROUP BY YEAR(o.order_date)
    ORDER BY total_revenue DESC;

    -- =====================================
    -- Revenue by Year and Month
    -- =====================================

    SELECT 
        YEAR(o.order_date) AS order_year,
        MONTH(o.order_date) AS order_month,
        ROUND(
            SUM(oi.quantity * p.selling_price * (1 - oi.discount)),
            2
        ) AS total_revenue
    FROM order_items oi
    INNER JOIN products p 
        ON oi.product_id = p.product_id
    INNER JOIN orders o 
        ON oi.order_id = o.order_id
    GROUP BY 
        YEAR(o.order_date),
        MONTH(o.order_date)
    ORDER BY total_revenue DESC;

    -- =====================================
    -- Top 5 Revenue-Generating Months
    -- =====================================

    SELECT 
        YEAR(o.order_date) AS order_year,
        MONTH(o.order_date) AS order_month,
        ROUND(
            SUM(oi.quantity * p.selling_price * (1 - oi.discount)),
            2
        ) AS total_revenue
    FROM order_items oi
    INNER JOIN products p 
        ON oi.product_id = p.product_id
    INNER JOIN orders o 
        ON oi.order_id = o.order_id
    GROUP BY 
        YEAR(o.order_date),
        MONTH(o.order_date)
    ORDER BY total_revenue DESC
    LIMIT 5;

    -- =====================================
    -- Bottom 5 Products by Revenue
    -- =====================================

    SELECT 
        p.product_name,
        ROUND(
            SUM(oi.quantity * p.selling_price * (1 - oi.discount)),
            2
        ) AS total_revenue
    FROM order_items oi
    INNER JOIN products p 
        ON oi.product_id = p.product_id
    GROUP BY p.product_name
    ORDER BY total_revenue ASC
    LIMIT 5;

END $$

DELIMITER ;

