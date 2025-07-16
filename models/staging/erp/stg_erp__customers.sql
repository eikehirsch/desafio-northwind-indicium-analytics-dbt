with 
    source_customers as (
    select * 
    from {{ source('erp', 'customers') }}
),

renamed as (
    select
        CAST(customer_id AS VARCHAR) AS customer_pk
        , CAST(company_name AS VARCHAR) AS company_name
        , CAST(contact_name AS VARCHAR) AS contact_name
        , CAST(contact_title AS VARCHAR) AS contact_title
        , CAST(address AS VARCHAR) AS company_address
        , CAST(city AS VARCHAR) AS company_city
        , CAST(region AS VARCHAR) AS company_region
        , CAST(country AS VARCHAR) AS company_country
    from source_customers
)

select * from renamed
