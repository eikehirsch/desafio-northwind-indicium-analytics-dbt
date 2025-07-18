with
    int_fact as (
        select *
        from {{ ref('int_fact__metrics') }}
    )

select * from int_fact
