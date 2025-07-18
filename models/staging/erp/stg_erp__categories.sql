with 
    source_categories as (
    select * 
    from {{ source('erp', 'categories') }}
),

renamed as (
    select
        cast(category_id as int) as category_pk
        , cast(category_name as varchar) as category_name
        , cast(description as varchar) as category_description
    from source_categories
)

select * from renamed
