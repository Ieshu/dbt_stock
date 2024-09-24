WITH staged_data AS (
    SELECT
        deal_id,
        deal_amount,
        deal_stage,
        close_date,
        create_date
    FROM
        {{ ref('stg_stock') }}  -- Reference the staged model
)

-- Use the deal_metrics macro to calculate aggregated metrics
{{ calculate_deal_metrics('staged_data') }}
