{{
  config(
    materialized='table'
  )
}}

WITH source AS (
    SELECT
        *
    FROM {{ source("greenery","promos") }}
),

renamed as (
    SELECT 
        promo_id,
        discount,
        status as promo_status
    FROM source
)

SELECT
    *
FROM renamed