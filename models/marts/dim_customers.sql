WITH
    int_customers AS (
        select *
        from {{ ref('int_customers__cleaned') }}
    )

select * from int_customers