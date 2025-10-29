WITH product_count_2020 AS(
	SELECT segment,
    COUNT(DISTINCT(p.product_code)) AS product_count_2020
	FROM dim_product p
	JOIN fact_sales_monthly s
	ON 
		p.product_code = s.product_code
	WHERE fiscal_year = "2020"
	GROUP BY segment
	ORDER BY product_count_2020 DESC
),

product_count_2021 AS(
	SELECT segment, COUNT(DISTINCT(p.product_code)) AS product_count_2021
	FROM dim_product p
	JOIN fact_sales_monthly s
	ON 
		p.product_code = s.product_code
	WHERE fiscal_year = "2021"
	GROUP BY segment
	ORDER BY product_count_2021 DESC
)

SELECT
	* ,
    (product_count_2021 - product_count_2020) AS difference
FROM product_count_2020 pc20
JOIN product_count_2021 pc21
USING(segment)
