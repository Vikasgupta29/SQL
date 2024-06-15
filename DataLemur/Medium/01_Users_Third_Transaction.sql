SELECT user_id, spend, transaction_date
FROM (SELECT *, 
      ROW_NUMBER()
      OVER(PARTITION BY user_id ORDER BY transaction_date) "row_num"
      FROM transactions) T
WHERE row_num=3
