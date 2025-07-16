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
            , managers.employee_name AS manager_name
            , employees.employee_title AS employee_title
            , employees.employee_birth_date AS employee_birth_date
            , employees.employee_hire_date AS employee_hire_date
            , employees.employee_address AS employee_address
            , employees.employee_city AS employee_city
            , employees.employee_region AS employee_region
            , employees.employee_country AS employee_country
        from employees AS employees
        left join employees AS managers ON employees.manager_fk = managers.employee_pk
    )

select * from joined