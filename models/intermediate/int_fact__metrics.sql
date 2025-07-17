WITH
    --Importing models from staging
    order_details AS (
        select *
        from {{ ref('stg_erp__order_details') }}
    )
    , orders AS (
        select *
        from {{ ref('stg_erp__orders') }}
    )
    , joined AS (
        select 
            order_details.order_item_sk
            , order_details.product_fk
            , orders.customer_fk
            , orders.employee_fk
            , orders.shipper_fk
            , orders.order_date
            , orders.ship_date
            , orders.required_delivery_date
            , order_details.discount
            , order_details.unit_price
            , order_details.quantity
            , orders.freight
            , orders.order_number
            , orders.recipient_name
            , orders.recipient_city
            , orders.recipient_region
            , orders.recipient_country
        from order_details
        inner join orders ON order_details.order_fk = orders.order_pk
    )
    , metrics AS (
        select 
           order_item_sk
           , product_fk
           , customer_fk
           , employee_fk
           , shipper_fk
           , order_date
           , ship_date
           , required_delivery_date
           , unit_price
           , quantity
           , discount
           , unit_price * quantity as gross_total
           , unit_price * quantity * (1 - discount) as net_total
           , CAST(
                (freight / count(*) over (partition by order_number)) 
             AS numeric(18,2)) as freight_allocated
           , CASE 
                WHEN discount > 0 THEN 'Yes'
                ELSE 'No'
             END AS had_discount
           , order_number
           , recipient_name
           , recipient_city
           , CASE
                WHEN recipient_region IS NULL THEN 'N/A'
                ELSE recipient_region
             END AS recipient_region
           , recipient_country 
        from joined
    )

select * from metrics