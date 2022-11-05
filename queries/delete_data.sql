set @date = '2022-09-01';
delete from transactions
where transaction_dt >= @date;