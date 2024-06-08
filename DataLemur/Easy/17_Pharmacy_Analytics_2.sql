SELECT manufacturer, COUNT(drug) "drug_count", abs(sum(total_sales)-sum(cogs)) "total_loss"
FROM pharmacy_sales
WHERE total_sales-cogs<0
GROUP BY manufacturer
ORDER BY total_loss DESC
