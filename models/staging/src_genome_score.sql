with raw_genome_scores as (
    SELECT * FROM MOVIELENS.RAW.RAW_GENOME_SCORES
)

SELECT
   movieId as movie_id,
   tagId as tag_id,
   relevance
from raw_genome_scores