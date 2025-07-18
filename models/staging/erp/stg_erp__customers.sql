with 
    source_customers as (
    select * 
    from {{ source('erp', 'customers') }}
),

renamed as (
    select
        cast(customer_id as varchar) as customer_pk
        , cast(company_name as varchar) as company_name
        , cast(contact_name as varchar) as contact_name
        , cast(contact_title as varchar) as contact_title
        , cast(address as varchar) as company_address
        , cast(city as varchar) as company_city
        , cast(region as varchar) as company_region
        , cast(country as varchar) as company_country
    from source_customers
)

select * from renamed
