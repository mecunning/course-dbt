{{
    config(
        materialized = 'table' 
    )
}}

WITH products AS (
    SELECT 
        DISTINCT product_id,
        price,
        inventory
    FROM  {{ ref('dim_products') }}
),

product_orders AS ( 
    SELECT product_id,
           SUM(quantity) AS total_quantity_sold
    FROM  {{ ref('stg_order_items') }}
    GROUP BY 1
)   

SELECT a.product_id,
       price AS current_price,
       inventory AS current_inventory,
       total_quantity_sold, 
       (total_quantity_sold * price) AS total_revenue
FROM products a
JOIN product_orders b on a.product_id = b.product_id