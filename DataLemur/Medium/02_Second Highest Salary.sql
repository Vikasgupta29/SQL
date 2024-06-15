SELECT salary "second_highest_salary"
FROM employee
GROUP BY salary
ORDER BY salary DESC
LIMIT 1
OFFSET 1
