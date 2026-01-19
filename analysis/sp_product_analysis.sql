-- =====================================================
-- Stored Procedure: sp_product_analysis
-- Purpose: Analyze product performance and revenue risk
-- =====================================================

DROP PROCEDURE IF EXISTS sp_product_analysis;
DELIMITER $$

CREATE PROCEDURE sp_product_analysis()
BEGIN

    -- =====================================
    -- Top 5 Products by Revenue
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
    ORDER BY total_revenue DESC
    LIMIT 5;

    -- =====================================
    -- High-Volume but Low-Revenue Products
    -- Products selling above-average quantity
    -- but generating below-average revenue
    -- =====================================

    WITH productstats AS (
        SELECT 
            p.product_id,
            p.product_name,
            SUM(oi.quantity) AS total_quantity,
            ROUND(
                SUM(oi.quantity * p.selling_price * (1 - oi.discount)),
                2
            ) AS total_revenue
        FROM order_items oi
        INNER JOIN products p 
            ON oi.product_id = p.product_id
        GROUP BY p.product_id, p.product_name
    )
    SELECT
        product_id,
        product_name,
        total_quantity,
        total_revenue
    FROM productstats
    WHERE total_revenue < (
        SELECT AVG(total_revenue) FROM productstats
    )
    ORDER BY total_quantity DESC;

    -- =====================================
    -- Best Product per Category
    -- =====================================

    WITH product_revenue AS (
        SELECT
            p.category,
            p.product_id,
            p.product_name,
            ROUND(
                SUM(oi.quantity * p.selling_price * (1 - oi.discount)),
                2
            ) AS total_revenue
        FROM products p
        INNER JOIN order_items oi 
            ON p.product_id = oi.product_id
        GROUP BY p.category, p.product_id, p.product_name
    ),
    ranked_products AS (
        SELECT
            *,
            RANK() OVER (
                PARTITION BY category
                ORDER BY total_revenue DESC
            ) AS revenue_rank
        FROM product_revenue
    )
    SELECT 
        category,
        product_id,
        product_name,
        total_revenue
    FROM ranked_products
    WHERE revenue_rank = 1;

END $$

DELIMITER ;
