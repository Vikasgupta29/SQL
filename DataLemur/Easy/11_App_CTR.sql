SELECT app_id,
ROUND(
      100.0*
      COUNT(*) filter(where event_type='click')/
      COUNT(*) filter(where event_type='impression')
      ,2) "ctr"
FROM events
WHERE EXTRACT(YEAR FROM timestamp)='2022'
GROUP BY app_id
