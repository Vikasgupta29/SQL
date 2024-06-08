SELECT manufacturer, CONCAT('$',ROUND(SUM(total_sales)/1000000),' million') "sales_mil"
FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY ROUND(SUM(total_sales)/1000000) DESC, manufacturer DESC
