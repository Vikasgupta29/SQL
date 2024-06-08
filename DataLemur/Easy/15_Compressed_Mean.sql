SELECT ROUND(
              SUM(item_count::decimal*order_occurrences)/
              SUM(order_occurrences)
              ,1) "mean"
FROM items_per_order
