SELECT D.employee_id, 
CASE 
    WHEN SUM(D.deal_size)>SQ.quota THEN 'yes'
    ELSE 'no'
END "made_quota"
FROM deals D
JOIN sales_quotas SQ
ON D.employee_id=SQ.employee_id
GROUP BY D.employee_id, SQ.quota
ORDER BY D.employee_id
