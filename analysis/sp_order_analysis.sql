-- =====================================================
-- Stored Procedure: sp_order_analysis
-- Purpose: Analyze order-level behavior and risk
-- =====================================================

DROP PROCEDURE IF EXISTS sp_order_analysis;
DELIMITER $$

CREATE PROCEDURE sp_order_analysis()
BEGIN

    -- =====================================
    -- Orders with High Item Count
    -- Orders containing more items than
    -- the average order size
    -- =====================================

    WITH order_total AS (
        SELECT
            order_id,
            SUM(quantity) AS total_quantity
        FROM order_items
        GROUP BY order_id
    )
    SELECT
        order_id,
        total_quantity
    FROM order_total
    WHERE total_quantity > (
        SELECT AVG(total_quantity) FROM order_total
    )
    ORDER BY total_quantity DESC;

    -- =====================================
    -- Discount-Heavy Orders
    -- Orders where total discount exceeds
    -- total profit generated
    -- =====================================

    WITH discount_per_order AS (
        SELECT
            oi.order_id,
            ROUND(
                SUM(p.selling_price * oi.quantity * oi.discount),
                2
            ) AS total_discount_amount,
            ROUND(
                SUM(
                    (p.selling_price - p.cost_price)
                    * oi.quantity
                    * (1 - oi.discount)
                ),
                2
            ) AS total_profit
        FROM order_items oi
        INNER JOIN products p 
            ON oi.product_id = p.product_id
        GROUP BY oi.order_id
    )
    SELECT
        order_id,
        total_discount_amount,
        total_profit
    FROM discount_per_order
    WHERE total_discount_amount > total_profit
    ORDER BY total_discount_amount DESC;

END $$

DELIMITER ;

