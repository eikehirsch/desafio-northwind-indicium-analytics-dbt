-- models/marts/dimensions/dim_calendar.sql

{{ config(materialized='table') }}

WITH dim_calendar AS (
    {{ dbt_date.get_date_dimension("1996-01-01", "1998-12-31") }}
)

SELECT * FROM dim_calendar
