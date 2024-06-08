SELECT city, count(user_id) "total_orders"
FROM trades
JOIN users
USING (user_id)
WHERE status='Completed'
GROUP BY city
ORDER BY total_orders DESC
LIMIT 3
