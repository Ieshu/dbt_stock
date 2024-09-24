WITH base AS (
    SELECT
        deal_id,
        amount::decimal AS deal_amount,
        deal_stage,
        close_date,
        create_date
    FROM
        {{ source('stock_warehouse', 'deals_fact') }}  -- Correct source reference
)
SELECT
    deal_id,
    deal_amount,
    deal_stage,
    close_date,
    create_date,
    {{ calculate_date_diff('create_date', 'close_date') }} AS deal_velocity,  -- Use macro for date difference
    {{ extract_month_year('close_date') }} AS deal_close_month_year  -- Use macro to extract month and year
FROM
    base
WHERE
    close_date IS NOT NULL
