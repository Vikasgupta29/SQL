SELECT transaction_date, user_id, COUNT(*)
FROM (SELECT product_id, user_id, spend, transaction_date,
              DENSE_RANK() OVER(PARTITION BY user_id ORDER BY transaction_date DESC) "rnk"
      FROM user_transactions) T
WHERE rnk=1
GROUP BY transaction_date, user_id
