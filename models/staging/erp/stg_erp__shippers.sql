with 
    source_shippers as (
    select * 
    from {{ source('erp', 'shippers') }}
),

renamed as (
    select
        cast(shipper_id as int) as shipper_pk
        , cast(company_name as varchar) as shipper_name
        , cast(phone as varchar) as shipper_phone
    from source_shippers
)

select * from renamed
