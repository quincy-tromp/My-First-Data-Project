set @start_dt = '2022-09-01';
set @end_dt = '2022-09-30';
select 
    l.transaction_type, 
    l.label, 
    sum(amount) as total_amount
from 
    transactions t
join 
    labels l on l.label = t.label
where 
    t.transaction_dt between @start_dt and @end_dt
group by 
    l.transaction_type, 
    l.label
order by 
    l.transaction_type asc, 
    total_amount asc;