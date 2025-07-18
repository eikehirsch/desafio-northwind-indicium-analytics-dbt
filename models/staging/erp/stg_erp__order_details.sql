with 
    source_order_details as (
    select * 
    from {{ source('erp', 'order_details') }}
),

renamed as (
    select
        {{ dbt_utils.generate_surrogate_key(['order_id', 'product_id']) }} as order_item_sk
        , cast(order_id as int) as order_fk
        , cast(product_id as int) as product_fk
        , cast(unit_price as numeric(18, 2)) as unit_price
        , cast(quantity as int) as quantity
        , cast(discount as numeric(18, 2)) as discount
    from source_order_details
)

select * from renamed
