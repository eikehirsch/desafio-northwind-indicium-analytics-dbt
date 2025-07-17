WITH 
    --Importing model from staging
    categories AS (
        select * 
        from {{ ref('stg_erp__categories') }}
    )
    --Importing model from intermediate
    , suppliers AS (
        select *
        from {{ ref('int_suppliers__cleaned') }}
    )
    , products AS (
        select *
        from {{ ref('stg_erp__products') }}
    )
    -- Joining tables
    , joined AS (
        select 
            products.product_pk
            , products.product_name
            , products.quantity_per_unit
            , products.unit_price
            , products.units_in_stock
            , products.units_on_order
            , CASE
                WHEN products.is_discontinued = 0 THEN 'No'
                ELSE 'Yes'
              END AS is_discontinued
            , suppliers.supplier_name
            , suppliers.supplier_address
            , suppliers.supplier_city
            , suppliers.supplier_region
            , suppliers.supplier_country
            , suppliers.supplier_phone
            , categories.category_name
            , categories.category_description
        from products
        left join categories ON products.category_fk = categories.category_pk
        left join suppliers ON products.supplier_fk = supplier_pk
    )
    
    select * from joined
   