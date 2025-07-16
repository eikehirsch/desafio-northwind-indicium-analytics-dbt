with 
    source_order_details as (
    select * 
    from {{ source('erp', 'order_details') }}
),

renamed as (
    select
        {{ dbt_utils.generate_surrogate_key(['order_id', 'product_id']) }} as order_item_sk
        , CAST(order_id AS INT) AS order_fk
        , CAST(product_id AS INT) AS product_fk
        , CAST(unit_price AS numeric(18, 2)) AS unit_price
        , CAST(quantity AS INT) AS quantity
        , CAST(discount AS numeric(18, 2)) AS discount
    from source_order_details
)

select * from renamed
