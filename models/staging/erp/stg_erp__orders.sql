with 
    source_orders as (
    select * 
    from {{ source('erp', 'orders') }}
),

renamed as (
    select
        CAST(order_id AS INT) AS order_pk
        , CAST(customer_id AS VARCHAR) AS customer_fk
        , CAST(employee_id AS INT) AS employee_fk
        , CAST(ship_via AS INT) AS shipper_fk
        , CAST(order_id AS INT) AS order_number
        , CAST(order_date AS DATE) AS order_date
        , CAST(shipped_date AS DATE) AS ship_date
        , CAST(required_date AS DATE) AS required_delivery_date
        , CAST(freight AS NUMERIC) AS freight
        , CAST(ship_name AS VARCHAR) AS recipient_name
        , CAST(ship_city AS VARCHAR) AS recipient_city
        , CAST(ship_region AS VARCHAR) AS recipient_region
        , CAST(ship_country AS VARCHAR) AS recipient_country
    from source_orders
)

select * from renamed
