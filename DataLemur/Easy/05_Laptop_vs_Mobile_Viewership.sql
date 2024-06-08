select 
count(*) filter (where device_type='laptop') laptop_views,
count(*) filter (where device_type in ('tablet','phone')) mobile_views
from viewership
