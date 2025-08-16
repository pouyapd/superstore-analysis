-- 1) counts
SELECT COUNT(*) AS orders_count FROM orders;
SELECT COUNT(*) AS returns_count FROM returns;
SELECT COUNT(*) AS users_count FROM users;

-- 2) totals
SELECT SUM(sales) AS total_sales, SUM(profit) AS total_profit FROM orders;

-- 3) monthly trend
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month,
       SUM(sales) AS total_sales, SUM(profit) AS total_profit
FROM orders
GROUP BY month
ORDER BY month;

-- 4) returned orders details
SELECT o.order_id, o.order_date, o.customer_id, o.product_name, o.product_category,
       o.sales, o.profit, r.status
FROM orders o
JOIN returns r ON o.order_id = r.order_id
WHERE r.status = 'Returned'
LIMIT 50;

-- 5) lost profit due to returns
SELECT SUM(o.profit) AS lost_profit
FROM orders o
JOIN returns r ON o.order_id = r.order_id
WHERE r.status = 'Returned';
