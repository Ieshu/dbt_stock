{% macro calculate_deal_metrics(data_table) %}
    SELECT
        deal_stage,
        COUNT(deal_id) AS total_deals,
        SUM(deal_amount) AS total_amount,
        MIN(close_date) AS first_closed_deal,
        MAX(close_date) AS last_closed_deal
    FROM {{ data_table }}
    GROUP BY deal_stage
{% endmacro %}
