-- enable local_infile if server allows (may require server restart or config)
-- then run (adjust path to your CSV):
LOAD DATA LOCAL INFILE 'C:/Users/user/Desktop/superstore_analyse/orders_clean.csv'
INTO TABLE superstore_db.orders
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(row_id, order_priority, discount, unit_price, shipping_cost, customer_id, customer_name,
 ship_mode, customer_segment, product_category, product_sub_category, product_container,
 product_name, product_base_margin, country, region, state_or_province, city, postal_code,
 @order_date, @ship_date, profit, quantity, sales, order_id, total_sales)
SET order_date = STR_TO_DATE(@order_date, '%Y-%m-%d'),
    ship_date  = STR_TO_DATE(@ship_date, '%Y-%m-%d');
