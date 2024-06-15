SELECT category, product, total_spend
FROM (SELECT category,
              product,
              SUM(spend) "total_spend",
              ROW_NUMBER() OVER(PARTITION BY category
                                ORDER BY SUM(spend) DESC) "row_num"
      FROM product_spend
      WHERE TO_CHAR(transaction_date, 'YYYY')='2022'
      GROUP BY category, product) T
WHERE row_num<=2
