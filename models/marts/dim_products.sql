WITH
    int_products AS (
        select *
        from {{ ref('int_products__enriched') }}
    )

select * from int_products