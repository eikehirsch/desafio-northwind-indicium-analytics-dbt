with
    --Importing model from staging
    customers as (
        select * 
        from {{ ref('stg_erp__customers') }}
    ),
    -- Transformation with treatment of nulls
    customers_cleaned as (
        select 
            customer_pk
            , company_name
            , contact_name
            , contact_title
            , company_address
            , company_city
            , case 
                when company_region IS NULL then 'N/A'
                else company_region
              end as company_region
            , company_country
        from customers
    )

select * from customers_cleaned
