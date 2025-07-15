with 
    source_categories as (
    select * 
    from {{ source('erp', 'categories') }}
),

renamed as (
    select
        CAST(category_id AS INT) AS category_pk
        , CAST(category_name AS VARCHAR) AS category_name
        , CAST(description AS VARCHAR) AS category_description
    from source_categories
)

select * from renamed
