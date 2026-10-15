WITH SRC_SCORE AS (
    SELECT * FROM {{ref('src_genome_score')}}
)

SELECT 
   movie_id,
   tag_id,
   round(RELEVANCE,4) AS RELAVANCE_SCORE
FROM SRC_SCORE
WHERE RELEVANCE > 0