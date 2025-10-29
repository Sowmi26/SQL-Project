SELECT monthname(date) AS month, fiscal_year AS year, CONCAT(ROUND(SUM(gross_price_total)/1000000,2),' M') AS gross_sales_amount 
FROM gdb0041.gross_sales
WHERE customer = "Atliq Exclusive"
GROUP BY month, year;
