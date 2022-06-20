{{
    config(
        materialized = 'table' 
    )
}}

WITH promos AS (
    SELECT 
        * 
    FROM  {{ ref('stg_promos') }}
),

promo_orders as (
    SELECT 
        promo_id,
        COUNT(DISTINCT order_id) AS promo_used_count,
        SUM(order_total) AS promo_order_total,
        MAX(created_at_utc) AS promo_last_used_at_utc
    FROM {{ ref('stg_orders') }}
    GROUP BY 1
)

SELECT 
    a.promo_id,
    discount,
    promo_status,
    promo_used_count,
    promo_order_total,
    promo_last_used_at_utc
FROM promos a
JOIN promo_orders b ON a.promo_id = b.promo_id