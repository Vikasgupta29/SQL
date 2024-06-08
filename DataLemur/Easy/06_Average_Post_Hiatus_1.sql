select user_id, extract(day from max(post_date)-min(post_date)) "days_between"
from posts
where to_char(post_date::date, 'YYYY')='2021'
group by user_id
having count(*)>1
