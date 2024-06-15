SELECT department_name, name, salary
from(
      SELECT department_id, name, salary,
              DENSE_RANK() OVER(PARTITION BY department_id
                                ORDER BY salary DESC) "rnk"
      FROM employee) e
JOIN department d
ON e.department_id=d.department_id
WHERE rnk<=3
ORDER BY d.department_id, salary DESC, name;
