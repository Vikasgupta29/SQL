SELECT card_name, MAX(sum)-MIN(sum) "difference"
FROM (
      SELECT card_name, issue_month, sum(issued_amount)
      FROM monthly_cards_issued
      GROUP BY card_name, issue_month) T
GROUP BY card_name
ORDER BY difference DESC
