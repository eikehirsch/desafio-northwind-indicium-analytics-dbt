WITH 
    stg_shippers AS (
        select * 
        from {{ ref('stg_erp__shippers') }}
    )

select * from stg_shippers