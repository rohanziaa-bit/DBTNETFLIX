
{% snapshot snap_tags %}

{{
    config(
        target_schema='snapshots',
        unique_key='raw_key',
        strategy='timestamp',
        updated_at='tag_timestamp',
        invalidate_hard_deletes=True
    )
}}

SELECT
    {{ dbt_utils.generate_surrogate_key(['user_id', 'movie_id', 'tag']) }} AS raw_key,
    user_id,
    movie_id,
    tag,
    CAST(tag_timestamp AS TIMESTAMP_NTZ) AS tag_timestamp
FROM {{ ref('src_tag') }}
LIMIT 100

{% endsnapshot %}
