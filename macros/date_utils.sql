{% macro calculate_date_diff(start_date, end_date) %}
    {{ end_date }} - {{ start_date }}
{% endmacro %}

{% macro extract_month_year(date_col) %}
    CONCAT(EXTRACT(MONTH FROM {{ date_col }}), '-', EXTRACT(YEAR FROM {{ date_col }}))
{% endmacro %}
