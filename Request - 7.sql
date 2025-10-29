SELECT c.customer_code, c.customer, ROUND(AVG(pre_invoice_discount_pct)*100,2) AS discount_pct 
FROM dim_customer c
JOIN fact_pre_invoice_deductions d
ON c.customer_code = d.customer_code
WHERE fiscal_year = 2021 AND c.market = "India"
GROUP BY c.customer_code, c.customer
ORDER BY discount_pct DESC
LIMIT 5;