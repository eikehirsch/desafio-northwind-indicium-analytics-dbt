with 
    source_orders as (
    select * 
    from {{ source('erp', 'orders') }}
),

renamed as (
    select
        cast(order_id as int) as order_pk
        , cast(customer_id as varchar) as customer_fk
        , cast(employee_id as int) as employee_fk
        , cast(ship_via as int) as shipper_fk
        , cast(order_id as int) as order_number
        , cast(order_date as date) as order_date
        , cast(shipped_date as date) as ship_date
        , cast(required_date as date) as required_delivery_date
        , cast(freight as numeric) as freight
        , cast(ship_name as varchar) as recipient_name
        , cast(ship_city as varchar) as recipient_city
        , cast(ship_region as varchar) as recipient_region
        , cast(ship_country as varchar) as recipient_country
    from source_orders
)

select * from renamed
