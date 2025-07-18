with 
    --Importing model from staging
    categories as (
        select * 
        from {{ ref('stg_erp__categories') }}
    )
    --Importing model from intermediate
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
            , case
                when products.is_discontinued = 0 then 'Não'
                else 'Sim'
              end as is_discontinued
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
    
    select * from joined
   