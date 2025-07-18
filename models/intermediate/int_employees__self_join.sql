with
    --Importing model from staging
    employees as (
        select *
        from {{ ref('stg_erp__employees') }}
    ),
    --Self joining
    joined as (
        select
            employees.employee_pk
            , employees.employee_name
            , managers.employee_name as manager_name
            , employees.employee_title
            , employees.employee_birth_date
            , employees.employee_hire_date
            , employees.employee_address
            , employees.employee_city
            , employees.employee_region
            , employees.employee_country
        from employees as employees
        left join employees as managers on employees.manager_fk = managers.employee_pk
    ),
    --Treatment of nulls
    cleaned as (
        select 
        employee_pk
        , employee_name
        , case
            when manager_name is null then 'N/A'
            else manager_name
          end as manager_name
        , employee_title
        , employee_birth_date
        , employee_hire_date
        , employee_address
        , employee_city
        , case
            when employee_region is null then 'N/A'
            else employee_region
          end as employee_region
        , employee_country
        from joined
    )

select * from cleaned
