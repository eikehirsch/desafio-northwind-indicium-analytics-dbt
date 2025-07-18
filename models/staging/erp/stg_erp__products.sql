with 
    source_products as (
    select * 
    from {{ source('erp', 'products') }}
),

renamed as (
    select
        cast(product_id as int) as product_pk
        , cast(supplier_id as int) as supplier_fk
        , cast(category_id as int) as category_fk
        , cast(product_name as varchar) as product_name
        , cast(quantity_per_unit as varchar) as quantity_per_unit
        , cast(unit_price as numeric(18,2)) as unit_price
        , cast(units_in_stock as int) as units_in_stock
        , cast(units_on_order as int) as units_on_order
        , cast(discontinued as int) as is_discontinued
    from source_products
)

select * from renamed
