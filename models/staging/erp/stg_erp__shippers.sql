with 
    source_shippers as (
    select * 
    from {{ source('erp', 'shippers') }}
),

renamed as (
    select
        CAST(shipper_id AS INT) AS shipper_pk
        , CAST(company_name AS VARCHAR) AS shipper_name
        , CAST(phone AS VARCHAR) AS shipper_phone
    from source_shippers
)

select * from renamed
