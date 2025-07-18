with 
    --Importing model from staging
    suppliers as (
        select *
        from {{ ref('stg_erp__suppliers') }}
    ),
    -- Transformation with treatment of nulls
    cleaned as (
        select 
            supplier_pk
            , supplier_name
            , supplier_address
            , supplier_city
            , case 
                when supplier_region is null then 'N/A'
                else supplier_region
              end as supplier_region
            , supplier_country
            , supplier_phone
        from suppliers
    )

select * from cleaned
