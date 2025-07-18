with
    --Importing model from staging
    employees as (
        select *
        from {{ ref('stg_erp__employees') }}
    ),
    --Transformation with self joining
    joined as (
        select
            employees.employee_pk AS employee_pk
            , employees.employee_name AS employee_name
            , case
                when managers.employee_name IS NULL then 'N/A'
                else managers.employee_name
              end as manager_name
            , employees.employee_title as employee_title
            , employees.employee_birth_date as employee_birth_date
            , employees.employee_hire_date as employee_hire_date
            , employees.employee_address as employee_address
            , employees.employee_city as employee_city
            , case
                when employees.employee_region IS NULL then 'N/A'
                else employees.employee_region
              end as employee_region
            , employees.employee_country as employee_country
        from employees as employees
        left join employees as managers on employees.manager_fk = managers.employee_pk
    ),
    cleaned as (
        select 
        employee_pk
        , employee_name
        , manager_name
        , employee_title
        , employee_birth_date
        , employee_hire_date
        , employee_address
        , employee_city
        , employee_region
        , employee_country
        from joined
    )

select * from cleaned
