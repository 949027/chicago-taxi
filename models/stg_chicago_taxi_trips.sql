{{
  config(
    materialized='view'
  )
}}

SELECT
  taxi_id,
  FORMAT_TIMESTAMP('%Y-%m', trip_start_timestamp) as year_month,
  SUM(tips) AS tips_sum
FROM 
  `bigquery-public-data.chicago_taxi_trips.taxi_trips`
WHERE tips > 0
GROUP BY taxi_id, year_month
