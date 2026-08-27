SELECT *
FROM ecommerce_sales_analysis
LIMIT 5;

ALTER TABLE Ecommerce_sales_analysis
ALTER COLUMN "Revenue"
TYPE numeric(10,2);

-- 1. Total Revenue

SELECT 
    ROUND(SUM("Revenue"), 2) AS total_revenue
FROM Ecommerce_sales_analysis;


-- 2. Total Orders

SELECT 
    COUNT(DISTINCT "InvoiceNo") AS total_orders
FROM Ecommerce_sales_analysis;


-- 3. Total Products

SELECT 
    COUNT(DISTINCT "StockCode") AS total_products
FROM Ecommerce_sales_analysis;


-- 4. Top Selling Products

SELECT
    "StockCode",
    "Description",
    SUM("Quantity") AS total_quantity_sold
FROM Ecommerce_sales_analysis
GROUP BY
    "StockCode",
    "Description"
ORDER BY total_quantity_sold DESC
LIMIT 10;


-- 5. Revenue By Product

SELECT
    "StockCode",
    "Description",
    ROUND(SUM("Revenue"), 2) AS total_revenue
FROM Ecommerce_sales_analysis
GROUP BY
    "StockCode",
    "Description"
ORDER BY total_revenue DESC
LIMIT 10;


-- 6. Country Wise Revenue

SELECT
    "Country",
    ROUND(SUM("Revenue"), 2) AS total_revenue
FROM ecommerce_sales_analysis
GROUP BY "Country"
ORDER BY total_revenue DESC;


-- 7. Monthly Revenue Trend

SELECT
    TO_CHAR("InvoiceDate", 'YYYY-MM') AS sales_month,
    ROUND(SUM("Revenue"), 2) AS monthly_revenue
FROM ecommerce_sales_analysis
GROUP BY sales_month
ORDER BY sales_month;


-- 8. Top Customers By Revenue

SELECT
    "CustomerID",
    ROUND(SUM("Revenue"), 2) AS total_spent
FROM ecommerce_sales_analysis
GROUP BY "CustomerID"
ORDER BY total_spent DESC
LIMIT 10;


-- 9. Average Order Value

SELECT
    ROUND(
        SUM("Revenue") / COUNT(DISTINCT "InvoiceNo"),
        2
    ) AS average_order_value
FROM ecommerce_sales_analysis;


-- 10. Average Quantity Per Order

SELECT
    ROUND(
        SUM("Quantity")::numeric / COUNT(DISTINCT "InvoiceNo"),
        2
    ) AS avg_items_per_order
FROM ecommerce_sales_analysis;


-- 11. Monthly Order Count

SELECT
    TO_CHAR("InvoiceDate", 'YYYY-MM') AS sales_month,
    COUNT(DISTINCT "InvoiceNo") AS total_orders
FROM ecommerce_sales_analysis
GROUP BY sales_month
ORDER BY sales_month;


-- 12. Product Performance Analysis

SELECT
    "StockCode",
    "Description",
    SUM("Quantity") AS total_quantity,
    ROUND(SUM("Revenue"), 2) AS total_revenue
FROM ecommerce_sales_analysis
GROUP BY
    "StockCode",
    "Description"
ORDER BY total_revenue DESC
LIMIT 20;

