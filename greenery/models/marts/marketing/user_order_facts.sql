{{
    config(
        materialized = 'table' 
    )
}}

WITH users AS (
    SELECT 
        DISTINCT user_id
    FROM  {{ ref('dim_users') }}
),

user_orders AS ( 
    SELECT user_id,
           COUNT(distinct order_id) as orders_count,
           COUNT(promo_id) as promos_count,
           MIN(created_at_utc) as first_order_utc,
           MAX(created_at_utc) as last_order_utc, 
           SUM(order_total) as lifetime_order_total
    FROM  {{ ref('stg_orders') }}
    GROUP BY 1
)   

SELECT a.user_id,
       orders_count,
       promos_count,
       first_order_utc,
       last_order_utc,
       lifetime_order_total
FROM users a
JOIN user_orders b on a.user_id = b.user_id