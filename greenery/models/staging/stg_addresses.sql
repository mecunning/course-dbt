{{
  config(
    materialized='table'
  )
}}



WITH source AS (
    SELECT
        *
    FROM
        {{ source("greenery","addresses") }}
),

renamed AS (
    SELECT
        address_id,
        address,
        zipcode,
        state,
        country
    FROM
        source
)

SELECT
    *
FROM renamed