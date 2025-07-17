/*
    This test ensures that the gross sales for years between 1996 and 1998 match
    the audited accounting value: R$ 1,354,458.59
*/

with sales_1996_1998 as (
    select sum(gross_total) as total
    from {{ ref('int_fact__metrics') }}
    where order_date between '1996-01-01' and '1998-12-31'
)

select *
from sales_1996_1998
where total not between 1354458.56 and 1354458.62