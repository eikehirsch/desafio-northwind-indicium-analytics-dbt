with 
    source_suppliers as (
    select * 
    from {{ source('erp', 'suppliers') }}
),

renamed as (
    select
        CAST(supplier_id AS INT) AS supplier_pk
        , CAST(company_name AS VARCHAR) AS supplier_name
        , CAST(address AS VARCHAR) AS supplier_address
        , CAST(city AS VARCHAR) AS supplier_city
        , CAST(region AS VARCHAR) AS supplier_region
        , CAST(country AS VARCHAR) AS supplier_country
        , CAST(phone AS VARCHAR) AS supplier_phone
    from source_suppliers
)

select * from renamed
