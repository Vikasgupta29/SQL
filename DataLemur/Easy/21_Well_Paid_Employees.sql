SELECT DISTINCT E.employee_id, E.name "employee_name"
FROM employee E
JOIN employee M
ON E.manager_id=M.employee_id
AND E.salary>M.salary
