SELECT age_bucket,
        ROUND(SUM(time_spent) FILTER(WHERE activity_type='send')*100.0/SUM(time_spent),2) "send_perc",
        ROUND(SUM(time_spent) FILTER(WHERE activity_type='open')*100.0/SUM(time_spent),2) "open_perc"
FROM activities
JOIN age_breakdown
USING (user_id)
WHERE activity_type IN ('send', 'open') 
GROUP BY age_bucket
