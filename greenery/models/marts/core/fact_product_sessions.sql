{{
    config(
        materialized = 'table' 
    )
}}


SELECT 
    session_id,
    user_id,
    product_id,
    {{ session_events() }},
    MIN(created_at_utc) AS session_started_at_utc
FROM  {{ ref('stg_events') }}
    GROUP BY 1,2,3