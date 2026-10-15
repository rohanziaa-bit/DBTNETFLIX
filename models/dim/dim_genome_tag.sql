WITH src_tags as (
    SELECT * FROM {{ref('src_geome_tag')}}
)

SELECT 
   tag_id,
   INITCAP(TRIM(tag)) as tag_name
from src_tags