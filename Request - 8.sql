SELECT get_fiscal_quarter(date) AS quarter,
SUM(sold_quantity) AS total_sold_quantity 
FROM gross_sales
WHERE fiscal_year = "2020"
GROUP BY quarter