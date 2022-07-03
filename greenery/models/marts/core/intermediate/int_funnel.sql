{{
    config(
        materialized = 'view' 
    )
}}


SELECT 
    date_trunc('DAY', session_started_at_utc) as session_date_utc,
    count(session_id) as total_sessions,
    count(CASE when page_view >= 1 THEN 1 END) AS page_view_sessions,
    count(CASE when add_to_cart >= 1 THEN 1 END) AS add_to_cart_sessions,
    count(CASE when checkout >= 1 THEN 1 END) AS checkout_sessions
FROM  {{ ref('fact_sessions') }}
    GROUP BY 1