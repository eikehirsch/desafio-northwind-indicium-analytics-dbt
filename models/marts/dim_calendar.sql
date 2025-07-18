-- models/marts/dimensions/dim_calendar.sql

{{ config(materialized='table') }}

with dim_calendar as (
    {{ dbt_date.get_date_dimension("1996-01-01", "1998-12-31") }}
)

select * from dim_calendar
