{{
  config(
    materialized='table',
    unique_key = ['taxi_id', 'year_month']
  )
}}

WITH top_04_2018 AS (
  SELECT taxi_id
  FROM {{ref('stg_chicago_taxi_trips')}}
  WHERE year_month = '2018-04'
  ORDER BY tips_sum DESC
  LIMIT 3
)

SELECT
  taxi_id,
  year_month,
  ROUND(tips_sum, 2) as tips_sum,
  ROUND(tips_sum / LAG(tips_sum) OVER w * 100 - 100, 2) AS tips_change
FROM {{ref('stg_chicago_taxi_trips')}}
WHERE 
  taxi_id IN (SELECT taxi_id FROM top_04_2018)
  AND year_month >= '2018-04'
  
  {% if is_incremental() %}
  AND year_month >= (SELECT max(year_month) FROM {{ this }})
  {% endif %}
  
WINDOW w AS (PARTITION BY taxi_id ORDER BY year_month)
