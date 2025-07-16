with 
    source_employees as (
    select * 
    from {{ source('erp', 'employees') }}
),

renamed as (
    select
        CAST(employee_id AS INT) AS employee_pk
        , CAST(reports_to AS VARCHAR) AS manager_fk
        , first_name || ' ' || last_name AS employee_name
        , CAST(title AS VARCHAR) AS employee_title
        , CAST(birth_date AS VARCHAR) AS employee_birth_date
        , CAST(hire_date AS VARCHAR) AS employee_hire_date
        , CAST(address AS VARCHAR) AS employee_address
        , CAST(city AS VARCHAR) AS employee_city
        , CAST(region AS VARCHAR) AS employee_region
        , CAST(country AS VARCHAR) AS employee_country
    from source_employees
)

select * from renamed
