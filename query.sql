set @start_dt = '2022-09-01';
set @end_dt = '2022-09-30';

select l.transaction_type, l.label, sum(transact_amount)
from transactions t
right outer join labels l on l.label = t.label
where l.transaction_type = 'Income'
and t.transaction_dt between @start_dt and @end_dt
group by t.label
union
select l.transaction_type, l.label, sum(transact_amount)
from transactions t
right outer join labels l on l.label = t.label
where l.transaction_type = 'Expenses'
and t.transaction_dt between @start_dt and @end_dt
group by t.label
union
select l.transaction_type, l.label, sum(transact_amount)
from transactions t
right outer join labels l on l.label = t.label
where l.transaction_type = 'Savings'
and t.transaction_dt between @start_dt and @end_dt
group by t.label;
