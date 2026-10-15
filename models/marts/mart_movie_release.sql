{{ config(materialized = 'table')}}

WITH fct_ratings as (
    SELECT * FROM {{ ref('fct_rating')}}
),
seed_dates as (
    SELECT * FROM {{ ref('seed_movie_release_date')}}
)
SELECT 
   f.*,
   CASE 
      WHEN d.release_date IS NULL THEN 'unkhown'
      else 'Known'
   END AS RELEASE_INFO_AVAILABLE
FROM fct_rating f
left join seed_dates d
on f.movie_id = d.movie_id