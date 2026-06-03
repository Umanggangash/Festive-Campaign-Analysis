-- FESTIVE CAMPAIGN ANALYSIS PROJECT
-- Tools: SQL | Power BI | Excel
-- Author: Umang Singh

USE festive_campaign_analysis;
-- SECTION 1 : DATA OVERVIEW

SHOW TABLES;

SELECT * FROM sales_transactions LIMIT 10;
SELECT * FROM products LIMIT 10;
SELECT * FROM customers LIMIT 10;
SELECT * FROM stores LIMIT 10;

-- SECTION 2 : EXECUTIVE KPI ANALYSIS

-- Total Revenue
SELECT
ROUND(SUM(Revenue),2) AS Total_Revenue
FROM sales_transactions;

-- Total Orders
SELECT
COUNT(Transaction_ID) AS Total_Orders
FROM sales_transactions;

-- Total Customers
SELECT
COUNT(DISTINCT Customer_ID) AS Total_Customers
FROM sales_transactions;

-- Average Order Value
SELECT
ROUND(
SUM(Revenue) / COUNT(Transaction_ID),
2
) AS Average_Order_Value
FROM sales_transactions;

-- Average Revenue Per Customer
SELECT
ROUND(
SUM(Revenue) / COUNT(DISTINCT Customer_ID),
2
) AS Revenue_Per_Customer
FROM sales_transactions;

-- SECTION 3 : FESTIVAL PERFORMANCE ANALYSIS

-- Revenue By Festival
SELECT
Festival_Name,
ROUND(SUM(Revenue),2) AS Revenue
FROM sales_transactions
GROUP BY Festival_Name
ORDER BY Revenue DESC;

-- Orders By Festival
SELECT
Festival_Name,
COUNT(Transaction_ID) AS Orders
FROM sales_transactions
GROUP BY Festival_Name
ORDER BY Orders DESC;

-- Average Revenue By Festival
SELECT
Festival_Name,
ROUND(AVG(Revenue),2) AS Avg_Revenue
FROM sales_transactions
GROUP BY Festival_Name
ORDER BY Avg_Revenue DESC;

-- Revenue Growth Compared To Normal Day
SELECT
Festival_Name,
ROUND(AVG(Revenue),2) AS Avg_Revenue
FROM sales_transactions
GROUP BY Festival_Name
ORDER BY Avg_Revenue DESC;

-- SECTION 4 : PRODUCT ANALYSIS

-- Top 10 Products
SELECT
p.Product_Name,
ROUND(SUM(s.Revenue),2) AS Revenue
FROM sales_transactions s
JOIN products p
ON s.Product_ID = p.Product_ID
GROUP BY p.Product_Name
ORDER BY Revenue DESC
LIMIT 10;

-- Revenue By Category
SELECT
p.Category,
ROUND(SUM(s.Revenue),2) AS Revenue
FROM sales_transactions s
JOIN products p
ON s.Product_ID = p.Product_ID
GROUP BY p.Category
ORDER BY Revenue DESC;

-- Revenue By Brand
SELECT
p.Brand,
ROUND(SUM(s.Revenue),2) AS Revenue
FROM sales_transactions s
JOIN products p
ON s.Product_ID = p.Product_ID
GROUP BY p.Brand
ORDER BY Revenue DESC;

-- Average Product Revenue
SELECT
p.Product_Name,
ROUND(AVG(s.Revenue),2) AS Avg_Revenue
FROM sales_transactions s
JOIN products p
ON s.Product_ID = p.Product_ID
GROUP BY p.Product_Name
ORDER BY Avg_Revenue DESC
LIMIT 10;

-- SECTION 5 : CUSTOMER ANALYSIS

-- Revenue By Gender
SELECT
c.Gender,
ROUND(SUM(s.Revenue),2) AS Revenue
FROM sales_transactions s
JOIN customers c
ON s.Customer_ID = c.Customer_ID
GROUP BY c.Gender
ORDER BY Revenue DESC;

-- Revenue By Age Group
SELECT
c.Age_Group,
ROUND(SUM(s.Revenue),2) AS Revenue
FROM sales_transactions s
JOIN customers c
ON s.Customer_ID = c.Customer_ID
GROUP BY c.Age_Group
ORDER BY Revenue DESC;

-- Revenue By Loyalty Status
SELECT
c.Loyalty_Status,
ROUND(SUM(s.Revenue),2) AS Revenue
FROM sales_transactions s
JOIN customers c
ON s.Customer_ID = c.Customer_ID
GROUP BY c.Loyalty_Status
ORDER BY Revenue DESC;

-- Customer Count By Age Group
SELECT
Age_Group,
COUNT(*) AS Customers
FROM customers
GROUP BY Age_Group
ORDER BY Customers DESC;

-- Customer Count By Loyalty Status
SELECT
Loyalty_Status,
COUNT(*) AS Customers
FROM customers
GROUP BY Loyalty_Status
ORDER BY Customers DESC;

-- SECTION 6 : REGIONAL ANALYSIS

-- Revenue By State
SELECT
st.State,
ROUND(SUM(s.Revenue),2) AS Revenue
FROM sales_transactions s
JOIN stores st
ON s.Store_ID = st.Store_ID
GROUP BY st.State
ORDER BY Revenue DESC;

-- Revenue By City
SELECT
st.City,
ROUND(SUM(s.Revenue),2) AS Revenue
FROM sales_transactions s
JOIN stores st
ON s.Store_ID = st.Store_ID
GROUP BY st.City
ORDER BY Revenue DESC;

-- Revenue By Region
SELECT
st.Region,
ROUND(SUM(s.Revenue),2) AS Revenue
FROM sales_transactions s
JOIN stores st
ON s.Store_ID = st.Store_ID
GROUP BY st.Region
ORDER BY Revenue DESC;

-- SECTION 7 : STORE PERFORMANCE ANALYSIS

-- Top Performing Stores
SELECT
st.Store_ID,
st.City,
ROUND(SUM(s.Revenue),2) AS Revenue
FROM sales_transactions s
JOIN stores st
ON s.Store_ID = st.Store_ID
GROUP BY st.Store_ID, st.City
ORDER BY Revenue DESC
LIMIT 10;

-- Revenue By Store Type
SELECT
Store_Type,
ROUND(SUM(s.Revenue),2) AS Revenue
FROM sales_transactions s
JOIN stores st
ON s.Store_ID = st.Store_ID
GROUP BY Store_Type
ORDER BY Revenue DESC;

-- SECTION 8 : PAYMENT MODE ANALYSIS

-- Revenue By Payment Mode
SELECT
Payment_Mode,
ROUND(SUM(Revenue),2) AS Revenue
FROM sales_transactions
GROUP BY Payment_Mode
ORDER BY Revenue DESC;

-- Orders By Payment Mode
SELECT
Payment_Mode,
COUNT(Transaction_ID) AS Orders
FROM sales_transactions
GROUP BY Payment_Mode
ORDER BY Orders DESC;

-- SECTION 9 : DISCOUNT ANALYSIS

-- Average Discount
SELECT
ROUND(AVG(Discount),2) AS Average_Discount
FROM sales_transactions;

-- Discount By Festival
SELECT
Festival_Name,
ROUND(AVG(Discount),2) AS Avg_Discount
FROM sales_transactions
GROUP BY Festival_Name
ORDER BY Avg_Discount DESC;

-- Revenue By Discount
SELECT
Discount,
ROUND(SUM(Revenue),2) AS Revenue
FROM sales_transactions
GROUP BY Discount
ORDER BY Revenue DESC;

-- SECTION 10 : SALES TREND ANALYSIS

-- Daily Revenue Trend
SELECT
Date,
ROUND(SUM(Revenue),2) AS Revenue
FROM sales_transactions
GROUP BY Date
ORDER BY Date;

-- Monthly Revenue Trend
SELECT
MONTH(Date) AS Month_Number,
ROUND(SUM(Revenue),2) AS Revenue
FROM sales_transactions
GROUP BY MONTH(Date)
ORDER BY Month_Number;

-- SECTION 11 : BUSINESS INSIGHTS

-- Highest Revenue Festival
SELECT
Festival_Name,
ROUND(SUM(Revenue),2) AS Revenue
FROM sales_transactions
GROUP BY Festival_Name
ORDER BY Revenue DESC
LIMIT 1;

-- Best Selling Product
SELECT
p.Product_Name,
ROUND(SUM(s.Revenue),2) AS Revenue
FROM sales_transactions s
JOIN products p
ON s.Product_ID = p.Product_ID
GROUP BY p.Product_Name
ORDER BY Revenue DESC
LIMIT 1;

-- Best Product Category
SELECT
p.Category,
ROUND(SUM(s.Revenue),2) AS Revenue
FROM sales_transactions s
JOIN products p
ON s.Product_ID = p.Product_ID
GROUP BY p.Category
ORDER BY Revenue DESC
LIMIT 1;

-- Highest Revenue State
SELECT
st.State,
ROUND(SUM(s.Revenue),2) AS Revenue
FROM sales_transactions s
JOIN stores st
ON s.Store_ID = st.Store_ID
GROUP BY st.State
ORDER BY Revenue DESC
LIMIT 1;

-- Highest Revenue City
SELECT
st.City,
ROUND(SUM(s.Revenue),2) AS Revenue
FROM sales_transactions s
JOIN stores st
ON s.Store_ID = st.Store_ID
GROUP BY st.City
ORDER BY Revenue DESC
LIMIT 1;

-- Preferred Payment Mode
SELECT
Payment_Mode,
COUNT(*) AS Orders
FROM sales_transactions
GROUP BY Payment_Mode
ORDER BY Orders DESC
LIMIT 1;

-- Most Valuable Customer Segment
SELECT
c.Loyalty_Status,
ROUND(SUM(s.Revenue),2) AS Revenue
FROM sales_transactions s
JOIN customers c
ON s.Customer_ID = c.Customer_ID
GROUP BY c.Loyalty_Status
ORDER BY Revenue DESC
LIMIT 1;

-- END OF PROJECT
