SELECT ROUND(100.0*(COUNT(*) FILTER(WHERE ci.country_id!=ri.country_id))/
        COUNT(*),1) "international_calls_pct"
FROM phone_calls c
JOIN phone_info ci
ON c.caller_id=ci.caller_id
JOIN phone_info ri
ON c.receiver_id=ri.caller_id
