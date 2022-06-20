{{
  config(
    materialized='table'
  )
}}

WITH source AS (
    SELECT
        *
    FROM {{ source("greenery","users") }}
),

renamed as (
    SELECT 
        user_id,
        first_name,
        last_name,
        email,
        phone_number,
        created_at as created_at_utc,
        updated_at as updated_at_utc,
        address_id
    FROM source
)

SELECT
    *
FROM renamed