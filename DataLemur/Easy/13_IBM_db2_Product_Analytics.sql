SELECT unique_queries, COUNT(employee_id) "employee_count"
FROM(
      SELECT E.employee_id, COALESCE(COUNT(DISTINCT query_id),0) "unique_queries"
      FROM employees E
      LEFT JOIN queries Q
      ON E.employee_id=Q.employee_id
      AND DATE(query_starttime) BETWEEN '2023-07-01' AND '2023-09-30'
      GROUP BY E.employee_id) T
GROUP BY unique_queries
ORDER BY unique_queries

