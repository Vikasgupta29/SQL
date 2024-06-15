SELECT CASE 
            WHEN order_id=(SELECT COUNT(order_id) FROM orders) THEN order_id
            WHEN order_id%2=0 THEN order_id-1
            WHEN order_id%2!=0 THEN order_id+1
      END "corrected_order_id"
      , item
FROM orders
ORDER BY corrected_order_id
