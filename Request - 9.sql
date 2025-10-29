WITH cte AS(
	SELECT c.channel, ROUND(SUM(gross_price_total/1000000),2) AS gross_sales_mln
	FROM gdb0041.gross_sales s
	JOIN dim_customer c
	ON c.customer_code = s.customer_code
	GROUP BY channel
),
cte2 AS(
	SELECT round(sum(gross_price_total/1000000),2) AS total_sales 
	FROM gross_sales
)

SELECT channel,gross_sales_mln, (gross_sales_mln*100/total_sales) AS percentage 
FROM cte 
JOIN cte2 