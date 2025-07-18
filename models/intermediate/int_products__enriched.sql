with 
    --Importing models from staging
    categories as (
        select * 
        from {{ ref('stg_erp__categories') }}
    )
    , suppliers as (
        select *
        from {{ ref('int_suppliers__cleaned') }}
    )
    , products as (
        select *
        from {{ ref('stg_erp__products') }}
    )
    -- Joining tables
    , joined as (
        select 
            products.product_pk
            , products.product_name
            , products.quantity_per_unit
            , products.unit_price
            , products.units_in_stock
            , products.units_on_order
            , products.is_discontinued
            , suppliers.supplier_name
            , suppliers.supplier_address
            , suppliers.supplier_city
            , suppliers.supplier_region
            , suppliers.supplier_country
            , suppliers.supplier_phone
            , categories.category_name
            , categories.category_description
        from products
        left join categories on products.category_fk = categories.category_pk
        left join suppliers on products.supplier_fk = supplier_pk
    )
    -- Table enrichment
    , enriched as (
        select
             product_pk
            , product_name
            , quantity_per_unit
            , unit_price
            , units_in_stock
            , units_on_order
            , case
                when is_discontinued = 0 then 'Não'
                else 'Sim'
              end as is_discontinued
            , supplier_name
            , supplier_address
            , supplier_city
            , supplier_region
            , supplier_country
            , supplier_phone
            , category_name
            , category_description
        from joined
    )
    select * from enriched
   