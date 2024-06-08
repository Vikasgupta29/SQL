SELECT  TO_CHAR(submit_date::date, 'MM')::int "mnth", product_id "product", ROUND(AVG(stars),2) "avg_stars"
FROM reviews
GROUP BY product_id, TO_CHAR(submit_date::date, 'MM')
ORDER BY mnth, product
