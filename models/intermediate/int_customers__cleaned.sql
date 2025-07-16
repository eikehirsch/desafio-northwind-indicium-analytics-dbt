WITH
    --Importing model from staging
    customers AS (
        select * 
        from {{ ref('stg_erp__customers') }}
    ),
    -- Transformation with treatment of nulls
    customers_cleaned AS (
        select 
            customer_pk
            , company_name
            , contact_name
            , contact_title
            , company_address
            , company_city
            , CASE 
                WHEN company_region IS NULL THEN 'N/A'
                ELSE company_region
              END AS company_region
            , company_country
        from customers
    )

select * from customers_cleaned