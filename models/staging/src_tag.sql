{{ config(materialized = 'table')}}
with raw_tags as (
    SELECT * FROM MOVIELENS.RAW.RAW_TAGS
)

SELECT
    userId as user_id,
    movieId as movie_id,
    tag,
    TO_TIMESTAMP_LTZ(timestamp) as tag_Timestamp
from raw_tags