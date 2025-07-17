/*
    This test ensures that the total net sales for years between 1996 and 1998 match
    the audited accounting value: R$ 1,265,793.04
*/

with net_sales_1996_1998 as (
    select sum(net_total) as total
    from {{ ref('int_fact__metrics') }}
    where order_date between '1996-01-01' and '1998-12-31'
)

select *
from net_sales_1996_1998
where total not between 1265793.01 and 1265793.07