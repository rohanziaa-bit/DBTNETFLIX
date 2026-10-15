WITH raw_movies as (
    select * from {{ source('netflix','r_movies')}}
)
SELECT
  movieId as movie_id,
  title,
  genres
from raw_movies  