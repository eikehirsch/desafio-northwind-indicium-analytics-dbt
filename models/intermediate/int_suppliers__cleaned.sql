WITH 
    --Importing model from staging
    suppliers AS (
        select *
        from {{ ref('stg_erp__suppliers') }}
    ),
    -- Transformation with treatment of nulls
    suppliers_cleaned AS (
        select 
            supplier_pk
            , supplier_name
            , supplier_address
            , supplier_city
            , CASE 
                WHEN supplier_region IS NULL THEN 'N/A'
                ELSE supplier_region
              END AS supplier_region
            , supplier_country
            , supplier_phone
        from suppliers
    )

select * from suppliers_cleaned