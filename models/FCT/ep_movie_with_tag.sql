WITH fct_movie_w_tags as (
    SELECT * FROM {{ ref('dim_movie_tags')}}
)

SELECT * FROM fct_movie_w_tags