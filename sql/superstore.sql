-- create_schema_and_tables.sql
-- Create database/schema and tables for the SuperStore dataset

-- 1) Create schema
DROP DATABASE IF EXISTS superstore_db;
CREATE DATABASE superstore_db
CHARACTER SET = 'utf8mb4'
COLLATE = 'utf8mb4_unicode_ci';
USE superstore_db;

-- 2) Orders table
CREATE TABLE orders (
  row_id INT PRIMARY KEY,  -- row_id exists in Superstore as unique
  order_priority VARCHAR(50),
  discount DECIMAL(10,4),
  unit_price DECIMAL(12,2),
  shipping_cost DECIMAL(12,2),
  customer_id VARCHAR(100),
  customer_name VARCHAR(255),
  ship_mode VARCHAR(100),
  customer_segment VARCHAR(100),
  product_category VARCHAR(150),
  product_sub_category VARCHAR(150),
  product_container VARCHAR(150),
  product_name VARCHAR(300),
  product_base_margin DECIMAL(10,4),
  country VARCHAR(100),
  region VARCHAR(100),
  state_or_province VARCHAR(150),
  city VARCHAR(150),
  postal_code VARCHAR(50),
  order_date DATE,
  ship_date DATE,
  profit DECIMAL(14,2),
  quantity INT,
  sales DECIMAL(14,2),
  order_id VARCHAR(100),
  total_sales DECIMAL(14,2)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 3) Returns table
CREATE TABLE returns (
  return_id INT AUTO_INCREMENT PRIMARY KEY,
  order_id VARCHAR(100),
  status VARCHAR(100),
  reason TEXT,
  return_date DATE,
  INDEX idx_returns_orderid (order_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 4) Users table
CREATE TABLE users (
  customer_id VARCHAR(100) PRIMARY KEY,
  customer_name VARCHAR(255),
  customer_segment VARCHAR(100),
  country VARCHAR(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 5) Helpful indexes
CREATE INDEX idx_orders_order_id ON orders(order_id);
CREATE INDEX idx_orders_customer ON orders(customer_id);
CREATE INDEX idx_orders_order_date ON orders(order_date);