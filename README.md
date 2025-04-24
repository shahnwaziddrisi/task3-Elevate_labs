# task3-Elevate_labs

SQL Queries for Sales and People Data Analysis

This repository contains SQL queries for analyzing sales data and people information from two key tables: sales and people. The queries focus on basic data retrieval, joining tables, grouping, filtering, and calculating aggregates such as total and average sales.

Queries Explained

1. Select All Sales Data:
---------------------------
SELECT * FROM sales;

Retrieves all records from the sales table.

2. Select Sales Greater Than 8000:
-----------------------------------
SELECT * FROM sales
WHERE Amount > 8000
ORDER BY Amount DESC
LIMIT 5;

Fetches the top 5 highest sales with an amount greater than 8000.

3. Group Sales by Team:
------------------------
SELECT p.Team, SUM(s.Amount)
FROM sales s
JOIN people p ON p.SPID = s.SPID
GROUP BY p.Team;

Joins the sales and people tables and sums the Amount by each Team in the people table.

4. Left Join Sales with People and Aggregate:
---------------------------------------------
SELECT p.Salesperson, SUM(s.Amount) AS Total_Amount, AVG(s.Amount) AS Average_Amount
FROM people p
LEFT JOIN sales s ON s.SPID = p.SPID
GROUP BY p.Salesperson
ORDER BY Total_Amount DESC
LIMIT 3;

Retrieves the top 3 salespeople based on total sales using a left join, which includes people even if they have no sales.

5. Right Join Sales with Products:
-----------------------------------
SELECT pro.product, SUM(s.Amount) AS Total_sale
FROM products pro
RIGHT JOIN sales s ON s.PID = pro.PID
GROUP BY pro.product;

Aggregates total sales per product using a right join, ensuring all products are included, even if they have no sales.

6. Subquery to Calculate Team's Total Sales:
---------------------------------------------
SELECT Team, SUM(Amount) AS TotalSales
FROM (
    SELECT s.Amount, p.Team
    FROM sales s
    JOIN people p ON s.SPID = p.SPID
    WHERE s.Amount > 22000
) AS filtered_sales
GROUP BY Team;

Uses a subquery to filter sales greater than 22000 and then calculates the total sales by team.

7. View for Top 3 Salespersons Based on Total Sales:
----------------------------------------------------
CREATE VIEW top_salespersons AS
SELECT p.Salesperson, SUM(s.Amount) AS Total, AVG(s.Amount) AS Average
FROM people p
LEFT JOIN sales s ON s.SPID = p.SPID
GROUP BY p.Salesperson
ORDER BY Total DESC
LIMIT 3;

SELECT * FROM top_salespersons;

Creates a view to retrieve the top 3 salespeople based on total sales.

8. Indexes for Performance:
---------------------------
CREATE INDEX idx_sales_spid ON sales(SPID);
CREATE INDEX idx_sales_pid ON sales(PID);
CREATE INDEX idx_people_spid ON people(SPID);

Creates indexes on SPID and PID columns in sales and people tables to improve query performance.



