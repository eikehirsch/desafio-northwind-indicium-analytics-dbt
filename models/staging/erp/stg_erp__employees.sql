with 
    source_employees as (
    select * 
    from {{ source('erp', 'employees') }}
),

renamed as (
    select
        cast(employee_id as int) as employee_pk
        , cast(reports_to as varchar) as manager_fk
        , first_name || ' ' || last_name as employee_name
        , cast(title as varchar) as employee_title
        , cast(birth_date as varchar) as employee_birth_date
        , cast(hire_date as varchar) as employee_hire_date
        , cast(address as varchar) as employee_address
        , cast(city as varchar) as employee_city
        , cast(region as varchar) as employee_region
        , cast(country as varchar) as employee_country
    from source_employees
)

select * from renamed
