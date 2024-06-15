SELECT item_count "mode"
FROM items_per_order
WHERE order_occurrences=(SELECT order_occurrences
                        FROM items_per_order
                        ORDER BY order_occurrences DESC
                        LIMIT 1)
