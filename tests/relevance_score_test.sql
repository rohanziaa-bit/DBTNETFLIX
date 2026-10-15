-- SELECT
--   movie_id,
--   tag_id,
--   relevance_score
-- from {{ ref('FCT_GENOME_SCORE.SQL')}}

{{ no_nulls_in_columns(ref('fct_genome_score'))}}