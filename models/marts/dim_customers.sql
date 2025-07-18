WITH
    int_customers as (
        select *
        from {{ ref('int_customers__cleaned') }}
    )

select * from int_customers
