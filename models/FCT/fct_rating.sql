{{
    config(
        materialized = 'incremental',
        on_schema_change = 'fail'
    )
}}

with src_ratings as (
    SELECT * FROM {{ref('src_rating')}}
)

SELECT
  user_id,
  movie_id,
  rating,
  rating_timestamp
from src_ratings
where rating is not null

{% if is_incremental() %}
    AND rating_timestamp > (
        SELECT MAX(rating_timestamp)
        FROM {{ this }}
    )
{% endif %}
