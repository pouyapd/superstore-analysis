-- monthly sales by region
CREATE OR REPLACE VIEW vw_monthly_sales_region AS
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month,
       region,
       SUM(sales) AS total_sales,
       SUM(profit) AS total_profit,
       COUNT(*) AS orders_count
FROM orders
GROUP BY month, region;

-- returns summary
CREATE OR REPLACE VIEW vw_returns_summary AS
SELECT r.order_id, o.order_date, o.customer_id, o.customer_name, o.product_category,
       o.sales, o.profit, r.status
FROM returns r
LEFT JOIN orders o ON r.order_id = o.order_id;

-- lost profit per category
CREATE OR REPLACE VIEW vw_lost_profit_category AS
SELECT o.product_category,
       SUM(o.profit) AS lost_profit,
       COUNT(r.order_id) AS return_count
FROM orders o
JOIN returns r ON o.order_id = r.order_id
WHERE r.status = 'Returned'
GROUP BY o.product_category;
