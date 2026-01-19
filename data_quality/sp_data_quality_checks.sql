-- =====================================================
-- Stored Procedure: sp_data_quality_checks
-- Purpose: Perform data validation and integrity checks
-- =====================================================

DROP PROCEDURE IF EXISTS sp_data_quality_checks;
DELIMITER $$

CREATE PROCEDURE sp_data_quality_checks()
BEGIN

    -- =====================================
    -- Record Counts
    -- =====================================

    SELECT COUNT(*) AS total_customers
    FROM customers;

    SELECT COUNT(*) AS total_order_items
    FROM order_items;

    SELECT COUNT(*) AS total_orders
    FROM orders;

    SELECT COUNT(*) AS total_products
    FROM products;

    -- =====================================
    -- Date Range Validation
    -- =====================================

    SELECT 
        MAX(order_date) AS latest_order_date,
        MIN(order_date) AS earliest_order_date
    FROM orders;

    -- =====================================
    -- Referential Integrity Checks
    -- =====================================

    -- Customers without orders
    SELECT 
        c.customer_id,
        c.customer_name
    FROM customers c
    LEFT JOIN orders o 
        ON o.customer_id = c.customer_id
    WHERE o.customer_id IS NULL;

    -- Orders without order items
    SELECT 
        o.order_id
    FROM orders o
    LEFT JOIN order_items oi 
        ON o.order_id = oi.order_id
    WHERE oi.order_id IS NULL;

    -- Order items with missing products
    SELECT 
        oi.product_id
    FROM order_items oi
    LEFT JOIN products p 
        ON oi.product_id = p.product_id
    WHERE p.product_id IS NULL;

    -- =====================================
    -- Invalid & Missing Data Checks
    -- =====================================

    -- Missing or blank customer names
    SELECT COUNT(*) AS missing_customer_names
    FROM customers
    WHERE customer_name IS NULL 
       OR customer_name = '';

    -- Invalid quantities
    SELECT *
    FROM order_items
    WHERE quantity <= 0;

    -- Invalid pricing (selling price <= cost price)
    SELECT *
    FROM products
    WHERE selling_price <= cost_price;

    -- =====================================
    -- Duplicate Detection
    -- =====================================

    -- Duplicate orders
    SELECT 
        order_id,
        COUNT(*) AS order_count
    FROM orders
    GROUP BY order_id
    HAVING COUNT(*) > 1;

    -- Duplicate order items (same order & product)
    SELECT 
        order_id,
        product_id,
        COUNT(*) AS item_count
    FROM order_items
    GROUP BY order_id, product_id
    HAVING COUNT(*) > 1;

    -- Duplicate customers
    SELECT 
        customer_id,
        COUNT(*) AS customer_count
    FROM customers
    GROUP BY customer_id
    HAVING COUNT(*) > 1;

    -- =====================================
    -- Customer Activity Validation
    -- =====================================

    SELECT 
        customer_id,
        COUNT(order_id) AS total_orders
    FROM orders
    GROUP BY customer_id
    ORDER BY total_orders DESC;

    -- =====================================
    -- Products Never Sold
    -- =====================================

    SELECT 
        p.product_id,
        p.product_name
    FROM products p
    LEFT JOIN order_items oi 
        ON p.product_id = oi.product_id
    WHERE oi.product_id IS NULL;

END $$

DELIMITER ;

