select count "tweet_bucket",count(*) "user_num" 
from (select count(tweet_id) 
      from tweets 
      where to_char(tweet_date::timestamp, 'DD Mon YYYY HH:MI:SSPM') like '%2022%' 
      group by user_id) T
group by count
