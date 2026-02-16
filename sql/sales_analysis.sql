-- Create table
CREATE TABLE sales (
OrderID VARCHAR(20),
OrderDate DATE,
CustomerID VARCHAR(20),
ProductName VARCHAR(50),
Category VARCHAR(50),
Quantity INT,
UnitPrice DECIMAL(10,2),
DiscountPercent INT,
TotalAmount DECIMAL(10,2),
Region VARCHAR(20),
PaymentMethod VARCHAR(50)
);

-- 1. Total number of orders
SELECT COUNT(*) AS total_orders
FROM sales;

-- 2. Total revenue
SELECT SUM(TotalAmount) AS total_revenue
FROM sales;

-- 3. Top 5 highest value orders
SELECT *
FROM sales
ORDER BY TotalAmount DESC
LIMIT 5;

-- 4. Orders from North region
SELECT *
FROM sales
WHERE Region = 'North';

-- 5. Sales by category
SELECT
Category,
SUM(TotalAmount) AS total_sales
FROM sales
GROUP BY Category
ORDER BY total_sales DESC;

-- 6. Top 5 customers by spending
SELECT
CustomerID,
SUM(TotalAmount) AS total_spent
FROM sales
GROUP BY CustomerID
ORDER BY total_spent DESC
LIMIT 5;

-- 7. Monthly sales trend
SELECT
DATE_FORMAT(OrderDate, '%Y-%m') AS month,
SUM(TotalAmount) AS monthly_sales
FROM sales
GROUP BY month
ORDER BY month;

-- 8. Rank products by revenue
SELECT
ProductName,
SUM(TotalAmount) AS revenue,
RANK() OVER (ORDER BY SUM(TotalAmount) DESC) AS rank_position
FROM sales
GROUP BY ProductName;

-- 9. Average order value per region
SELECT
Region,
AVG(TotalAmount) AS avg_order_value
FROM sales
GROUP BY Region;

-- 10. High value customers (spent > 200000)
SELECT
CustomerID,
SUM(TotalAmount) AS total_spent
FROM sales
GROUP BY CustomerID
HAVING SUM(TotalAmount) > 200000;

