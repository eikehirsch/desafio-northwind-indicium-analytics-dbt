with 
    source_suppliers as (
    select * 
    from {{ source('erp', 'suppliers') }}
),

renamed as (
    select
        cast(supplier_id as int) as supplier_pk
        , cast(company_name as varchar) as supplier_name
        , cast(address as varchar) as supplier_address
        , cast(city as varchar) as supplier_city
        , cast(region as varchar) as supplier_region
        , cast(country as varchar) as supplier_country
        , cast(phone as varchar) as supplier_phone
    from source_suppliers
)

select * from renamed
