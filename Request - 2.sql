WITH unique_products_2020 AS(
	SELECT 
	count(distinct(product_code)) AS unique_products_2020
    FROM fact_sales_monthly
	WHERE fiscal_year= "2020"
),

unique_products_2021 AS(
	SELECT
	count(distinct(product_code)) AS unique_products_2021
    FROM fact_sales_monthly
	WHERE fiscal_year= "2021"
)
SELECT *, ROUND((unique_products_2021-unique_products_2020)*100/unique_products_2020,2) AS pct_chg
FROM unique_products_2020 u0
JOIN unique_products_2021 u1

	