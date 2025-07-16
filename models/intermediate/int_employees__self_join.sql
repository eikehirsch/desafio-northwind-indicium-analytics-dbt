WITH
    --Importing model from staging
    employees AS (
        select *
        from {{ ref('stg_erp__employees') }}
    ),
    --Transformation with self joining
    joined AS (
        select
            employees.employee_pk AS employee_pk
            , employees.employee_name AS employee_name
            , CASE
                WHEN managers.employee_name IS NULL THEN 'N/A'
                ELSE managers.employee_name
              END AS manager_name
            , employees.employee_title AS employee_title
            , employees.employee_birth_date AS employee_birth_date
            , employees.employee_hire_date AS employee_hire_date
            , employees.employee_address AS employee_address
            , employees.employee_city AS employee_city
            , CASE
                WHEN employees.employee_region IS NULL THEN 'N/A'
                ELSE employees.employee_region
              END AS employee_region
            , employees.employee_country AS employee_country
        from employees AS employees
        left join employees AS managers ON employees.manager_fk = managers.employee_pk
    ),
    cleaned AS (
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

select * from joined