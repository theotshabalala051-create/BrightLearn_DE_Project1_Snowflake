CREATE DATABASE IF NOT EXISTS de_project1;
CREATE SCHEMA IF NOT EXISTS de_project1.raw;
USE DATABASE de_project1;
USE SCHEMA raw;

CREATE TABLE IF NOT EXISTS customers (
    customer_id     STRING,
    customer_name   STRING,
    email           STRING,
    province        STRING,
    signup_date     DATE
);

CREATE TABLE IF NOT EXISTS products (
product_id      VARCHAR,
product_name    VARCHAR,
category        VARCHAR,
unit_price      NUMBER(10,2)
);

CREATE TABLE IF NOT EXISTS orders (
order_id        VARCHAR,
customer_id     VARCHAR,
product_id      VARCHAR,
order_date      DATE,
quantity        INT
);

SELECT 'customers' AS table_name, COUNT(*) AS row_count FROM customers
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'orders', COUNT(*) FROM orders;

SELECT
    o.order_id,
    c.customer_name,
    p.product_name,
    p.category,
    o.quantity,
    p.unit_price,
    o.quantity * p.unit_price AS line_revenue
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id;

SELECT
    c.customer_name,
    SUM(o.quantity * p.unit_price) AS total_revenue
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id
GROUP BY c.customer_name
ORDER BY total_revenue DESC;

SELECT
    p.category,
    SUM(o.quantity * p.unit_price) AS total_revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;

SELECT
    c.customer_name,
    SUM(o.quantity * p.unit_price) AS total_revenue
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id
GROUP BY c.customer_name
ORDER BY total_revenue DESC
LIMIT 5;

