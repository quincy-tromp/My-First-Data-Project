set @start_dt = '2022-09-01';
set @end_dt = '2022-09-30';

select l.transact_type, l.label, sum(transact_amount)
from transactions t
right outer join labels l on l.label = t.label
where l.transact_type = 'Income'
and t.transact_dt between @start_dt and @end_dt
group by t.label
union
select l.transact_type, l.label, sum(transact_amount)
from transactions t
right outer join labels l on l.label = t.label
where l.transact_type = 'Expenses'
and t.transact_dt between @start_dt and @end_dt
group by t.label
union
select l.transact_type, l.label, sum(transact_amount)
from transactions t
right outer join labels l on l.label = t.label
where l.transact_type = 'Savings'
and t.transact_dt between @start_dt and @end_dt
group by t.label;

