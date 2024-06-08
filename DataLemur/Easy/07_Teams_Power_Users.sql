SELECT sender_id, COUNT(message_id) "message_count"
FROM messages
where TO_CHAR(sent_date::date, 'MM-YYYY')='08-2022'
GROUP BY sender_id
ORDER BY message_count DESC
LIMIT 2
