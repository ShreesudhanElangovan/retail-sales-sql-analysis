DROP PROCEDURE IF EXISTS sp_create_retail_store_schema;
DELIMITER $$

CREATE PROCEDURE sp_create_retail_store_schema()
BEGIN
    -- Drop tables in correct dependency order
    DROP TABLE IF EXISTS order_items;
    DROP TABLE IF EXISTS orders;
    DROP TABLE IF EXISTS products;
    DROP TABLE IF EXISTS customers;

    -- ============================
    -- Customers
    -- ============================
    CREATE TABLE customers (
        customer_id INT PRIMARY KEY,
        customer_name VARCHAR(100) NOT NULL,
        country VARCHAR(50) NOT NULL,
        signup_date DATE NOT NULL
    );

    -- ============================
    -- Products
    -- ============================
    CREATE TABLE products (
        product_id INT PRIMARY KEY,
        product_name VARCHAR(150) NOT NULL,
        category VARCHAR(50) NOT NULL,
        cost_price DECIMAL(10,2) NOT NULL,
        selling_price DECIMAL(10,2) NOT NULL,
        CHECK (selling_price > cost_price)
    );

    -- ============================
    -- Orders
    -- ============================
    CREATE TABLE orders (
        order_id INT PRIMARY KEY,
        customer_id INT NOT NULL,
        order_date DATE NOT NULL,
        region VARCHAR(50) NOT NULL,
        CONSTRAINT fk_orders_customer
            FOREIGN KEY (customer_id)
            REFERENCES customers(customer_id)
    );

    -- ============================
    -- Order Items
    -- ============================
    CREATE TABLE order_items (
        order_item_id INT PRIMARY KEY,
        order_id INT NOT NULL,
        product_id INT NOT NULL,
        quantity INT NOT NULL CHECK (quantity > 0),
        discount DECIMAL(5,2) DEFAULT 0 CHECK (discount >= 0),
        CONSTRAINT fk_order_items_order
            FOREIGN KEY (order_id)
            REFERENCES orders(order_id),
        CONSTRAINT fk_order_items_product
            FOREIGN KEY (product_id)
            REFERENCES products(product_id)
    );

    -- ============================
    -- Indexes
    -- ============================
    CREATE INDEX idx_orders_customer ON orders(customer_id);
    CREATE INDEX idx_orders_date ON orders(order_date);
    CREATE INDEX idx_order_items_order ON order_items(order_id);
    CREATE INDEX idx_order_items_product ON order_items(product_id);

END $$

DELIMITER ;
