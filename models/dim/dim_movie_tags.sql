
{{
    config(
        materialized = 'ephemeral'
    )
}}

WITH movies AS (
    SELECT * FROM {{ ref("dim_movie") }}
),
tags AS (
    SELECT * FROM {{ ref("dim_genome_tag") }}
),
scores AS (
    SELECT * FROM {{ ref("FCT_GENOME_SCORE") }}
)

SELECT
    m.movie_id,
    m.movie_title,
    m.genres,
    t.tag_name,
    s.RELAVANCE_SCORE
FROM movies m
LEFT JOIN scores s
    ON m.movie_id = s.movie_id
LEFT JOIN tags t
    ON t.tag_id = s.tag_id
