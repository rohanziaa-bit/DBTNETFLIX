{% macro no_nulls_in_columns(model) %}
  SELECT * FROM {{ model }} where
   {% for col in dbt_utils.get_filtered_columns_in_relation(from=model) %}
      {{col.column}} is null or
      {% endfor %}
      FALSE
{% endmacro %}
