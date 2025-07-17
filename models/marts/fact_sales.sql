WITH
    int_fact AS (
        select *
        from {{ ref('int_fact__metrics') }}
    )

select * from int_fact