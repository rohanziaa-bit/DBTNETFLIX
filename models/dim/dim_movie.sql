with src_movies as (
    SELECT * FROM {{ ref('stc_movies')}}
)

SELECT
   movie_id,
   INITCAP(TRIM(title)) as movie_title,
   SPLIT(genres,'|') as genre_arry,
   genres
from stc_movies