CREATE DATABASE P1_db;
USE P1_db;

CREATE TABLE sales_data (
order_id INT,
order_date DATE,
city VARCHAR(100),
product VARCHAR(100),
category VARCHAR(100),
quantity INT,
price INT
);

INSERT INTO sales_data VALUES
(1001,'2025-01-10','Pune','Laptop','Electronics',2,50000),
(1002,'2025-01-11','Mumbai','Mobile','Electronics',3,20000),
(1003,'2025-01-11','Pune','Headphones','Accessories',5,2000),
(1004,'2025-01-12','Nagpur','Keyboard','Accessories',4,1500),
(1005,'2025-01-13','Mumbai','Laptop','Electronics',1,50000),
(1006,'2025-01-14','Pune','Mobile','Electronics',2,20000),
(1007,'2025-01-15','Nagpur','Headphones','Accessories',3,2000),
(1008,'2025-01-16','Mumbai','Keyboard','Accessories',5,1500),
(1009,'2025-01-17','Pune','Laptop','Electronics',1,50000),
(1010,'2025-01-18','Nagpur','Mobile','Electronics',4,20000),
(1011,'2025-01-19','Mumbai','Headphones','Accessories',6,2000),
(1012,'2025-01-20','Pune','Keyboard','Accessories',3,1500),
(1013,'2025-01-21','Nagpur','Laptop','Electronics',2,50000),
(1014,'2025-01-22','Mumbai','Mobile','Electronics',1,20000),
(1015,'2025-01-23','Pune','Headphones','Accessories',4,2000),
(1016,'2025-01-24','Nagpur','Keyboard','Accessories',2,1500),
(1017,'2025-01-25','Mumbai','Laptop','Electronics',3,50000),
(1018,'2025-01-26','Pune','Mobile','Electronics',5,20000),
(1019,'2025-01-27','Nagpur','Headphones','Accessories',2,2000),
(1020,'2025-01-28','Mumbai','Keyboard','Accessories',6,1500),
(1021,'2025-01-29','Pune','Laptop','Electronics',2,50000),
(1022,'2025-01-30','Nagpur','Mobile','Electronics',3,20000),
(1023,'2025-01-31','Mumbai','Headphones','Accessories',4,2000),
(1024,'2025-02-01','Pune','Keyboard','Accessories',5,1500),
(1025,'2025-02-02','Nagpur','Laptop','Electronics',1,50000);

-- 1. Display all records
SELECT * FROM sales_data;

-- 2. Total revenue
SELECT SUM(quantity * price) AS total_revenue FROM sales_data;

-- 3. Top-selling product
SELECT product, SUM(quantity) AS total_qty
FROM sales_data
GROUP BY product
ORDER BY total_qty DESC
LIMIT 1;

-- 4. City-wise revenue
SELECT city, SUM(quantity * price) AS revenue
FROM sales_data
GROUP BY city;

-- 5. Category-wise revenue
SELECT category, SUM(quantity * price) AS revenue
FROM sales_data
GROUP BY category;

-- 6. Highest value order
SELECT *, (quantity * price) AS total
FROM sales_data
ORDER BY total DESC
LIMIT 1;

-- 7. Average price
SELECT AVG(price) AS avg_price FROM sales_data;
