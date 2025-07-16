with 
source_products as (
    select * 
    from {{ source('erp', 'products') }}
),

renamed as (
    select
        CAST(product_id AS INT) AS product_pk
        , CAST(supplier_id AS INT) AS supplier_fk
        , CAST(category_id AS INT) AS category_fk
        , CAST(product_name AS VARCHAR) AS product_name
        , CAST(quantity_per_unit AS VARCHAR) AS quantity_per_unit
        , CAST(unit_price AS NUMERIC(18,2)) AS unit_price
        , CAST(units_in_stock AS INT) AS units_in_stock
        , CAST(units_on_order AS INT) AS units_on_order
        , CAST(discontinued AS INT) AS is_discontinued
    from source_products
)

select * from renamed
