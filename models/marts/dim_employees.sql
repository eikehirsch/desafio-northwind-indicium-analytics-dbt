WITH
    int_employees AS (
        select * 
        from {{ ref('int_employees__self_join') }}
    )

select * from int_employees