with ratings as (
    select Distinct user_id from {{ref('src_rating')}}
),

tags as (
    select distinct user_id from {{ref('src_tag')}}
)

SELECT DISTINCT user_id
from (
    SELECT * FROM ratings
    union 
    SELECT * FROM tags
)