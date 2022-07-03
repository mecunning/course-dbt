{{
    config(
        materialized = 'table' 
    )
}}


SELECT  
        SUM(page_view_sessions::float)/SUM(total_sessions::float) as page_view_total_pct,
        SUM(page_view_sessions::float)/SUM(total_sessions::float) as session_to_page_view_pct,
        SUM(add_to_cart_sessions::float)/SUM(total_sessions::float) as add_to_cart_total_pct,
        SUM(add_to_cart_sessions::float)/SUM(page_view_sessions::float) as page_view_to_cart_pct,
        SUM(checkout_sessions::float)/SUM(total_sessions::float) as checkout_total_pct,
        SUM(checkout_sessions::float)/SUM(add_to_cart_sessions::float) as cart_to_checkout_pct
FROM {{ ref('int_funnel') }}